# ===================================
# GAME SIGNALS - SPAWN MARKER
# ===================================
# Purpose: Convert placed allay spawn eggs into signal markers
# Places the initial idle block at the marker position

# Game Start
execute as @e[type=minecraft:allay,name="Signal: Game Start"] at @s run summon marker ~ ~ ~ {Tags:["game_signal","signal_game_start","signal_pulse"]}
execute as @e[type=minecraft:allay,name="Signal: Game Start"] at @s run setblock ~ ~ ~ yellow_concrete
execute as @e[type=minecraft:allay,name="Signal: Game Start"] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
kill @e[type=minecraft:allay,name="Signal: Game Start"]

# Game End (always pulse)
execute as @e[type=minecraft:allay,name="Signal: Game End"] at @s run summon marker ~ ~ ~ {Tags:["game_signal","signal_game_end","signal_pulse"]}
execute as @e[type=minecraft:allay,name="Signal: Game End"] at @s run setblock ~ ~ ~ yellow_concrete
execute as @e[type=minecraft:allay,name="Signal: Game End"] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
kill @e[type=minecraft:allay,name="Signal: Game End"]

# Round Start (always pulse)
execute as @e[type=minecraft:allay,name="Signal: Round Start"] at @s run summon marker ~ ~ ~ {Tags:["game_signal","signal_round_start","signal_pulse"]}
execute as @e[type=minecraft:allay,name="Signal: Round Start"] at @s run setblock ~ ~ ~ yellow_concrete
execute as @e[type=minecraft:allay,name="Signal: Round Start"] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
kill @e[type=minecraft:allay,name="Signal: Round Start"]

# Power On
execute as @e[type=minecraft:allay,name="Signal: Power On"] at @s run summon marker ~ ~ ~ {Tags:["game_signal","signal_power_on","signal_pulse"]}
execute as @e[type=minecraft:allay,name="Signal: Power On"] at @s run setblock ~ ~ ~ yellow_concrete
execute as @e[type=minecraft:allay,name="Signal: Power On"] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
kill @e[type=minecraft:allay,name="Signal: Power On"]

# Zone Unlocked (default zone 0, pulse)
execute as @e[type=minecraft:allay,name="Signal: Zone Unlocked"] at @s run summon marker ~ ~ ~ {Tags:["game_signal","signal_zone_unlocked","signal_pulse"],data:{zone:0}}
execute as @e[type=minecraft:allay,name="Signal: Zone Unlocked"] at @s run setblock ~ ~ ~ yellow_concrete
execute as @e[type=minecraft:allay,name="Signal: Zone Unlocked"] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
kill @e[type=minecraft:allay,name="Signal: Zone Unlocked"]

# Cutscene Start Game (always pulse)
execute as @e[type=minecraft:allay,name="Signal: Cutscene Start"] at @s run summon marker ~ ~ ~ {Tags:["game_signal","signal_cutscene_start","signal_pulse"]}
execute as @e[type=minecraft:allay,name="Signal: Cutscene Start"] at @s run setblock ~ ~ ~ yellow_concrete
execute as @e[type=minecraft:allay,name="Signal: Cutscene Start"] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
kill @e[type=minecraft:allay,name="Signal: Cutscene Start"]

# Cutscene End Game (always pulse)
execute as @e[type=minecraft:allay,name="Signal: Cutscene End"] at @s run summon marker ~ ~ ~ {Tags:["game_signal","signal_cutscene_end","signal_pulse"]}
execute as @e[type=minecraft:allay,name="Signal: Cutscene End"] at @s run setblock ~ ~ ~ yellow_concrete
execute as @e[type=minecraft:allay,name="Signal: Cutscene End"] at @s run particle minecraft:end_rod ~ ~0.5 ~ 0.1 0.5 0.1 0.01 10 force
kill @e[type=minecraft:allay,name="Signal: Cutscene End"]
