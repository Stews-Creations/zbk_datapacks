# === MARK REPRESENTATIVE ===
# Runs as each sign in the group. Tags itself as cd_group_rep if no other sign
# with the same custom_door_id already has the tag (ensures one rep per unique ID).

execute store result score #ld_my_id global run scoreboard players get @s custom_door_id
scoreboard players set #ld_has_rep global 0
execute as @e[type=marker,tag=custom_door_sign,tag=cd_group_rep] if score @s custom_door_id = #ld_my_id global run scoreboard players set #ld_has_rep global 1
execute if score #ld_has_rep global matches 0 run tag @s add cd_group_rep
