# Refund a stranded dog and remove it without drops.
# Runs as and at: wolf.

function zbk:behavior/relocation/refunds/refund_spawn_slot

data merge entity @s {DeathLootTable:"minecraft:empty",Silent:1b}
tp @s ~ -1000 ~
kill @s
