function zombies:combat/weapons/guns/bo3/migration/id
execute if score #gun_id temp matches 20..46 run return run function zombies:combat/weapons/guns/bo3/registry/give_by_id
# Give gun to player based on gun ID
# Context: Runs as player (@s)
# Input: #gun_id temp (weapon ID)

# Route to appropriate gun give function based on ID
execute if score #gun_id temp matches 1 run function zombies:combat/weapons/guns/double_barrel_shotgun/give/main
execute if score #gun_id temp matches 2 run function zombies:combat/weapons/guns/flame_thrower/give/main
execute if score #gun_id temp matches 3 run function zombies:combat/weapons/guns/grenade_launcher/give/main
execute if score #gun_id temp matches 4 run function zombies:combat/weapons/guns/light_machine_gun/give/main
execute if score #gun_id temp matches 5 run function zombies:combat/weapons/guns/pistol/give/main
execute if score #gun_id temp matches 6 run function zombies:combat/weapons/guns/rainbow_rifle/give/main
execute if score #gun_id temp matches 7 run function zombies:combat/weapons/guns/ray_gun/give/main
execute if score #gun_id temp matches 8 run function zombies:combat/weapons/guns/rifle/give/main
execute if score #gun_id temp matches 9 run function zombies:combat/weapons/guns/shotgun/give/main
execute if score #gun_id temp matches 10 run function zombies:combat/weapons/guns/sniper/give/main
execute if score #gun_id temp matches 14 run function zombies:combat/weapons/special_equipment/monkey_bomb/give_monkey_bomb
execute if score #gun_id temp matches 15 run function zombies:combat/weapons/special_equipment/trip_mine/give_trip_mine
