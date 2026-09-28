# === SCAN NEXT JUMP PAD ID (RECURSIVE) ===
# Reads one entity's jump_pad_id, appends to used_ids_string, deduplicates, recurses

# Get the ID from the next id_scan entity
execute store result score #scan_id global run scoreboard players get @e[type=marker,tag=id_scan,limit=1,sort=arbitrary] jump_pad_id

# Store new_id and current string for macro helpers
execute store result storage zombies:temp id_scan_args.new_id int 1 run scoreboard players get #scan_id global
data modify storage zombies:temp id_scan_args.current set from storage zombies:temp used_ids_string

# Append to string (first ID has no comma prefix)
execute if score #id_scan_count global matches 0 run function zombies:build_kit/util/id_scan/append_first with storage zombies:temp id_scan_args
execute unless score #id_scan_count global matches 0 run function zombies:build_kit/util/id_scan/append with storage zombies:temp id_scan_args

# Increment count
scoreboard players add #id_scan_count global 1

# Remove id_scan tag from all entities sharing this same ID (deduplication)
execute as @e[type=marker,tag=id_scan] if score @s jump_pad_id = #scan_id global run tag @s remove id_scan

# Recurse if any id_scan entities remain
execute if entity @e[type=marker,tag=id_scan] run function zombies:build_kit/management/jump_pad/scan_next_id
