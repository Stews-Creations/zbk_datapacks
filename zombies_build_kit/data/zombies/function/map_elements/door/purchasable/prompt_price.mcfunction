# === PROMPT DOOR PRICE ===
# Shows tellraw message with clickable link to set door price (debug only)

execute if entity @s[tag=debug,scores={debug_level=4..}] run tellraw @s [{"text":"Set the door price: ","color":"gold"},{"click_event":{"action":"suggest_command","command":"/trigger set_door_price set"},"color":"green","text":"Click Here!"},{"text":" (type your number after 'set')","color":"yellow"}]

# Reset trigger
scoreboard players reset @s prompt_door_price
scoreboard players enable @s prompt_door_price
