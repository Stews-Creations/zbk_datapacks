execute as @a[scores={give_map_pack_a_punch_egg=1..}] run function zbk_der_eisendrache:map_pack_a_punch/spawning/spawn_egg
scoreboard players enable @a[scores={give_map_pack_a_punch_egg=1..}] give_map_pack_a_punch_egg
scoreboard players set @a[scores={give_map_pack_a_punch_egg=1..}] give_map_pack_a_punch_egg 0
execute as @a[scores={give_map_pack_a_punch_sign_egg=1..}] run function zbk_der_eisendrache:map_pack_a_punch/sign/spawn_egg
scoreboard players enable @a[scores={give_map_pack_a_punch_sign_egg=1..}] give_map_pack_a_punch_sign_egg
scoreboard players set @a[scores={give_map_pack_a_punch_sign_egg=1..}] give_map_pack_a_punch_sign_egg 0
