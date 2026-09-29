# Gameplay presentation is exclusive to Adventure mode.
execute unless entity @s[gamemode=adventure] run return 0
tag @s add zbk_hud_visible
# Build and render the layered actionbar HUD for the current player.
function zbk:player/actionbar/context

# Fixed-width defaults keep every layer independent of its visible contents.
data merge storage zbk:hud {args:{ammo_pad:"   ",reserve_pad:"   ",ammo_color:"#F2E6C9",pap_icon:"\uE046",grenades:"\uE001"}}

# Select the active ammunition objectives for the render macro.
execute if score @s active_weapon matches 0 run data merge storage zbk:hud {args:{ammo_objective:"ammo_1",max_ammo_objective:"max_ammo_1",reserve_objective:"reserve_ammo_1"}}
execute if score @s active_weapon matches 1 run data merge storage zbk:hud {args:{ammo_objective:"ammo_2",max_ammo_objective:"max_ammo_2",reserve_objective:"reserve_ammo_2"}}
execute if score @s active_weapon matches 2 run data merge storage zbk:hud {args:{ammo_objective:"ammo_3",max_ammo_objective:"max_ammo_3",reserve_objective:"reserve_ammo_3"}}

# Pad both values to four monospaced digits. Supported HUD range: 0-9999.
execute if entity @s[scores={active_weapon=0,ammo_1=10..99}] run data modify storage zbk:hud args.ammo_pad set value "  "
execute if entity @s[scores={active_weapon=0,ammo_1=100..999}] run data modify storage zbk:hud args.ammo_pad set value " "
execute if entity @s[scores={active_weapon=0,ammo_1=1000..9999}] run data modify storage zbk:hud args.ammo_pad set value ""
execute if entity @s[scores={active_weapon=1,ammo_2=10..99}] run data modify storage zbk:hud args.ammo_pad set value "  "
execute if entity @s[scores={active_weapon=1,ammo_2=100..999}] run data modify storage zbk:hud args.ammo_pad set value " "
execute if entity @s[scores={active_weapon=1,ammo_2=1000..9999}] run data modify storage zbk:hud args.ammo_pad set value ""
execute if entity @s[scores={active_weapon=2,ammo_3=10..99}] run data modify storage zbk:hud args.ammo_pad set value "  "
execute if entity @s[scores={active_weapon=2,ammo_3=100..999}] run data modify storage zbk:hud args.ammo_pad set value " "
execute if entity @s[scores={active_weapon=2,ammo_3=1000..9999}] run data modify storage zbk:hud args.ammo_pad set value ""
execute if entity @s[scores={active_weapon=0,reserve_ammo_1=10..99}] run data modify storage zbk:hud args.reserve_pad set value "  "
execute if entity @s[scores={active_weapon=0,reserve_ammo_1=100..999}] run data modify storage zbk:hud args.reserve_pad set value " "
execute if entity @s[scores={active_weapon=0,reserve_ammo_1=1000..9999}] run data modify storage zbk:hud args.reserve_pad set value ""
execute if entity @s[scores={active_weapon=1,reserve_ammo_2=10..99}] run data modify storage zbk:hud args.reserve_pad set value "  "
execute if entity @s[scores={active_weapon=1,reserve_ammo_2=100..999}] run data modify storage zbk:hud args.reserve_pad set value " "
execute if entity @s[scores={active_weapon=1,reserve_ammo_2=1000..9999}] run data modify storage zbk:hud args.reserve_pad set value ""
execute if entity @s[scores={active_weapon=2,reserve_ammo_3=10..99}] run data modify storage zbk:hud args.reserve_pad set value "  "
execute if entity @s[scores={active_weapon=2,reserve_ammo_3=100..999}] run data modify storage zbk:hud args.reserve_pad set value " "
execute if entity @s[scores={active_weapon=2,reserve_ammo_3=1000..9999}] run data modify storage zbk:hud args.reserve_pad set value ""

function zbk:player/actionbar/prepare/ammo/ammo_color with storage zbk:hud args

# Ammo colors: ivory normally, yellow at <=20%, red empty, gray reloading.
execute if entity @s[scores={active_weapon=0,ammo_1=0}] run data modify storage zbk:hud args.ammo_color set value "red"
execute if entity @s[scores={active_weapon=1,ammo_2=0}] run data modify storage zbk:hud args.ammo_color set value "red"
execute if entity @s[scores={active_weapon=2,ammo_3=0}] run data modify storage zbk:hud args.ammo_color set value "red"
execute if entity @s[scores={active_weapon=0,is_reloading_1=1}] run data merge storage zbk:hud {args:{ammo_color:"gray"}}
execute if entity @s[scores={active_weapon=1,is_reloading_2=1}] run data merge storage zbk:hud {args:{ammo_color:"gray"}}
execute if entity @s[scores={active_weapon=2,is_reloading_3=1}] run data merge storage zbk:hud {args:{ammo_color:"gray"}}

function zbk:player/actionbar/prepare/ammo/ammo_layout

