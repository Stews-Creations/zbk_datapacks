# Request hook example: veto jump pad 99 only when the demo flag is enabled.
# Read jump_pad_id from the current the base pack event frame; do not keep this frame after dispatch.
execute if score #active zbk.template matches 1 if score #block_jump_pad zbk.template matches 1 if data storage zbk:events stack[-1].context{jump_pad_id:99} run tellraw @a[tag=debug] {"text":"[ZBK Template] before_jump_pad_purchase: requesting a block for pad 99.","color":"gray"}
execute if score #active zbk.template matches 1 if score #block_jump_pad zbk.template matches 1 if data storage zbk:events stack[-1].context{jump_pad_id:99} run function zbk:global/events/request/block
