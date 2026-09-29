# Context: paired decoy as executor, updated bomb position as origin.
# Teleport and fire cleanup form one operation for the same selected entity.

# Keep the caller position (the bomb), while @s is its decoy.
# Keep the tiny AI target below the bomb's surface so its invisible body cannot shield zombies.
tp @s ~ ~-0.3 ~
data modify entity @s Fire set value 0s
