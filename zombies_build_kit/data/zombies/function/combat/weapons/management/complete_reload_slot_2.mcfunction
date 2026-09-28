execute if score @s gun_2 matches 39 run return run function zombies:combat/weapons/guns/bo3/reload/shell_2
# ===================================
# COMPLETE RELOAD - SLOT 2
# ===================================
# Purpose: Transfer ammo from reserve to magazine
#
# Called when reload_timer_2 reaches 0
# ===================================

# Calculate how much ammo we need: max_ammo_2 - ammo_2
scoreboard players operation @s stats = @s max_ammo_2
scoreboard players operation @s stats -= @s ammo_2

# Calculate how much we can transfer: min(needed, reserve)
# If reserve < needed, we'll only transfer what's in reserve
execute if score @s reserve_ammo_2 < @s stats run scoreboard players operation @s stats = @s reserve_ammo_2

# Transfer ammo: add to magazine
scoreboard players operation @s ammo_2 += @s stats

# Transfer ammo: subtract from reserve
scoreboard players operation @s reserve_ammo_2 -= @s stats

# Clear reloading flag
scoreboard players set @s is_reloading_2 0

# Recorded reload clips already include the closing action.
function zombies:combat/weapons/reload_audio/stop_slot {slot:2}
execute unless score @s gun_2 matches 7 unless score @s gun_2 matches 20..46 at @s run playsound minecraft:block.iron_door.close player @s ~ ~ ~ 2.0 1.5
