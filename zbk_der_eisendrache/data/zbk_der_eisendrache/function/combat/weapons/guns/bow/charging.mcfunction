# Bow charging - called every tick while player holds right-click
# Sets bow_charging flag to 2, which gets decremented each tick
# When it reaches 0 (player released), the bow fires

# Mark player as charging
scoreboard players set @s bow_charging 2

# Play stretch sound on first tick of charging
execute if score @s bow_charge_time matches 0 run playsound zbk_der_eisendrache:base_bow.bowlauncher_loop_stretch master @s ~ ~ ~ 1 1

# Increment charge time (counts how long player has been charging)
scoreboard players add @s bow_charge_time 1

# Replay stretch sound every 169 ticks (~8.46s = sound file duration)
scoreboard players operation #bow_mod bow_charge_time = @s bow_charge_time
scoreboard players set #bow_dur bow_charge_time 169
scoreboard players operation #bow_mod bow_charge_time %= #bow_dur bow_charge_time
execute if score #bow_mod bow_charge_time matches 0 if score @s bow_charge_time matches 1.. unless score @s electric_draw matches 1.. run playsound zbk_der_eisendrache:base_bow.bowlauncher_loop_stretch master @s ~ ~ ~ 1 1

execute at @s run function zbk_der_eisendrache:events/bow_draw
execute at @s run function zbk_der_eisendrache:combat/weapons/guns/electric_bow/effects/draw_sound

# Revoke advancement for re-trigger next tick
advancement revoke @s only zbk_der_eisendrache:bow
advancement revoke @s only zbk_der_eisendrache:electric_bow
