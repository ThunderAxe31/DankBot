--DankBot v2.1 by ThunderAxe31
--works with BizHawk (not 2.5 & 2.5.1) and FCEUX 2.2.3
--optimized for use on Gambatte with equal_length_frames set to False
--place this script into its own folder, because it's going generate multiple files
--make sure a proper route.lua file is placed in the same folder
--todo: implement automatic sanity check of route.lua; implement multiple state add

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

local text_output = 0
if console and console.log then
	text_output = console.log
elseif emu and emu.print then
	text_output = emu.print
else
	text_output = print
end

local pause = 0
if client and client.pause then
	pause = client.pause
elseif emu and emu.pause then
	pause = emu.pause
end

local unpause = 0
if client and client.unpause then
	unpause = client.unpause
elseif emu and emu.unpause then
	unpause = emu.unpause
end

local registerexit = 0
if event and event.onexit then
	registerexit = event.onexit
elseif emu and emu.registerexit then
	registerexit = emu.registerexit
end

local rerecordcounting = movie.setrerecordcounting or movie.rerecordcounting
local movie_is_loaded = movie.isloaded or movie.active
get_emu_time = emu.framecount() --this must stay global!

local function log_update(text)
	file_log = io.open("log.txt", "a")
	io.output(file_log)
	io.write(text .. "\n")
	io.close(file_log)
	text_output(text)
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
			if movie.save then
				log_update("  WARNING: game appears to be frozen. Saving to freeze-" .. freezes .. ".bk2")
				movie.save("freeze-" .. freezes)
			else
				log_update("  WARNING: game appears to be frozen.")
			end
			return false
		end
		emu.frameadvance()
	end
	return true
end

action = dofile("route.lua") --this is where the bot takes your customizable botting data for making your TAS
--the following lines are used to fallback to default values, in case these aren't declared in the route.lua
global_max_states = global_max_states or 10 --maximum amount of states to be kept for each action
global_min_wait   = global_min_wait   or  0 --minimum amount of frames to wait before attempting an action
global_max_wait   = global_max_wait   or 10 --maximum amount of frames to wait before attempting an action
global_wait_step  = global_wait_step  or  1 --interval of frame increase between action attempts

action[0] = {}
action[0][1] = {}

state = {} --initializes the array of the savestate data
state[0] = {}
state[0][1] = {}
state[0][1][1] = {}
if tastudio then --simple way of confirming if we're using BizHawk
	state[0][1][1]["slot"] = "0-1-1.State"
elseif taseditor then --otherwise, we'll just assume we're using FCEUX
	state[0][1][1]["slot"] = savestate.object()
	savestate.load(state[0][1][1]["slot"])
end

local current_action = 1

local function close_session()
	if current_action < #action+1 then
		log_update("Botting session SUSPENDED on " .. os.date("%y/%m/%d %X"))
	end
	movie.setreadonly(true)
	rerecordcounting(true)--maybe this is just unnecessary and annoying, and movie.setreadonly()+savestate.load() does better the job
	if movie_is_loaded() then
		movie.stop()
	end
	if memorysavestate and memorysavestate.clearstatesfrommemory then
		memorysavestate.clearstatesfrommemory()--just in case
	end
	if client and client.frameskip then
		client.frameskip(0)
	end
	pause()
end
if (tastudio == nil) and (taseditor == nil) then
	text_output("ERROR: This script currently only works in BizHawk or FCEUX.")
	current_action = #action+1
end
registerexit(close_session)

local time_unit = ", frame "
get_emu_time = emu.framecount
if emu.totalexecutedcycles then
	unpause()
	local temp_state = memorysavestate.savecorestate()
	if emu.framecount() == 0 then emu.frameadvance() end
	if emu.totalexecutedcycles() ~= 0 then
		get_emu_time = emu.totalexecutedcycles
		time_unit = ", cycle "
	end
	memorysavestate.loadcorestate(temp_state)
	memorysavestate.removestate(temp_state)
	console.clear()
	pause()
end

