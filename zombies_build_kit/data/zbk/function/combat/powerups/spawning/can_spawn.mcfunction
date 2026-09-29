# Query only: the accepted spawn owns the shared cap/kill-gate update.
execute if score #global game_active matches 0 run return 1
execute if score #global game_active matches 1.. if score #global drop_req_kills matches ..0 if score #global drop_round_drops matches ..3 run return 1
return 0
