# Assign one of four shared character voice slots to each active player.
scoreboard players set @a[gamemode=adventure] character 0
execute store result score #voice_cycle character run random value 0..3
function zbk_der_eisendrache:character/assign_step
