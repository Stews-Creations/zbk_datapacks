# Log bow shot (placeholder for charge detection)
# With consumable animation, we don't have a real arrow to check charge from
# For now just log that a shot was fired

tellraw @s[tag=debug] [{"text":"[Bow] ","color":"gold"},{"text":"Shot fired","color":"green"}]
