# Preserve pickup position, and use only the exact clicking player within reach.
$execute as @a[nbt={UUID:$(player)}] if entity @s[distance=..6] run function zbk_der_eisendrache:quest/bows/binding/interactions/bind {quest:$(quest)}
