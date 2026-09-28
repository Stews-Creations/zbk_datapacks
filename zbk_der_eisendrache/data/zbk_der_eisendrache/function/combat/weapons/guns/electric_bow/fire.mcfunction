# Electric bow release (or explicit force-fire). Shared bow input owns drawing;
# quick shots retain their piercing damage; a full charge costs 2 ammo.

# Cancel stale releases after another weapon replaces the active slot.
scoreboard players set #electric_active_id stats -1
execute if score @s active_weapon matches 0 run scoreboard players operation #electric_active_id stats = @s gun_1
execute if score @s active_weapon matches 1 run scoreboard players operation #electric_active_id stats = @s gun_2
execute if score @s active_weapon matches 2 run scoreboard players operation #electric_active_id stats = @s gun_3
execute unless score #electric_active_id stats matches 12 run return run function zbk_der_eisendrache:combat/weapons/guns/bow/management/cancel_charge

# Consume the pending release so overlapping input paths cannot fire twice.
scoreboard players set @s bow_charging 0
scoreboard players set @s bow_is_charged 0
execute if score @s bow_charge_time matches 20.. if score @s active_weapon matches 0 if score @s ammo_1 matches 2.. run scoreboard players set @s bow_is_charged 1
execute if score @s bow_charge_time matches 20.. if score @s active_weapon matches 1 if score @s ammo_2 matches 2.. run scoreboard players set @s bow_is_charged 1
execute if score @s bow_charge_time matches 20.. if score @s active_weapon matches 2 if score @s ammo_3 matches 2.. run scoreboard players set @s bow_is_charged 1
stopsound @s master zbk_der_eisendrache:base_bow.bowlauncher_loop_stretch
function zbk_der_eisendrache:combat/weapons/guns/electric_bow/effects/stop_draw_sound
execute if score @s electric_bow_trigger_lock matches 1.. run scoreboard players set @s bow_charge_time 0
execute if score @s electric_bow_trigger_lock matches 1.. run return 0

# Revoke both advancements immediately to prevent race condition
advancement revoke @s only zbk_der_eisendrache:electric_bow
advancement revoke @s only zbk_der_eisendrache:electric_bow_cooldown

# Slot 1 - Check trigger lock, then fire
execute if score @s active_weapon matches 0 unless score @s electric_bow_trigger_lock matches 1.. unless score @s cooldown_1 matches 1.. if score @s ammo_1 matches 1.. run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/shoot/slot_1

# Slot 2 - Check trigger lock, then fire
execute if score @s active_weapon matches 1 unless score @s electric_bow_trigger_lock matches 1.. unless score @s cooldown_2 matches 1.. if score @s ammo_2 matches 1.. run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/shoot/slot_2

# Slot 3 - Check trigger lock, then fire
execute if score @s active_weapon matches 2 unless score @s electric_bow_trigger_lock matches 1.. unless score @s cooldown_3 matches 1.. if score @s ammo_3 matches 1.. run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/shoot/slot_3

# Keep the draw duration available until the curved raycast has completed.
scoreboard players set @s bow_charge_time 0

# Brief duplicate-dispatch guard, decremented by the cooldown advancement.
scoreboard players set @s electric_bow_trigger_lock 2

# No-ammo voice callout (only triggers when both clip and reserve are empty)
function zbk:api/sounds/voice/try_no_ammo with storage zbk:config