execute if entity @s[scores={active_weapon=0,max_reserve_1=0}] run function zbk:player/actionbar/prepare/ammo/ammo_no_reserve with storage zbk:hud args
execute if entity @s[scores={active_weapon=1,max_reserve_2=0}] run function zbk:player/actionbar/prepare/ammo/ammo_no_reserve with storage zbk:hud args
execute if entity @s[scores={active_weapon=2,max_reserve_3=0}] run function zbk:player/actionbar/prepare/ammo/ammo_no_reserve with storage zbk:hud args
execute if entity @s[scores={active_weapon=0,max_reserve_1=1..}] run function zbk:player/actionbar/prepare/ammo/ammo_with_reserve with storage zbk:hud args
execute if entity @s[scores={active_weapon=1,max_reserve_2=1..}] run function zbk:player/actionbar/prepare/ammo/ammo_with_reserve with storage zbk:hud args
execute if entity @s[scores={active_weapon=2,max_reserve_3=1..}] run function zbk:player/actionbar/prepare/ammo/ammo_with_reserve with storage zbk:hud args

# One grenade icon and a count; selection still uses the existing drop-key control.
data modify storage zbk:hud args.grenades set value "\uE001"
execute if score @s grenade_ammo matches ..0 run data modify storage zbk:hud args.grenades set value "\uE002"

# Pack-a-Punch and alternate-ammo icon for the active weapon.
execute if entity @s[scores={active_weapon=0,tier_1=2,element_1=1}] run data modify storage zbk:hud args.pap_icon set value "\uE011"
execute if entity @s[scores={active_weapon=0,tier_1=2,element_1=2}] run data modify storage zbk:hud args.pap_icon set value "\uE012"
execute if entity @s[scores={active_weapon=0,tier_1=2,element_1=3}] run data modify storage zbk:hud args.pap_icon set value "\uE013"
execute if entity @s[scores={active_weapon=0,tier_1=2,element_1=4}] run data modify storage zbk:hud args.pap_icon set value "\uE014"
execute if entity @s[scores={active_weapon=0,tier_1=2,element_1=5}] run data modify storage zbk:hud args.pap_icon set value "\uE015"
execute if entity @s[scores={active_weapon=1,tier_2=2,element_2=1}] run data modify storage zbk:hud args.pap_icon set value "\uE011"
execute if entity @s[scores={active_weapon=1,tier_2=2,element_2=2}] run data modify storage zbk:hud args.pap_icon set value "\uE012"
execute if entity @s[scores={active_weapon=1,tier_2=2,element_2=3}] run data modify storage zbk:hud args.pap_icon set value "\uE013"
execute if entity @s[scores={active_weapon=1,tier_2=2,element_2=4}] run data modify storage zbk:hud args.pap_icon set value "\uE014"
execute if entity @s[scores={active_weapon=1,tier_2=2,element_2=5}] run data modify storage zbk:hud args.pap_icon set value "\uE015"
execute if entity @s[scores={active_weapon=2,tier_3=2,element_3=1}] run data modify storage zbk:hud args.pap_icon set value "\uE011"
execute if entity @s[scores={active_weapon=2,tier_3=2,element_3=2}] run data modify storage zbk:hud args.pap_icon set value "\uE012"
execute if entity @s[scores={active_weapon=2,tier_3=2,element_3=3}] run data modify storage zbk:hud args.pap_icon set value "\uE013"
execute if entity @s[scores={active_weapon=2,tier_3=2,element_3=4}] run data modify storage zbk:hud args.pap_icon set value "\uE014"
execute if entity @s[scores={active_weapon=2,tier_3=2,element_3=5}] run data modify storage zbk:hud args.pap_icon set value "\uE015"

# Basic Pack uses the empty socket; mod variants bake the gold frame over the icon.
data modify storage zbk:hud args.ammo_frame_right set value "\uE099"
execute if data storage zbk:hud args{pap_icon:"\uE011"} run data modify storage zbk:hud args.ammo_frame_right set value "\uE0A0"
execute if data storage zbk:hud args{pap_icon:"\uE012"} run data modify storage zbk:hud args.ammo_frame_right set value "\uE0A1"
execute if data storage zbk:hud args{pap_icon:"\uE013"} run data modify storage zbk:hud args.ammo_frame_right set value "\uE0A2"
execute if data storage zbk:hud args{pap_icon:"\uE014"} run data modify storage zbk:hud args.ammo_frame_right set value "\uE0A3"
execute if data storage zbk:hud args{pap_icon:"\uE015"} run data modify storage zbk:hud args.ammo_frame_right set value "\uE0A4"

function zbk:player/actionbar/reload/prepare
function zbk:player/actionbar/prepare/equipment
function zbk:player/actionbar/prepare/weapon_name
function zbk:player/actionbar/prepare/round/round
execute if score @s gun_side matches 2 run return run function zbk:player/actionbar/render_right with storage zbk:hud args
function zbk:player/actionbar/render with storage zbk:hud args
