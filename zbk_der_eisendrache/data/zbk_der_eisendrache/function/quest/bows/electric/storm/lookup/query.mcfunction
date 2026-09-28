# Unlinked entities must never reuse the previous query's link.
data modify storage zbk:temp storm_lookup set value {link:0}
execute store result storage zbk:temp storm_lookup.link int 1 run scoreboard players get @s de_storm_link
function zbk_der_eisendrache:quest/bows/electric/storm/lookup/query_link with storage zbk:temp storm_lookup
