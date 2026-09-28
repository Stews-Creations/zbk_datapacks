execute unless score #active zbk.de matches 1 run return run tellraw @s {"text":"Select Der Eisendrache to preview its quest HUD.","color":"yellow"}
$scoreboard players set #de_hud_arg_kind temp $(quest)
$scoreboard players set #de_hud_arg_fill temp $(stage)
execute unless score #de_hud_arg_kind temp matches 1..4 run return run tellraw @s {"text":"Use quest 1 (electric), 2 (fire), 3 (wolf), or 4 (void).","color":"yellow"}
execute unless score #de_hud_arg_fill temp matches 0..4 run return run tellraw @s {"text":"Use preview stage 0 through 4.","color":"yellow"}
scoreboard players operation @s de_hud_preview = #de_hud_arg_kind temp
scoreboard players operation @s de_hud_stage = #de_hud_arg_fill temp
scoreboard players reset @s de_ui_clock
function zbk_der_eisendrache:events/quest_inventory_tick
tellraw @s {"text":"Quest inventory preview enabled in its fixed bow slot. Gameplay progress and ownership are unchanged. Use hud/management/end_preview to return to live shared progress.","color":"aqua"}
