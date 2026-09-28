scoreboard players set #map_killer temp 0
$execute as @a[nbt={UUID:$(soul_killer)}] run scoreboard players operation #map_killer temp = @s id
function zbk_der_eisendrache:quest/souls/accept