local function state_add(alt, wait, parent)
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
		local max_states = action[current_action][alt]["custom_states"] or action[current_action][alt]["custom_max_states"] or global_max_states
		
		if state[current_action][alt][max_states] == nil then
			for i=1, max_states do
				if state[current_action][alt][i] == nil then
					state[current_action][alt][i] = {}
					if tastudio then --simple way of confirming if we're using BizHawk
						state[current_action][alt][i]["slot"] = current_action .. "-" .. alt .. "-" .. i .. ".State"
						savestate.save(state[current_action][alt][i]["slot"], true)
					else --otherwise, we'll just assume we're using FCEUX
						state[current_action][alt][i]["slot"] = savestate.object()
						savestate.save(state[current_action][alt][i]["slot"])
					end
					state[current_action][alt][i]["parent"] = parent --this is necessary for drawing the graphical output
					state[current_action][alt][i]["wait"] = wait
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
				if tastudio then --simple way of confirming if we're using BizHawk
					savestate.save(state[current_action][alt][maximum_index]["slot"], true)
				else --otherwise, we'll just assume we're using FCEUX
					savestate.save(state[current_action][alt][maximum_index]["slot"])
				end
				state[current_action][alt][maximum_index]["wait"] = wait
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
				
				if tastudio then --simple way of confirming if we're using BizHawk
					savestate.load(state[current_action-1][alt_num][state_num]["slot"], true)
				else --otherwise, we'll just assume we're using FCEUX
					savestate.load(state[current_action-1][alt_num][state_num]["slot"])
				end
				
				if action[current_action].func.prepare(alts[alt]) then
					
					local min_wait = action[current_action][alt]["custom_min_wait"] or global_min_wait
					
					local max_wait = action[current_action][alt]["custom_wait"] or action[current_action][alt]["custom_max_wait"] or global_max_wait
					
					local wait_step = action[current_action][alt]["custom_wait_step"] or global_wait_step
					
					local temp_state = 0
					if memorysavestate and memorysavestate.clearstatesfrommemory then
						temp_state = memorysavestate.savecorestate()
					elseif taseditor then --otherwise, we'll just assume we're using FCEUX
						temp_state = savestate.object()
						savestate.save(temp_state)
					end
					
					for wait=min_wait, max_wait, wait_step do
						if memorysavestate and memorysavestate.clearstatesfrommemory then
							memorysavestate.loadcorestate(temp_state)
						elseif taseditor then
							savestate.load(temp_state)
						end
						
						for i=1, wait do--we wait for a given amount of frames
							emu.frameadvance()
						end
						
						local max_states = action[current_action][alt]["custom_states"] or action[current_action][alt]["custom_max_states"] or global_max_states
						
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
							state_add(alt, wait, {alt_num, state_num})
						end
					end
					if memorysavestate and memorysavestate.clearstatesfrommemory then
						memorysavestate.removestate(temp_state)
					elseif taseditor then
						temp_state = nil --dunno if it helps clearing memory
					end
				end
			end
		end
		if state[current_action][alt][1] == nil then--check if this function call failed to progress the botting
			log_update("  WARNING: Failed to meet requirements for Alt " .. alt)
		end
	end
end

if not movie_is_loaded() then --since there is no function to create a new movie, the user must open a movie before launching the script
	current_action = false
	text_output("ERROR: No movie file loaded. IMPORTANT NOTE: The movie file that it's loaded before launching the script will be used as base for the botting session, so ALL data previously contained will be discarded. For this reason, it is recommended to load an empty movie or an otherwise disposable movie file, for example a copy.")
	current_action = #action+1
