# Run as arrow entity - log charge level and kill arrow
# Arrow damage values: quick shot ~0.5-1.5, charged shot ~2.0+

# Store arrow damage to temp score (multiply by 10 for precision)
execute store result score #bow_damage temp run data get entity @s damage 10

# Log based on damage threshold (20 = 2.0 damage = fully charged)
execute if score #bow_damage temp matches 18.. on origin run tellraw @s[tag=debug] [{"text":"[Bow] ","color":"gold"},{"text":"Charged Shot","color":"green"}]
execute if score #bow_damage temp matches ..17 on origin run tellraw @s[tag=debug] [{"text":"[Bow] ","color":"gold"},{"text":"Quick Shot","color":"yellow"}]

# Kill the arrow (for now, just logging - no damage yet)
kill @s
