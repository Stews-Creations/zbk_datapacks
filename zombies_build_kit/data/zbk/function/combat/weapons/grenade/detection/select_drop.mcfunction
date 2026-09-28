# All candidates belong to this one player; the throw helper consumes the nearest eligible drop.
tag @e[type=item,tag=grenade_drop] remove grenade_drop
$execute as @e[type=item,distance=..2,nbt={Thrower:$(uuid)}] if items entity @s contents *[custom_data~{knife:true,player_id:$(player_id)}] run tag @s add grenade_drop
execute if entity @e[type=item,tag=grenade_drop,distance=..2] run function zbk:combat/weapons/grenade/throw_grenade
kill @e[type=item,tag=grenade_drop,distance=..2]
