--DankBot v2.1 by ThunderAxe31
--optimized for use on Gambatte with equal_length_frames set to False
--place this script into its own folder, because it's going generate multiple files
--todo: implement automatic sanity check of route.lua; make it compatible with FCEUX

function table.val_to_str ( v )
  if "string" == type( v ) then
    v = string.gsub( v, "\n", "\\n" )
    if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type( v ) and table.tostring( v ) or
      tostring( v )
  end
end

function table.key_to_str ( k )
  if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
    return k
  else
    return "[" .. table.val_to_str( k ) .. "]"
  end
end

function table.tostring( tbl )
  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

local function log_update(text, no_write_console)
	file_log = io.open("log.txt", "a")
	io.output(file_log)
	io.write(text .. "\n")
	io.close(file_log)
	console.log(text)
end

check_same = true
check_diff = false
freezes = 0

function check_freeze(time_limit, check_type, check_value, func, argument)
	local count = 0
	while ((argument == nil) and ((func() == check_value) == check_type))
	or ((argument ~= nil) and ((func(argument) == check_value) == check_type)) do
		count = count +1
		if count > time_limit then
			freezes = freezes +1
			log_update("  WARNING: game appears to be frozen. Saving to freeze-" .. freezes .. ".bk2")
			movie.save("freeze-" .. freezes)
			return false
		end
		emu.frameadvance()
	end
	return true
end

local action = dofile("route.lua") --this is where the bot takes your customizable botting data for making your TAS
--the following lines are used to fallback to default values, in case these aren't declared in the route.lua
global_max_states = global_max_states or 10 --maximum amount of states to be kept for each action
global_min_wait   = global_min_wait   or  0 --minimum amount of frames to wait before attempting an action
global_max_wait   = global_max_wait   or 10 --maximum amount of frames to wait before attempting an action
global_wait_step  = global_wait_step  or  1 --interval of frame increase between action attempts

action[0] = {}
action[0][1] = {}

local state = {}
for i = 1, #action do --initializes the array of the savestate data
	state[i] = {}
	for l = 1, #action[i] do
		state[i][l] = {}
	end
end
state[0] = {}
state[0][1] = {}
state[0][1][1] = {}
state[0][1][1]["slot"] = "0-1-1.State"

local current_action = 1

local function close_session()
	if current_action < #action+1 then
		log_update("Botting session SUSPENDED on " .. os.date("%y/%m/%d %X"))
	end
	movie.setreadonly(true)
	movie.setrerecordcounting(true)--maybe this is just unnecessary and annoying, and movie.setreadonly()+savestate.load() does better the job
	movie.stop()
	memorysavestate.clearstatesfrommemory()--just in case
	client.frameskip(0)
	client.pause()
end
event.onexit(close_session)

local time_unit = ", cycle "
client.unpause()
local temp_state = memorysavestate.savecorestate()
if emu.framecount() == 0 then emu.frameadvance() end
local get_emu_time = emu.totalexecutedcycles
if emu.totalexecutedcycles() == 0 then
	get_emu_time = emu.framecount
	time_unit = ", frame "
end
memorysavestate.loadcorestate(temp_state)
memorysavestate.removestate(temp_state)
console.clear()
client.pause()