else
	local file_resume = io.open("resume.lua", "r")
	if taseditor or (file_resume == nil) then --if using FCEUX or resume.lua doesn't exist, wipe log.txt and start a new session from scratch
		local file_log = io.open("log.txt", "w")
		io.output(file_log)
		io.write("")
		io.close(file_log)
		
		if tastudio then --simple way of confirming if we're using BizHawk
			savestate.save(state[0][1][1]["slot"], true)
		else --otherwise, we'll just assume we're using FCEUX
			savestate.save(state[0][1][1]["slot"])
		end
		
		local cycle = get_emu_time()
		state[0][1][1]["wait"] = 0
		state[0][1][1]["cycle"] = cycle
		state[0][1][1]["rng"] = get_rng()
		if console then
			console.clear()
		end
		log_update("DankBot v2.1 by ThunderAxe31, session STARTED")
		local rng_display = ""
		if get_rng then
			rng_display = ", RNG " .. string.format("%X", get_rng())
		end
		log_update(" Initializing state 0-1-1" .. time_unit .. cycle .. rng_display)
	else --if we're using BizHawk and resume.lua exists, resume the suspended session
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
					state = resume_data
					if current_action == #action+1 then
						text_output("Previous session is already complete. Add more actions or delete resume.lua")
					elseif current_action > #action+1 then
						text_output("ERROR: Session from resume.lua contains more actions than route.lua")
					else
						log_update("Botting session RESUMED   on " .. os.date("%y/%m/%d %X"))
					end
				else
					text_output("ERROR: Invalid resume data found in resume.lua")
					current_action = #action+1
				end
			else
				text_output("ERROR: Invalid resume data found in resume.lua")
				current_action = #action+1
			end
		else
			text_output("ERROR: Unable to read resume.lua")
			current_action = #action+1
		end
	end
	if get_rng == nil then
		log_update("WARNING: get_rng() function not declared in route.lua")
	end
end

rerecordcounting(false)
movie.setreadonly(false)
if client and client.frameskip then
	client.frameskip(9)
end
unpause()

while current_action <= #action do--this is the main code block that controls the botting flow
	state[current_action] = {}
	for i = 1, #action[current_action] do
		state[current_action][i] = {}
	end
	
	local action_date = os.date("%y/%m/%d %X")
	log_update("Start of Action " .. current_action .. " on " .. action_date)
	state[current_action]["date"] = action_date
	
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
		if not movie_is_loaded() then --we don't want to store savestates that don't contain movie inputs, so let's not save this action data
			log_update(" ERROR: It appears you closed the movie file.")
			log_update("Botting session INTERRUPTED on " .. os.date("%y/%m/%d %X"))
			current_action = #action+1
		elseif emu.framecount() == 0 then --in case the user accidentally restarted the movie playback, so let's not save this action data
			log_update(" ERROR: It appears you restarted movie replay.")
			log_update("Botting session INTERRUPTED on " .. os.date("%y/%m/%d %X"))
			current_action = #action+1
		else --if script execution gets here, the progress from latest action executed will be stored on disk, and the previous one deleted
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
				
				if tastudio then --simple way of confirming if we're using BizHawk
					savestate.load(state[current_action][minimum_alt][minumum_index]["slot"], true)
				else --otherwise, we'll just assume we're using FCEUX
					savestate.load(state[current_action][minimum_alt][minumum_index]["slot"])
				end
				
				log_update("Botting session COMPLETED on " .. os.date("%y/%m/%d %X"))
			end
			
			if tastudio then
				for z=1, #state[current_action-1] do --this deletes the old savestate files from disk
					for i=1, #state[current_action-1][z] do
						os.remove(state[current_action-1][z][i]["slot"])
						state[current_action-1][z][i]["slot"] = nil
					end
				end
				
				state["restart_action"] = current_action +1
				file_resume = io.open("resume.lua", "w")
				io.output(file_resume)
				io.write("return " .. table.tostring(state)) --save state data for resuming
				io.close(file_resume)
			elseif taseditor then
				for z=1, #state[current_action-1] do
					for i=1, #state[current_action-1][z] do
						state[current_action-1][z][i]["slot"] = nil
					end
				end
			end
			
			if(current_action>=2) then
				if export_treeview then
					if export_treeview() then
						log_update("Treeview.bmp file updated.")
					else
						log_update("ERROR: Treeview.lua failed to export Treeview.bmp")
					end
				elseif not dofile("DankBot Treeview.lua") then
					log_update("ERROR: Treeview.lua not found, unable to export Treeview.bmp")
				else
					if export_treeview then
						if export_treeview() then
							log_update("Treeview.bmp file updated.")
						else
							log_update("ERROR: Treeview.lua failed to export Treeview.bmp")
						end
					else
						log_update("ERROR: Treeview.lua damaged, unable to export Treeview.bmp")
					end
				end
			end
			
			current_action = current_action +1
		end
	end
end

if taseditor then
	close_session() --because FCEUX doesn't consider a script as closed if it merely reaches the end
end
