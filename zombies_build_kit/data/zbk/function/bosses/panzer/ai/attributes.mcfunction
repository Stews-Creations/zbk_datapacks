# Panzer targeting and one-time controller attributes.
# Runs as: panzer_ai iron golem.

function zbk:behavior/ai/anger

scoreboard players set #panzer_target_is_downed temp 0
execute on target if entity @s[type=player,team=downed] run scoreboard players set #panzer_target_is_downed temp 1
execute unless entity @a[gamemode=adventure,team=!downed] if score #panzer_target_is_downed temp matches 1 run data remove entity @s angry_at

execute unless entity @s[tag=panzer_attrs_applied] run function zbk:bosses/panzer/ai/apply_static_attributes
execute unless entity @s[tag=panzer_vanilla_attack_disabled] run function zbk:bosses/panzer/ai/disable_vanilla_attack
