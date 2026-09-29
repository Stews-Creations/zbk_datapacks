# Pack-a-Punch Interaction Handler
# Triggered when player right-clicks pack_a_punch_interaction entity.
# Called from advancement/interaction_pack_a_punch.json.

# Revoke advancement so it can trigger again.
advancement revoke @s only zbk:interaction_pack_a_punch

# Block interaction if player is downed.
execute if entity @s[team=downed] run return fail

# Build manager stick -> open PaP config dialog instead of buying.
execute if items entity @s weapon.mainhand *[custom_data~{build_manager:true}] run return run function zbk:map_elements/pack_a_punch/build_kit/dialogs/open_dialog_with_tag

# Claim window: try this before pap_busy so a stale busy tag cannot block a valid claim.
execute if entity @e[type=marker,distance=..5,tag=pack_a_punch,tag=pap_claim_ready,limit=1] run return run function zbk:map_elements/pack_a_punch/management/claim

# Mid-animation: ignore click silently.
execute if entity @e[type=marker,distance=..5,tag=pack_a_punch,tag=pap_busy,limit=1] run return 1

# Song lock: buy sound still playing.
execute if entity @e[type=marker,distance=..5,tag=pack_a_punch,tag=pap_song_lock,limit=1] run return 1

# Check if power is on. toggle_required forces #power=1 when not required.
execute if score #power power matches 0 run tellraw @s [{"text":"[Pack-a-Punch] ","color":"light_purple"},{"text":"Power must be on","color":"red"}]
execute if score #power power matches 0 run return fail

# Idle: normal buy.
function zbk:map_elements/pack_a_punch/management/buy
