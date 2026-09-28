# ===================================
# PACK-A-PUNCH MODULE - INITIALIZE
# ===================================
# Purpose: Reset/initialize all Pack-a-Punch display entities
# Called from on_load.mcfunction and game reset
# ===================================

# Kill old display entities
kill @e[type=item_display,tag=pack_a_punch_ui]
kill @e[type=text_display,tag=pack_a_punch_ui]
kill @e[type=interaction,tag=pack_a_punch_ui]

# Reset transient state on all PaP markers — schedules are wiped by /reload,
# so any in-flight buy/claim/lock tags must be cleared to avoid a stuck machine.
tag @e[type=marker,tag=pack_a_punch] remove pap_busy
tag @e[type=marker,tag=pack_a_punch] remove pap_claim_ready
tag @e[type=marker,tag=pack_a_punch] remove pap_song_lock
tag @e[type=marker,tag=pack_a_punch] remove pap_anim_active
scoreboard players reset @e[type=marker,tag=pack_a_punch] pap_anim

# Restore any in-flight buyer's slot — same reasoning. The player's slot was zeroed
# by lose_gun and their points are gone, but the in-flight upgrade is now irrecoverable
# (schedules wiped, marker state cleared). Without this, pap_pending_slot stays set and
# the player is locked out of every PaP machine for the rest of the session.
execute as @a[scores={pap_pending_slot=1..3}] run tag @s add pap_was_pending
execute as @a[scores={pap_pending_slot=1}] run scoreboard players operation @s gun_1 = @s pap_pending_gun_id
execute as @a[scores={pap_pending_slot=2}] run scoreboard players operation @s gun_2 = @s pap_pending_gun_id
execute as @a[scores={pap_pending_slot=3}] run scoreboard players operation @s gun_3 = @s pap_pending_gun_id
scoreboard players reset @a pap_pending_slot
scoreboard players reset @a pap_pending_tier
scoreboard players reset @a pap_pending_gun_id
execute as @a[tag=pap_was_pending] run function zbk:player/inventory/weapons
tag @a remove pap_was_pending

# Spawn displays for each Pack-a-Punch marker (fresh, with "Purchase" text).
execute as @e[type=marker,tag=pack_a_punch,tag=!zbk.custom_presentation] at @s run function zbk:map_elements/pack_a_punch/display/update_display

# Debug confirmation
function zbk:debug/info {f:"PAP",m:"Pack-a-Punch system initialized"}
