# Reveal tally marks one at a time: step = (66 - round_flash) / 5 + 1, capped at the round.
scoreboard players set #round_reveal temp 66
scoreboard players operation #round_reveal temp -= #global wave.round_flash
scoreboard players set #round_step temp 5
scoreboard players operation #round_reveal temp /= #round_step temp
scoreboard players add #round_reveal temp 1
execute if score #round_reveal temp < #round_shown temp run scoreboard players operation #round_shown temp = #round_reveal temp
