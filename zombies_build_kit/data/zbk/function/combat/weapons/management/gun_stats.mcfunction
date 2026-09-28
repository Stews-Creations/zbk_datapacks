# Shared weapon profiles. BO3 runtime tuning lives in blockbench/bo3_weapons/gameplay.json.
# Retired named records below are acquisition aliases for existing map commands.
function zbk:combat/weapons/guns/bo3/registry/load

data modify storage zbk:weapons guns.double_barrel_shotgun set from storage zbk:bo3 weapons.w42.base
data modify storage zbk:weapons guns.flame_thrower set from storage zbk:bo3 weapons.w25.base
data modify storage zbk:weapons guns.grenade_launcher set from storage zbk:bo3 weapons.w46.base
data modify storage zbk:weapons guns.light_machine_gun set from storage zbk:bo3 weapons.w34.base
data modify storage zbk:weapons guns.pistol set from storage zbk:bo3 weapons.w20.base
data modify storage zbk:weapons guns.rainbow_rifle set from storage zbk:bo3 weapons.w30.base
# Normal reload follows the native recording; Speed Cola applies the standard half-time rule.
data modify storage zbk:weapons guns.ray_gun set value {id:7, pap_name:"Porter's X2 Ray Gun", damage:38, max_ammo:50, max_reserve:150, reload_ticks:87, is_piercing:1, spread_radius:1, trail_spacing:20, is_explosive:1, explosive_damage:38, explosive_radius:3}
# Explicit Ray Gun PaP damage; both tiers share this profile, without per-hit multiplication.
data modify storage zbk:weapons guns.ray_gun_pap set from storage zbk:weapons guns.ray_gun
data modify storage zbk:weapons guns.ray_gun_pap.damage set value 50
data modify storage zbk:weapons guns.ray_gun_pap.explosive_damage set value 50
data modify storage zbk:weapons guns.rifle set from storage zbk:bo3 weapons.w33.base
data modify storage zbk:weapons guns.shotgun set from storage zbk:bo3 weapons.w39.base
data modify storage zbk:weapons guns.sniper set from storage zbk:bo3 weapons.w44.base