local function state_add(alt, wait)
	local cycle = get_emu_time()
	local rng = nil
	local rng_display = ""
	if get_rng then
		rng = get_rng() --this function must be present in route.lua
		rng_display = ", RNG " .. string.format("%X", rng)
	end
	
	local is_double = false--this code block prevents creating double saves
	for z = 1, #state[current_action] do
		if (action[current_action][z]["branch"] == action[current_action][alt]["branch"]) and
		not action[current_action][alt]["no_duplicate_removal"] then
			for i = 1, #state[current_action][z] do
				if (state[current_action][z][i]["rng"] == rng) and (rng ~= nil)
				and (state[current_action][z][i]["cycle"] == cycle) then
					is_double = true
					z = #state[current_action] +1
					break
				end
			end
		end
	end
	if is_double == false then
		local max_states = global_max_states
		if action[current_action][alt]["custom_states"] ~= nil then
			max_states = action[current_action][alt]["custom_states"]
		end
		
		if state[current_action][alt][max_states] == nil then
			for i=1, max_states do
				if state[current_action][alt][i] == nil then
					state[current_action][alt][i] = {}
					state[current_action][alt][i]["slot"] = current_action .. "-" .. alt .. "-" .. i .. ".State"
					savestate.save(state[current_action][alt][i]["slot"], true)
					state[current_action][alt][i]["cycle"] = cycle
					state[current_action][alt][i]["rng"] = rng
					log_update("   Added state " .. current_action .. "-" .. alt .. "-" .. i .. ", wait " .. wait .. time_unit .. cycle .. rng_display)
					break
				end
			end
		else
			local maximum_index = 1
			for i=2, max_states do
				if state[current_action][alt][i]["cycle"] > state[current_action][alt][maximum_index]["cycle"] then
					maximum_index = i
				end
			end
			if (state[current_action][alt][maximum_index]["cycle"] > cycle) then
				savestate.save(state[current_action][alt][maximum_index]["slot"], true)
				state[current_action][alt][maximum_index]["cycle"] = cycle
				state[current_action][alt][maximum_index]["rng"] = rng
				log_update("   Replaced state " .. current_action .. "-" .. alt .. "-" .. maximum_index .. ", wait " .. wait .. time_unit .. cycle .. rng_display)
			end
		end
	end
end

