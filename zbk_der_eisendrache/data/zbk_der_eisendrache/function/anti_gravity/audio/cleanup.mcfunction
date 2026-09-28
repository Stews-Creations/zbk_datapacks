# Reset audio without playing the normal room-deactivation cue.
scoreboard players set #audio_next de_ag_cycle 0
scoreboard players set #audio_elapsed de_ag_cycle 0
stopwatch remove zbk_der_eisendrache:anti_gravity/audio
stopsound @a player zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_start
stopsound @a player zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_loop
stopsound @a player zbk_der_eisendrache:der_eisendrache.anti_gravity.room.anti_gravity_stop
