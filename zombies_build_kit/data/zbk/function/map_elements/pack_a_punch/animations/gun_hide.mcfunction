# Called with position context near the relevant PaP marker (from claim.mcfunction at the
# claimed marker, from claim_timeout.mcfunction as the timing-out marker). Kills only the
# gun display at this machine, not all PaP guns in the world.

kill @e[type=item_display,distance=..3,tag=pack_a_punch_gun_display,limit=1,sort=nearest]
