# === CLEANUP SOLO DECOYS ===
# Purpose: Remove all decoy entities after revive or death
kill @e[type=zombie,tag=solo_down_decoy]
# Clean up any rotten flesh drops from the kill
kill @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh"}}]
