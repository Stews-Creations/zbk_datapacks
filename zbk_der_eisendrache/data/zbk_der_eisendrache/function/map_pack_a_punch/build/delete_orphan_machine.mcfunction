# Deletes a Der Eisendrache machine marker if its owning map location is missing.

execute as @e[type=marker,tag=de_pack_delete_orphan,limit=1] at @s run function zbk_der_eisendrache:map_pack_a_punch/machine/model/delete_nearest
tag @e[type=marker,tag=de_pack_delete_orphan] remove de_pack_delete_orphan
tellraw @s [{"text":"[Build Kit] ","color":"gold"},{"text":"Orphaned Der Eisendrache Pack-a-Punch machine deleted.","color":"red"}]
return 1
