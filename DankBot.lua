--DankBot v2.0 by ThunderAxe31
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
	while (func(argument) == check_value) == check_type do
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

client.unpause()
if emu.framecount() == 0 then emu.frameadvance() end
local get_emu_time = emu.totalexecutedcycles
if emu.totalexecutedcycles() == 0 then
	get_emu_time = emu.framecount
end
console.clear()
client.pause()

local function state_add(alt)
	local cyclecount = get_emu_time()
	local rng = get_rng() --this function must be present in route.lua
	
	local is_double = false--this code block prevents creating double saves
	for z = 1, #state[current_action] do
		if (action[current_action][z]["branch"] == action[current_action][alt]["branch"]) and
		not action[current_action][alt]["no_duplicate_removal"] then
			for i = 1, #state[current_action][z] do
				if (state[current_action][z][i]["rng"] == rng) then
					if z == alt and (state[current_action][z][i]["cycle"] > cyclecount) then--use with caution. disable if you want to be verbose
						savestate.save(state[current_action][z][i]["slot"], true)
						state[current_action][z][i]["cycle"] = cyclecount
						state[current_action][z][i]["rng"] = rng
						log_update("   Replaced savestate " .. current_action .. "-" .. z .. "-" .. i .. ", cycle " .. cyclecount)
					end
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
					state[current_action][alt][i]["cycle"] = cyclecount
					state[current_action][alt][i]["rng"] = rng
					log_update("   Added savestate " .. current_action .. "-" .. alt .. "-" .. i .. ", cycle " .. cyclecount)
					break
				end
			end
		else
			local maximum = state[current_action][alt][1]["cycle"]
			local maximum_index = 1
			for i=2, max_states do
				if state[current_action][alt][i]["cycle"] > maximum then
					maximum = state[current_action][alt][i]["cycle"]
					maximum_index = i
				end
			end
			if (state[current_action][alt][maximum_index]["cycle"] > cyclecount) then
				savestate.save(state[current_action][alt][maximum_index]["slot"], true)
				state[current_action][alt][maximum_index]["cycle"] = cyclecount
				state[current_action][alt][maximum_index]["rng"] = rng
				log_update("   Replaced savestate " .. current_action .. "-" .. alt .. "-" .. maximum_index .. ", cycle " .. cyclecount)
			end
		end
	end
end

local function act(action_type, alts)
	for alt = 1, #action[current_action] do
		log_update(" Action " .. current_action .. ", type: " .. action[current_action].func.name .. ", alt " .. alt)
		for alt_num = 1, #state[current_action-1] do
			for state_num = 1, #state[current_action-1][alt_num] do
				
				if (action[current_action-1][alt_num]["branch"] ~= nil) and (action[current_action][alt]["branch"] ~= nil) and
				(action[current_action-1][alt_num]["branch"] ~= action[current_action][alt]["branch"]) then
					break
				end
				
				log_update("  Looking from state " .. current_action-1 .. "-" .. alt_num .. "-" .. state_num)
				
				savestate.load(state[current_action-1][alt_num][state_num]["slot"], true)
				
				if action[current_action].func.prepare(alts[alt]) then
				
					local max_wait = global_max_wait
					if action[current_action][alt]["custom_wait"] ~= nil then
						max_wait = action[current_action][alt]["custom_wait"]
					end
					
					local wait_step = global_wait_step
					if action[current_action][alt]["custom_wait_step"] ~= nil then
						wait_step = action[current_action][alt]["custom_wait_step"]
					end
					
					local temp_state = memorysavestate.savecorestate()
					
					for wait=0, max_wait, wait_step do						
						memorysavestate.loadcorestate(temp_state)
						
						for i=1, wait do--we wait for a given amount of frames
							emu.frameadvance()
						end
						
						if action[current_action].func.execute(alts[alt]) then
							state_add(alt)
						end
					end
					
					memorysavestate.removestate(temp_state)
				end
			end
		end
		if state[current_action][alt][1] == nil then--check if this function call failed to progress the botting
			log_update("  WARNING: Failed to meet requirements for alt " .. alt)
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
		log_update("DankBot v2.0 by ThunderAxe31")
		log_update("Botting session STARTED on " .. os.date("%y/%m/%d %X"))
	end
end

movie.setrerecordcounting(false)
movie.setreadonly(false)
client.frameskip(9)
client.unpause()

while current_action <= #action do--this is the main code block that controls the botting flow
	log_update("Start of action " .. current_action .. " on " .. os.date("%y/%m/%d %X"))
	
	act(action[current_action].func, action[current_action])
	
	local is_failed = true
	for z=1, #state[current_action] do
		if state[current_action][z][1] ~= nil then
			is_failed = false
			break
		end
	end
	
	if is_failed then
		log_update(" ERROR: Failed to meet any requirement for action " .. current_action)
		log_update("Botting session FAILED on " .. os.date("%y/%m/%d %X"))
		action = #action+1 --this will prevent to display "botting session suspended" message
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
				log_update(" Closing with savestate " .. current_action .. "-" .. minimum_alt .. "-" .. minumum_index .. ", cycle " .. state[current_action][minimum_alt][minumum_index]["cycle"])
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
