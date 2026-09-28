# Context: one persistent panel. The previous owner remains available throughout this reset pass.
# An ownership change rearms touch; ordinary presence resets do not erase the contact latch.

scoreboard players set @s de_ep_present 0
scoreboard players set @s de_ep_near 0
scoreboard players set @s de_ep_close 0
execute unless score #owner de_ep_state = #1 de_bow_owner run scoreboard players set @s de_ep_touch 0
