$execute if data storage zombies:de_orb_sound listeners[{uuid:$(uuid)}] run return 0
playsound zbk_der_eisendrache:der_eisendrache.quest.bows.electric.lightning_ball master @s ~ ~ ~ 1 1
$data modify storage zombies:de_orb_sound listeners append value {uuid:$(uuid)}
