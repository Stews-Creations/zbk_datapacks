# Per-machine claim reset. Run as @s = the verified claim-ready marker, at @s.
# All selectors are machine-local (distance=..3 from marker) — safe even when two
# PaP machines are placed within the player's 5-block reach.
#
# pap_anim is intentionally NOT reset — the cycle must continue so unlock_after_song
# fires at pap_anim=160 to lift pap_song_lock and revert the purchase text. The
# pap_claim_ready tag filter on claim_timeout prevents it from double-firing post-claim,
# and the on_tick safety net auto-resets pap_anim at 281.

# Remove claim_ready so further clicks route to buy (not re-claim).
function zbk:dispatch/extension/map_elements/pack_a_punch/claim/reset_machine/1
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
tag @s remove pap_claim_ready

# Blank this machine's purchase text and tag it for deferred revert — text stays empty
# until the machine is buyable again (song lock cleared OR equip cooldown done).
execute as @e[type=text_display,distance=..3,tag=pack_a_punch_purchase_text,limit=1,sort=nearest] run data modify entity @s text set value [{"text":""}]
execute as @e[type=text_display,distance=..3,tag=pack_a_punch_purchase_text,limit=1,sort=nearest] run tag @s add pap_text_revert_pending

# Hide this machine's gun (gun_hide is already distance=..3 marker-local).
function zombies:map_elements/pack_a_punch/animations/gun_hide
