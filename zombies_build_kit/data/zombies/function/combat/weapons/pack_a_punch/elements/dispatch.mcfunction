# Element dispatcher — called from collide.mcfunction as @s = the hit entity.
# Returns 1 if the bullet was consumed by an element effect (caller skips damage).

# Ray Gun never triggers Pack-a-Punch elements.
execute if score #gun_id stats matches 7 run return 0
execute if entity @s[tag=immune_elements] run return 0

# Fast-path: no element on this weapon
execute if score #element stats matches 0 run return 0

# Element 1 = Blast Furnace
execute if score #element stats matches 1 run return run function zombies:combat/weapons/pack_a_punch/elements/blast_furnace/handle

# Element 2 = Dead Wire
execute if score #element stats matches 2 run return run function zombies:combat/weapons/pack_a_punch/elements/dead_wire/handle

# Element 3 = Fireworks
execute if score #element stats matches 3 run return run function zombies:combat/weapons/pack_a_punch/elements/fireworks/handle

# Element 4 = Thunder Wall
execute if score #element stats matches 4 run return run function zombies:combat/weapons/pack_a_punch/elements/thunder_wall/handle

# Element 5 = Turned
execute if score #element stats matches 5 run return run function zombies:combat/weapons/pack_a_punch/elements/turned/handle
