# === TAG MOBS IN TRAP RANGE ===
# Called with macro for rectangular volume
# $dx, $dy, $dz contain the box dimensions

# Tag hostile mobs in rectangular volume
$execute positioned as @s run tag @e[type=#minecraft:hostile,tag=!immune_elements,dx=$(dx),dy=$(dy),dz=$(dz)] add trap_target

# Tag players in rectangular volume
$execute positioned as @s run tag @a[dx=$(dx),dy=$(dy),dz=$(dz)] add trap_target
