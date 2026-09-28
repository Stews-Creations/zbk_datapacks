# Called by the death_machine using_item advancement.
# Sets the auto-firing bridge flag, fires this tick, then revokes so the advancement re-triggers next tick.
# Revoke happens here (not in fire_tick) so it runs even when fire_tick early-returns on cooldown.
scoreboard players set @s auto_firing 4
function zbk:combat/powerups/death_machine/fire_tick
advancement revoke @s only zbk:death_machine
