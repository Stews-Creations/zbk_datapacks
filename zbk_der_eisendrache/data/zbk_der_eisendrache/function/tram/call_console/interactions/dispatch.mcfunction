# Resolve the exact player UUID recorded by the interaction entity.
$execute as @a[nbt={UUID:$(interaction_player)}] at @s run function zbk_der_eisendrache:tram/call_console/management/call
