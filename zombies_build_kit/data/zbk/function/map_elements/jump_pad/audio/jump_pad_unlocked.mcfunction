# Runs as and at: the jump pad END marker that was just unlocked.
function zbk:map_elements/jump_pad/events/sound_jump_pad_unlocked
execute if data storage zbk:events result{blocked:1b} run return 0
# Shared core audio cue.
playsound zbk:jump_pads.vox_cast_maxis_pad_pa_activate master @a ~ ~ ~ 1 1
playsound zbk:jump_pads.launch_pad_on master @a ~ ~ ~ 0.3 1
