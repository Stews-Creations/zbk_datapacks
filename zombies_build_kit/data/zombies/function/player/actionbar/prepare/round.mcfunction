# Shared glyph cache; final placement is computed separately for each player.
execute unless score #hud_round temp = #global wave.round run function zombies:player/actionbar/prepare/round_build
execute unless data storage zombies:hud round{layout:8} run function zombies:player/actionbar/prepare/round_build
data modify storage zombies:hud args.round_text set from storage zombies:hud round.text
execute store result score #round_width temp run data get storage zombies:hud round.width
data modify storage zombies:hud args.round_offset set value 104
scoreboard players set #round_back temp -104
scoreboard players operation #round_back temp -= #round_width temp
execute store result storage zombies:hud args.round_return int 1 run scoreboard players get #round_back temp

# Gun-right HUD: keep the round's right edge at -87, before perks at -83.
execute if score @s gun_side matches 2 run scoreboard players set #round_back temp -87
execute if score @s gun_side matches 2 run scoreboard players operation #round_back temp -= #round_width temp
execute if score @s gun_side matches 2 store result storage zombies:hud args.round_offset int 1 run scoreboard players get #round_back temp
execute if score @s gun_side matches 2 run data modify storage zombies:hud args.round_return set value 87
