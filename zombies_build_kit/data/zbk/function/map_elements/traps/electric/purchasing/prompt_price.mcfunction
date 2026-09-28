# === PROMPT TRAP PRICE ===
# Shows tellraw message with clickable link to set trap price

tellraw @s [{"text":"Set the trap price: ","color":"gold"},{"click_event":{"action":"suggest_command","command":"/trigger set_trap_price set "},"color":"green","text":"Click Here!"},{"text":" (type your number after 'set')","color":"yellow"}]

# Reset trigger
scoreboard players reset @s prompt_trap_price
scoreboard players enable @s prompt_trap_price
