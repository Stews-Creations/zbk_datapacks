# Native item predicates avoid reading whole entity NBT.
# Keep item-kind priority and fresh per-candidate gates: one accepted drop changes the next decision.

# ===================================
# COMBAT POWERUPS SUBMODULE - TICK
# ===================================
# Purpose: Execute per-tick logic for powerup timers, spawning, and pickup detection
#
# Dependencies: combat/powerups/on_load.mcfunction
# ===================================

# ===== POWERUP TIMERS =====
# Handle powerup duration countdowns and cleanup
function zbk:combat/powerups/timers

# ===== POWERUP SPAWNING =====
# Select each item kind once, in the established priority order.
# Each candidate rechecks the shared cap/kill gate after the previous candidate.
execute as @e[type=item] if items entity @s contents minecraft:iron_ingot at @s run function zbk:combat/powerups/spawning/consume {kind:"insta_kill",label:"Insta Kill"}
execute as @e[type=item] if items entity @s contents minecraft:gold_ingot at @s run function zbk:combat/powerups/spawning/consume {kind:"nuke",label:"Nuke"}
execute as @e[type=item] if items entity @s contents minecraft:netherite_ingot at @s run function zbk:combat/powerups/spawning/consume {kind:"max_ammo",label:"Max Ammo"}
execute as @e[type=item] if items entity @s contents minecraft:diamond at @s run function zbk:combat/powerups/spawning/consume {kind:"double_points",label:"Double Points"}
execute as @e[type=item] if items entity @s contents minecraft:emerald at @s run function zbk:combat/powerups/spawning/consume {kind:"fire_sale",label:"Fire Sale"}
execute as @e[type=item] if items entity @s contents minecraft:copper_ingot at @s run function zbk:combat/powerups/spawning/consume {kind:"carpenter",label:"Carpenter"}
execute as @e[type=item] if items entity @s contents minecraft:wither_skeleton_skull at @s run function zbk:combat/powerups/spawning/consume {kind:"death_machine",label:"Death Machine"}

# ===== POWERUP VISUAL EFFECTS =====

# Rotate Pickup
execute as @e[type=item_display,tag=pickup_item] at @s run tp @s ~ ~ ~ ~-2 ~

function zbk:dispatch/extension/combat/powerups/on_tick/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value

# ===== POWERUP PICKUP DETECTION =====
# Handle Pickup
execute as @e[type=minecraft:item_display,tag=insta_kill] at @s if entity @p[dx=1,dy=1,dz=1] run function zbk:combat/powerups/insta_kill/pickup
execute as @e[type=minecraft:item_display,tag=nuke] at @s if entity @p[dx=1,dy=1,dz=1] run function zbk:combat/powerups/nuke/pickup
execute as @e[type=minecraft:item_display,tag=max_ammo] at @s if entity @p[dx=1,dy=1,dz=1] run function zbk:combat/powerups/max_ammo/pickup
execute as @e[type=minecraft:item_display,tag=double_points] at @s if entity @p[dx=1,dy=1,dz=1] run function zbk:combat/powerups/double_points/pickup
execute as @e[type=minecraft:item_display,tag=fire_sale] at @s if entity @p[dx=1,dy=1,dz=1] run function zbk:combat/powerups/fire_sale/pickup
execute as @e[type=minecraft:item_display,tag=carpenter] at @s if entity @p[dx=1,dy=1,dz=1] run function zbk:combat/powerups/carpenter/pickup
# Death Machine pickup runs AS the picker (activate is per-player and needs @s = player).
execute as @e[type=minecraft:item_display,tag=death_machine] at @s as @p[dx=1,dy=1,dz=1] run function zbk:combat/powerups/death_machine/pickup
function zbk:dispatch/extension/combat/powerups/on_tick/2
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
# ===== POWERUP TIMER ASSIGNMENT =====
# Add powerup timer
execute as @e[type=item_display,tag=pickup_item] unless score @s timer matches 1.. run scoreboard players set @s timer 600
