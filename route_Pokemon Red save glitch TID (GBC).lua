--the following stuff must be declared for the bot to work. it's used for removing double savestates
local addr_rng         = 0xFFD3
function get_rng() --obligatory function for the main script to be able to compare the RNG of states
	return memory.read_u32_le(addr_rng)
end

--the following stuff must be declared for the bot to work. these values affect how much thorough the botting will be
global_max_states = 112 --maximum amount of states to be kept for each action
global_max_wait   = 10  --maximum amount of frames to wait before attempting an action
global_wait_step  = 1   --interval of frame increase between action attempts

--the following are values used for the custom functions, found below
local addr_skip_logo   = 0xFFB9
local addr_skip_intro  = 0xFF8B
local addr_skip_title  = 0xC0E9
local addr_new_game    = 0xDFEF
local addr_trainer_id  = 0xD359

--from here there are the functions of each different action.
--you can create as many as you want and customize them freely,
--but remember that each needs to have these three subvalues:
--a .name string, a .prepare function, and a .execute function.
gbc_palette = {name = "gbc_palette"}
function gbc_palette.prepare()
	while emu.framecount() < 85 do
		emu.frameadvance()
	end
	
	return true
end
function gbc_palette.execute(inputs)
	joypad.set(inputs)
	emu.frameadvance()
	joypad.set(inputs)--just in case
	emu.frameadvance()
	
	return true
end

skip_logo = {name = "skip_logo"}
function skip_logo.prepare()
	while emu.framecount() < 300 do
		emu.frameadvance()
	end
	
	return check_freeze(300, check_same, 1, memory.read_u8, addr_skip_logo)
end
function skip_logo.execute()
	joypad.set({A=true})
	emu.frameadvance()
	
	return check_freeze(100, check_same, 28, memory.read_u8, addr_skip_logo)
end

skip_intro = {name = "skip_intro"}
function skip_intro.prepare()
	emu.frameadvance()--just in case
	
	return check_freeze(100, check_same, 28, memory.read_u8, addr_skip_intro)
end
function skip_intro.execute()
	joypad.set({Start=true})
	emu.frameadvance()

	return true
end

skip_title = {name = "skip_title"}
function skip_title.prepare()
	emu.frameadvance()--just in case
	
	return check_freeze(200, check_same, 98, memory.read_u8, addr_skip_title)
end
function skip_title.execute()
	joypad.set({A=true})
	emu.frameadvance()

	return true
end

new_game = {name = "new_game"}
function new_game.prepare()
	emu.frameadvance()--just in case
	
	return check_freeze(200, check_diff, 20971522, memory.read_u32_le, addr_new_game)
end
function new_game.execute(desired_trainer_ids)
	joypad.set({Start=true})
	for i=1, 50 do
		emu.frameadvance()
	end
	
	local trainer_id = memory.read_u16_le(addr_trainer_id)
	for i=1, #desired_trainer_ids do
		if trainer_id == desired_trainer_ids[i] then
			return true
		end
	end

	return false
end

--this is the table listing all the routing actions to attempt.
--each action contains a subtable of alternate strategies
--each alternate strategy contains their own different arguments
--arguments can be defined by this route.lua file itself
--the main script also defines some optional arguments
return { --function type, function arguments
{func = gbc_palette,--prioritized by aesthetic preference
{branch=8,  custom_wait_step = 2, no_duplicate_removal = true, A=true, Up=true},
--{branch=3,  custom_wait_step = 2, no_duplicate_removal = true, Left=true},
--{branch=10, custom_wait_step = 2, no_duplicate_removal = true, B=true, Down=true},
--{branch=7,  custom_wait_step = 2, no_duplicate_removal = true, A=true, Left=true},
--{branch=2,  custom_wait_step = 2, no_duplicate_removal = true, Down=true},
--{branch=6,  custom_wait_step = 2, no_duplicate_removal = true, A=true, Down=true},
--{branch=1,  custom_wait_step = 2, no_duplicate_removal = true, Right=true},
--{branch=5,  custom_wait_step = 2, no_duplicate_removal = true, no_duplicate_removal = true},--same as A=true,Right=true
--{branch=12, custom_wait_step = 2, no_duplicate_removal = true, B=true, Up=true},
--{branch=4,  custom_wait_step = 2, no_duplicate_removal = true, Up=true},
--{branch=11, custom_wait_step = 2, no_duplicate_removal = true, B=true, Left=true},
--{branch=9,  custom_wait_step = 2, no_duplicate_removal = true, B=true,Right=true}
},
{func = skip_logo,  {} },
{func = skip_intro, {} },
{func = skip_title, {} },
{func = new_game,   {0xBB64, 0xBD64, 0xBE64, 0xC164, 0xC264, 0xC364, 0xC664} }, --list of desired trainer IDs

}