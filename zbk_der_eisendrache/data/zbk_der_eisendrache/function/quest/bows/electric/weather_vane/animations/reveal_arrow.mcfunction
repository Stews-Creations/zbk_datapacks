# Context: arrow marker after all reveal walls have broken.
# Sound, reward readiness, and model synchronization share this marker selection.

playsound minecraft:block.stone.break master @a[distance=..24] ~ ~ ~ 1 0.7
playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.arrow_reveal master @a[distance=..8] ~ ~ ~ 1 1
scoreboard players set #1 de_bow_ready 1
function zbk_der_eisendrache:quest/bows/binding/display/sync with entity @s data
