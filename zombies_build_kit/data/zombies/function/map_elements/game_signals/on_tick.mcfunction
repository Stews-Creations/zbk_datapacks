# ===================================
# GAME SIGNALS MODULE - TICK
# ===================================
# Purpose: Detect placed allay spawn eggs and convert to signal markers

execute if entity @e[type=minecraft:allay,name="Signal: Game Start"] run function zombies:map_elements/game_signals/spawning/spawn
execute if entity @e[type=minecraft:allay,name="Signal: Game End"] run function zombies:map_elements/game_signals/spawning/spawn
execute if entity @e[type=minecraft:allay,name="Signal: Round Start"] run function zombies:map_elements/game_signals/spawning/spawn
execute if entity @e[type=minecraft:allay,name="Signal: Power On"] run function zombies:map_elements/game_signals/spawning/spawn
execute if entity @e[type=minecraft:allay,name="Signal: Zone Unlocked"] run function zombies:map_elements/game_signals/spawning/spawn
execute if entity @e[type=minecraft:allay,name="Signal: Cutscene Start"] run function zombies:map_elements/game_signals/spawning/spawn
execute if entity @e[type=minecraft:allay,name="Signal: Cutscene End"] run function zombies:map_elements/game_signals/spawning/spawn
