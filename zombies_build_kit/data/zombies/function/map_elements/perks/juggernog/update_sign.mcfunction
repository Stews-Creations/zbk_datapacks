# === UPDATE JUGGERNOG MACHINE SIGN ===
# Modify the block one blocks below (~ ~-1 ~)
# Place command block above sign and run command

data modify block ~ ~-1 ~ front_text set value {messages:["",{ "text":"Purchase","color":"gold","click_event":{"action":"run_command","command":"/function zombies:map_elements/perks/juggernog/buy"}},"",""]}
