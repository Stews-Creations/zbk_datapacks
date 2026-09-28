# ===== DISCO INTERACTION SUMMON =====
# Summons the interaction entity at the disco ball location
# The interaction will automatically follow the rotating disco ball via update_position.mcfunction
# Adjust width and height as needed for your desired hitbox size

execute unless score #active zbk.de matches 1 run return 0

summon minecraft:interaction ~ ~ ~ {width:1.5f,height:1.5f,response:true,Tags:["disco_interaction"]}
