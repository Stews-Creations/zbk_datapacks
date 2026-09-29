execute unless score #active zbk.de matches 1 run return 0
execute if data storage zbk:events stack[-1].context{jump_pad_id:4} if score #rocket_test_launch rkt_test_state matches 1.. run function zbk:global/events/request/block