local function act(action_type, alts)
	for alt = 1, #action[current_action] do
		log_update(" Action " .. current_action .. ", Type: " .. action[current_action].func.name .. ", Alt " .. alt .. " of " .. #action[current_action])
		for alt_num = 1, #state[current_action-1] do
			for state_num = 1, #state[current_action-1][alt_num] do
				
				if (action[current_action-1][alt_num]["branch"] ~= nil) and (action[current_action][alt]["branch"] ~= nil) and
				(action[current_action-1][alt_num]["branch"] ~= action[current_action][alt]["branch"]) then
					break
				end
				
				log_update("  Looking from state " .. current_action-1 .. "-" .. alt_num .. "-" .. state_num)
				
				savestate.load(state[current_action-1][alt_num][state_num]["slot"], true)
				
				if action[current_action].func.prepare(alts[alt]) then
				
					local min_wait = global_min_wait
					if action[current_action][alt]["custom_min_wait"] ~= nil then
						min_wait = action[current_action][alt]["custom_min_wait"]
					end
				
					local max_wait = global_max_wait
					if action[current_action][alt]["custom_max_wait"] ~= nil then
						max_wait = action[current_action][alt]["custom_max_wait"]
					elseif action[current_action][alt]["custom_wait"] ~= nil then--included for retro-compatibility
						max_wait = action[current_action][alt]["custom_wait"]
					end
					
					local wait_step = global_wait_step
					if action[current_action][alt]["custom_wait_step"] ~= nil then
						wait_step = action[current_action][alt]["custom_wait_step"]
					end
					
					local temp_state = memorysavestate.savecorestate()
					
					for wait=min_wait, max_wait, wait_step do						
						memorysavestate.loadcorestate(temp_state)
						
						for i=1, wait do--we wait for a given amount of frames
							emu.frameadvance()
						end
						
						local max_states = global_max_states
						if action[current_action][alt]["custom_states"] ~= nil then
							max_states = action[current_action][alt]["custom_states"]
						end
						if state[current_action][alt][max_states] ~= nil then
							local maximum_index = 1
							for i=2, max_states do
								if state[current_action][alt][i]["cycle"] > state[current_action][alt][maximum_index]["cycle"] then
									maximum_index = i
								end
							end
							if get_emu_time() > state[current_action][alt][maximum_index]["cycle"] then
								break
							end
						end
						
						if action[current_action].func.execute(alts[alt]) then
							state_add(alt, wait)
						end
					end
					
					memorysavestate.removestate(temp_state)
				end
			end
		end
		if state[current_action][alt][1] == nil then--check if this function call failed to progress the botting
			log_update("  WARNING: Failed to meet requirements for Alt " .. alt)
		end
	end
end

if not movie.isloaded() then --since there is no function to create a new movie, the user must open a movie before launching the script
	current_action = false
	console.log("No movie file loaded, script execution aborted.")
	current_action = #action+1
else
	local file_resume = io.open("resume.lua", "r")
	if file_resume then --this block checks for resume.lua and resumes a suspended session
		io.input(file_resume)
		local file_resume_data = io.read()
		io.close(file_resume)
		if file_resume_data then
			if string.sub(file_resume_data, 1, 7) == "return " then
				local resume_data = dofile("resume.lua")
				if type(resume_data) == "table" and
				type(resume_data["restart_action"]) == "number" and
				resume_data["restart_action"] <= #action+1 and
				resume_data["restart_action"] > 0 then
					current_action = resume_data["restart_action"]
					resume_data["restart_action"] = nil
					state[current_action-1] = resume_data
					if current_action == #action+1 then
						console.log("Previous session is already complete. Add more actions or delete resume.lua")
					else
						log_update("Botting session RESUMED   on " .. os.date("%y/%m/%d %X"))
					end
				else
					console.log("ERROR: Invalid resume data found in resume.lua")
					current_action = #action+1
				end
			else
				console.log("ERROR: Invalid resume data found in resume.lua")
				current_action = #action+1
			end
		else
			console.log("ERROR: Unable to read resume.lua")
			current_action = #action+1
		end
	else --if resume.lua doesn't exist, wipe log.txt and start a new session from scratch
		local file_log = io.open("log.txt", "w")
		io.output(file_log)
		io.write("")
		io.close(file_log)
		savestate.save(state[0][1][1]["slot"], true)
		console.clear()
		log_update("DankBot v2.1 by ThunderAxe31, session STARTED")
		local rng_display = ""
		if get_rng then
			rng_display = ", RNG " .. string.format("%X", get_rng())
		end
		log_update(" Initializing state 0-1-1" .. time_unit .. get_emu_time() .. rng_display)
	end
	if get_rng == nil then
		log_update("WARNING: get_rng() function not declared in route.lua")
	end
end

movie.setrerecordcounting(false)
movie.setreadonly(false)
client.frameskip(9)
client.unpause()

while current_action <= #action do--this is the main code block that controls the botting flow
	log_update("Start of Action " .. current_action .. " on " .. os.date("%y/%m/%d %X"))
	
	act(action[current_action].func, action[current_action])
	
	local is_failed = true
	for z=1, #state[current_action] do
		if state[current_action][z][1] ~= nil then
			is_failed = false
			break
		end
	end
	
	if is_failed then
		log_update(" ERROR: Failed to meet any requirement for Action " .. current_action)
		log_update("Botting session FAILED on " .. os.date("%y/%m/%d %X"))
		current_action = #action+1 --this will prevent to display "botting session suspended" message
	else
		if not movie.isloaded() then --we don't want to store savestates that don't contain movie inputs
			log_update("Movie file has been closed, script execution aborted.")
			log_update("Botting session INTERRUPTED on " .. os.date("%y/%m/%d %X"))
			current_action = #action+1
		else
			if current_action == #action then--it's over! let's load the best state.
				local minimum = state[current_action][1][1]["cycle"]
				local minumum_index = 1
				local minimum_alt   = 1
				for z=1, #state[current_action] do
					for i=1, #state[current_action][z] do
						if state[current_action][z][i]["cycle"] ~= nil then
							if state[current_action][z][i]["cycle"] < minimum then
								minimum = state[current_action][z][i]["cycle"]
								minumum_index = i
								minimum_alt = z
							end
						end
					end
				end
				log_update(" Closing with state " .. current_action .. "-" .. minimum_alt .. "-" .. minumum_index .. time_unit .. state[current_action][minimum_alt][minumum_index]["cycle"])
				savestate.load(state[current_action][minimum_alt][minumum_index]["slot"], true)
				log_update("Botting session COMPLETED on " .. os.date("%y/%m/%d %X"))
			end
			
			for z=1, #state[current_action-1] do --this deletes the old savestate files from disk
				for i=1, #state[current_action-1][z] do
					os.remove(state[current_action-1][z][i]["slot"])
					state[current_action-1][z][i]["slot"]       = nil
					state[current_action-1][z][i]["cycle"]      = nil
					state[current_action-1][z][i]["rng"]        = nil
					state[current_action-1][z][i]               = nil
				end
				state[current_action-1][z] = nil
			end
			state[current_action-1] = nil
			
			state[current_action]["restart_action"] = current_action +1
			file_resume = io.open("resume.lua", "w")
			io.output(file_resume)
			io.write("return " .. table.tostring(state[current_action])) --save state data for resuming
			io.close(file_resume)
			current_action = current_action +1
		end
	end
end
