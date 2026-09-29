# Build Manager trigger lock countdown - runs every tick via build_manager_cooldown advancement
execute if score @s build_manager_trigger_lock matches 1.. run scoreboard players remove @s build_manager_trigger_lock 1

# If pending and lock expired, player released right-click - dispatch now
execute if score @s build_manager_pending matches 1 unless score @s build_manager_trigger_lock matches 1.. run function zbk:build_kit/tools/build_manager/dispatch

# Keep ticking if lock active or still pending
execute if score @s build_manager_trigger_lock matches 1.. run advancement revoke @s only zbk:build_manager_cooldown
execute if score @s build_manager_pending matches 1 run advancement revoke @s only zbk:build_manager_cooldown

# Reset lock score when fully idle (no lock, no pending)
execute unless score @s build_manager_pending matches 1 unless score @s build_manager_trigger_lock matches 1.. run scoreboard players reset @s build_manager_trigger_lock
