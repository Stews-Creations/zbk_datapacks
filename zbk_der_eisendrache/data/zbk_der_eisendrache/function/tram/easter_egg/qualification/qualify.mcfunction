# Resolve this grenade's recorded thrower and grant that player this game's hidden call sequence.
tag @s add tram_ee_grenade_checked
execute store result score #tram_ee_thrower id run data get entity @s data.thrower_id
execute as @a if score @s id = #tram_ee_thrower id unless score @s tram_ee_ready matches 1.. run function zbk_der_eisendrache:tram/easter_egg/qualification/grant
