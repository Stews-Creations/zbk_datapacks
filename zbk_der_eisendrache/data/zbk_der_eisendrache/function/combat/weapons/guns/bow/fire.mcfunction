# Bow fire - called when player RELEASES the bow (bow_charging went to 0)

# A stale release must not fire after the active slot changes to another weapon.
scoreboard players set #bow_active_id stats -1
execute if score @s active_weapon matches 0 run scoreboard players operation #bow_active_id stats = @s gun_1
execute if score @s active_weapon matches 1 run scoreboard players operation #bow_active_id stats = @s gun_2
execute if score @s active_weapon matches 2 run scoreboard players operation #bow_active_id stats = @s gun_3
execute if score #bow_active_id stats matches 12 run return run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/fire
execute unless score #bow_active_id stats matches 11 unless score #bow_active_id stats matches 17..19 run return run function zbk_der_eisendrache:combat/weapons/guns/bow/management/cancel_charge

# A release can be observed by more than one input path in the same tick. Dispatch it only once.
execute if score @s bow_trigger_lock matches 1.. run return 0
scoreboard players set @s bow_trigger_lock 2

# Stop the charging loop sound
stopsound @s master zbk_der_eisendrache:base_bow.bowlauncher_loop_stretch

# Determine shot type: charged (20+ ticks) requires 2 ammo, quick shot requires 1
# If fully charged but only 1 ammo left, downgrade to quick shot
scoreboard players set @s bow_is_charged 0

# Check if charged AND have enough ammo for charged shot (2 ammo)
execute if score @s bow_charge_time matches 20.. if score @s active_weapon matches 0 if score @s ammo_1 matches 2.. run scoreboard players set @s bow_is_charged 1
execute if score @s bow_charge_time matches 20.. if score @s active_weapon matches 1 if score @s ammo_2 matches 2.. run scoreboard players set @s bow_is_charged 1
execute if score @s bow_charge_time matches 20.. if score @s active_weapon matches 2 if score @s ammo_3 matches 2.. run scoreboard players set @s bow_is_charged 1

execute at @s run function zbk_der_eisendrache:events/bow_release

# Slot 1
execute if score @s active_weapon matches 0 if score @s ammo_1 matches 1.. run function zbk_der_eisendrache:combat/weapons/guns/bow/shoot/slot_1

# Slot 2
execute if score @s active_weapon matches 1 if score @s ammo_2 matches 1.. run function zbk_der_eisendrache:combat/weapons/guns/bow/shoot/slot_2

# Slot 3
execute if score @s active_weapon matches 2 if score @s ammo_3 matches 1.. run function zbk_der_eisendrache:combat/weapons/guns/bow/shoot/slot_3

# Keep the draw duration available until the curved raycast has completed.
scoreboard players set @s bow_charge_time 0

# No-ammo voice callout (only triggers when both clip and reserve are empty)
function zbk:combat/weapons/events/voice_try_no_ammo with storage zbk:config

function zbk_der_eisendrache:events/bow_shot_finished
