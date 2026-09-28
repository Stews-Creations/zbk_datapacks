function zbk:debug/event {f:"POWERUP",m:"Max Ammo!"}

playsound minecraft:block.note_block.chime master @a ~ ~ ~ 1000 1

# Refill grenades to their max (respects round-based max)
execute as @a[team=!downed] run scoreboard players operation @s grenade_ammo = @s max_grenade_ammo

# Refill special equipment to its max without granting missing equipment
execute as @a[team=!downed,scores={special_equipment=1..}] run scoreboard players operation @s special_equipment_ammo = @s max_special_equipment_ammo

# Refill magazine ammo to their max
execute as @a[team=!downed] run scoreboard players operation @s ammo_1 = @s max_ammo_1
execute as @a[team=!downed] run scoreboard players operation @s ammo_2 = @s max_ammo_2
execute as @a[team=!downed] run scoreboard players operation @s ammo_3 = @s max_ammo_3

# Refill reserve ammo to their max
execute as @a[team=!downed] run scoreboard players operation @s reserve_ammo_1 = @s max_reserve_1
execute as @a[team=!downed] run scoreboard players operation @s reserve_ammo_2 = @s max_reserve_2
execute as @a[team=!downed] run scoreboard players operation @s reserve_ammo_3 = @s max_reserve_3

function zbk:combat/powerups/max_ammo/sound



# Shield charges refill independently of durability.
execute as @a run function zbk:dispatch/voice_event_max_ammo
execute as @a[team=!downed] run function zbk:combat/weapons/special_equipment/rocket_shield/management/refill_charges
