# Return 1 only for Jump Pad ID 4 while the Rocket Test sequence is active.
execute unless score #active zbk.de matches 1 run return 0
$execute if score #check_jp_id jump_pad_id matches $(id) if score #check_jp_id jump_pad_id matches 4 if score #rocket_test_launch rkt_test_state matches 1.. run return 1
return 0
