# === ROUND FLASH ===
# Purpose: Choose which round the HUD counter shows and its color.
# wave.round_flash counts down from 80 (4 seconds) after each round start:
#   80..67  previous round pulses bright red, then fades out
#   66..1   new round fades in, holds bright, then settles
# Tally rounds (1-5) draw their marks in one at a time during the fade-in.
# Outputs: #round_shown temp, storage zbk:hud args.round_color

# Steady state: current round in dark red; dog rounds sit dimmer for the whole round.
scoreboard players set #round_shown temp 0
execute if score #global wave.round matches 0.. run scoreboard players operation #round_shown temp = #global wave.round
data modify storage zbk:hud args.round_color set value "#701C1C"
execute if score #global wave.is_dog_round matches 1 run data modify storage zbk:hud args.round_color set value "#4A1212"
execute unless score #global wave.round_flash matches 1.. run return 0

# Phase 1: previous round pulses, then fades out.
execute if score #global wave.round_flash matches 67.. run scoreboard players remove #round_shown temp 1
execute if score #global wave.round_flash matches 73.. run data modify storage zbk:hud args.round_color set value "#FF3B3B"
execute if score #global wave.round_flash matches 71..72 run data modify storage zbk:hud args.round_color set value "#B02A2A"
execute if score #global wave.round_flash matches 69..70 run data modify storage zbk:hud args.round_color set value "#5A1414"
execute if score #global wave.round_flash matches 67..68 run data modify storage zbk:hud args.round_color set value "#240808"

# Phase 2: new round fades in, holds bright, then settles to the steady color.
execute if score #global wave.round_flash matches 61..66 run data modify storage zbk:hud args.round_color set value "#240808"
execute if score #global wave.round_flash matches 55..60 run data modify storage zbk:hud args.round_color set value "#5A1414"
execute if score #global wave.round_flash matches 49..54 run data modify storage zbk:hud args.round_color set value "#A02626"
execute if score #global wave.round_flash matches 37..48 run data modify storage zbk:hud args.round_color set value "#E03A3A"
execute if score #global wave.round_flash matches 25..36 run data modify storage zbk:hud args.round_color set value "#B02A2A"
execute if score #global wave.round_flash matches 13..24 run data modify storage zbk:hud args.round_color set value "#8C2222"

# Dog rounds peak at a deep blood red instead of the bright flash.
execute if score #global wave.is_dog_round matches 1 if score #global wave.round_flash matches 37..54 run data modify storage zbk:hud args.round_color set value "#8B1010"
execute if score #global wave.is_dog_round matches 1 if score #global wave.round_flash matches 13..36 run data modify storage zbk:hud args.round_color set value "#5A1414"

# Tally rounds reveal one mark every 5 ticks while fading in.
execute if score #global wave.round_flash matches 42..66 if score #global wave.round matches 1..5 run function zbk:player/actionbar/prepare/round/round_reveal
