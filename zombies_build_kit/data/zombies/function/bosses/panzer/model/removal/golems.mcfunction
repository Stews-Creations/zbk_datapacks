# Remove Panzer controller golems before touching the Animated Java model.
# Keep this limited to controllers with Panzer tags or IDs so regular golems survive.

tag @e[type=minecraft:iron_golem,tag=panzer_remove] remove panzer_remove
tag @e[type=minecraft:iron_golem,tag=panzer_ai] add panzer_remove
tag @e[type=minecraft:iron_golem,tag=panzer_controller] add panzer_remove
tag @e[type=minecraft:iron_golem,tag=new_panzer] add panzer_remove
tag @e[type=minecraft:iron_golem,scores={panzer_id=1..}] add panzer_remove

tp @e[type=minecraft:iron_golem,tag=panzer_remove] ~ -256 ~
kill @e[type=minecraft:iron_golem,tag=panzer_remove]
