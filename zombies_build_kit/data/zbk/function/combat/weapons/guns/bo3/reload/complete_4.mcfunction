# ===================================
# COMPLETE RELOAD - SLOT 1
# ===================================
# Purpose: Transfer ammo from reserve to magazine
#
# Called when reload_timer_4 reaches 0
# ===================================

# Calculate how much ammo we need: max_ammo_4 - ammo_4
scoreboard players operation @s stats = @s max_ammo_4
scoreboard players operation @s stats -= @s ammo_4

# Calculate how much we can transfer: min(needed, reserve)
# If reserve < needed, we'll only transfer what's in reserve
execute if score @s reserve_ammo_4 < @s stats run scoreboard players operation @s stats = @s reserve_ammo_4

# Transfer ammo: add to magazine
scoreboard players operation @s ammo_4 += @s stats

# Transfer ammo: subtract from reserve
scoreboard players operation @s reserve_ammo_4 -= @s stats

# Clear reloading flag
scoreboard players set @s is_reloading_4 0

# Recorded fallback-MR6 reload already includes its closing action.
function zbk:combat/weapons/reload_audio/stop_slot {slot:4}
