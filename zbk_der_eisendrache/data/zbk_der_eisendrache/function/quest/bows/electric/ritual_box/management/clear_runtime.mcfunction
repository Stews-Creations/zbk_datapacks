# Cleanup intentionally runs outside the active stage as well as during reset.
# Remove transient content and travelling orbs, leaving persistent placement available for reconstruction.

kill @e[tag=de_eb_runtime]
kill @e[tag=de_eb_orb]
scoreboard players set #active de_eb_state 0
