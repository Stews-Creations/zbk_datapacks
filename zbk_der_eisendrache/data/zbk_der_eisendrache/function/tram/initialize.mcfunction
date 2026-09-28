# ===================================
# TRAM SUBMODULE - INITIALIZE
# ===================================
# Purpose: Reset tram runtime state and rebuild configured Der Eisendrache trams
# Called from on_load.mcfunction and game reset

# Cancel route loops before removing their tram roots.
schedule clear zbk_der_eisendrache:tram/route/move_loop
schedule clear zbk_der_eisendrache:tram/sway/loop
stopsound @a master zbk_der_eisendrache:tram.motor_lp

# Reset the per-player missing-Fuse announcement cooldown.
scoreboard players set @a tram_fuse_cd 0
scoreboard players set #tram_arriving_sound global 1
scoreboard players set #tram_departing_sound global 1

# Kill tram passengers first to avoid "unknown entity" warnings
execute as @e[type=block_display,tag=tram] at @s on passengers run kill @s
# Then kill the tram parent entities
kill @e[tag=tram]
function zbk_der_eisendrache:tram/reward/reset
tag @e[type=marker,tag=tram_route_target] remove tram_route_target
tag @e[type=marker,tag=tram_reward_target] remove tram_reward_target
tag @e[type=block_display,tag=tram_swaying] remove tram_swaying

# Persistent route markers are the source of truth for runtime tram models.
execute if score #active zbk.de matches 1 run function zbk_der_eisendrache:tram/spawning/spawn
function zbk_der_eisendrache:tram/doors/initialize
function zbk_der_eisendrache:tram/call_console/initialize

tellraw @a[tag=debug] [{"text":"[Tram] ","color":"gold"},{"text":"Tram system initialized","color":"green"}]
