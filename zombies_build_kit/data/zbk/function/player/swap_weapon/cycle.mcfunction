function zbk:player/events/extension/swap_weapon/cycle/before_active_weapon_cleanup
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# ===================================
# CYCLE WEAPON
# ===================================
# Cycles active_weapon to the next NON-EMPTY UNLOCKED slot when F is pressed.
# Skips empty slots so a pending Pack-a-Punch (gun_X=0 mid-cycle) doesn't strand
# the player on an empty slot they can't escape (no gun in offhand → F doesn't
# trigger swap detection → stuck).
#
# Slot map: active_weapon 0/1/2 = gun_1/gun_2/gun_3. Slot 2 requires Mule Kick.

# Death Machine override: F-press cancels the powerup instead of cycling
execute if entity @s[tag=death_machine_active] run function zbk:combat/powerups/death_machine/cleanup
execute if entity @s[tag=death_machine_active] run return 0

# Cancel any in-progress reload on the current weapon before swapping
execute if score @s active_weapon matches 0 run scoreboard players set @s is_reloading_1 0
execute if score @s active_weapon matches 0 run scoreboard players set @s reload_timer_1 0
execute if score @s active_weapon matches 1 run scoreboard players set @s is_reloading_2 0
execute if score @s active_weapon matches 1 run scoreboard players set @s reload_timer_2 0
execute if score @s active_weapon matches 2 run scoreboard players set @s is_reloading_3 0
execute if score @s active_weapon matches 2 run scoreboard players set @s reload_timer_3 0

# Clear all trigger locks when switching weapons (prevents stuck guns)
scoreboard players reset @s pistol_trigger_lock
scoreboard players reset @s ray_gun_trigger_lock
function zbk:player/events/extension/swap_weapon/cycle/after_trigger_reset
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
scoreboard players reset @s rainbow_rifle_trigger_lock

# Initial advance
scoreboard players add @s active_weapon 1

# Skip-empty-or-locked: advance again whenever the current slot is unusable.
# Three iterations cover the worst case (visit all 3 slots once). If every slot is
# empty (player has no real guns), active_weapon lands at 0 and stays — they hold
# the knife placeholder.
function zbk:player/swap_weapon/advance_if_unusable
function zbk:player/swap_weapon/advance_if_unusable
function zbk:player/swap_weapon/advance_if_unusable

# Play sound feedback
playsound minecraft:item.armor.equip_generic player @s ~ ~ ~ 0.5 1.2
