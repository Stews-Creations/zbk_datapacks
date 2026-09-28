# Preserve the genuine bow firing path when the vane intercepts right-click.
$execute as @a[nbt={UUID:$(vane_clicker)}] if entity @s[distance=..6] if items entity @s weapon.offhand minecraft:ghast_tear[custom_data~{gun_id:11}] at @s run function zbk_der_eisendrache:combat/weapons/guns/bow/fire
