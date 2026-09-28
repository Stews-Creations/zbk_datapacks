# Remove orphan visuals when their center disappears or their chunk reloads later.
execute unless score #active zbk.de matches 1 run return run function zbk_der_eisendrache:quest/bows/electric/storm/management/remove_breeze
scoreboard players operation #current de_storm_link = @s de_storm_link
scoreboard players set #de_storm_center_exists stats 0
execute unless score #storm_lookup_active temp matches 1 as @e[type=marker,tag=de_electric_storm] if score @s de_storm_link = #current de_storm_link run scoreboard players set #de_storm_center_exists stats 1
execute if score #storm_lookup_active temp matches 1 run function zbk_der_eisendrache:quest/bows/electric/storm/lookup/query
execute if score #de_storm_center_exists stats matches 0 run return run function zbk_der_eisendrache:quest/bows/electric/storm/management/remove_breeze

# Capture grounded enemies close to the moving breeze, independent of damage pulses.
execute as @e[type=zombified_piglin,distance=..3,nbt={OnGround:1b},tag=!immune_elements,tag=!immune_guns,tag=!combat_ignore,tag=!turned_zombie,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] at @s run function zbk_der_eisendrache:quest/bows/electric/storm/effects/lift
execute as @e[type=wolf,distance=..3,nbt={OnGround:1b},tag=!immune_elements,tag=!immune_guns,tag=!combat_ignore,tag=!turned_zombie,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] at @s run function zbk_der_eisendrache:quest/bows/electric/storm/effects/lift
# Capture active Panzers after their controlled spawn descent.
execute as @e[type=iron_golem,tag=panzer_ai,tag=!panzer_landing_descent,distance=..3,nbt={OnGround:1b},tag=!immune_elements,tag=!immune_guns,tag=!combat_ignore,tag=!turned_zombie,tag=!monkey_bomb_decoy,tag=!solo_down_decoy] at @s run function zbk_der_eisendrache:quest/bows/electric/storm/effects/lift
