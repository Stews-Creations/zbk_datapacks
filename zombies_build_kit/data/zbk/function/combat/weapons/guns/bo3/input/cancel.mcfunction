# Cancel a queued trigger/burst when the displayed weapon changes.
scoreboard players set @s bo3_hold 0
scoreboard players set @s bo3_press 0
scoreboard players set @s bo3_burst_1 0
scoreboard players set @s bo3_burst_2 0
scoreboard players set @s bo3_burst_3 0
scoreboard players set @s bo3_burst_4 0
function zbk:combat/weapons/events/extension/guns/bo3/input/cancel
execute if data storage zbk:events result{handled:1b} run return run data get storage zbk:events result.return_value
