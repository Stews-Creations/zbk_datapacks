# ===================================
# PANZER BOSS - TICK
# ===================================
# Owns Panzer spawn delays, controller AI, projectiles, and death cleanup.

execute as @e[type=minecraft:marker,tag=panzer_spawn_pending] at @s run function zombies:bosses/panzer/spawn/pending/tick
execute as @e[type=minecraft:iron_golem,tag=panzer_ai,tag=!panzer_dying] at @s run function zombies:bosses/panzer/controller/on_tick_as_panzer
execute as @e[type=minecraft:item_display,tag=panzer_electric_projectile] at @s run function zombies:bosses/panzer/attacks/range/projectile/tick

# Remove dying displays after death animation finishes.
execute as @e[type=minecraft:item_display,tag=aj.de_panzer.root,tag=panzer_dying] at @s unless entity @s[tag=aj.de_panzer.animation.animation_model_die.playing] run function zombies:bosses/panzer/drops/random_powerup
execute as @e[type=minecraft:item_display,tag=aj.de_panzer.root,tag=panzer_dying] unless entity @s[tag=aj.de_panzer.animation.animation_model_die.playing] run function zombies:bosses/panzer/model/removal/paired_golem
execute as @e[type=minecraft:item_display,tag=aj.de_panzer.root,tag=panzer_dying] unless entity @s[tag=aj.de_panzer.animation.animation_model_die.playing] run function animated_java:de_panzer/remove/this
