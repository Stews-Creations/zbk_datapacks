# Explicit electric-quest reset; player departure and binding changes never call this.
scoreboard players reset * de_es_souls
function zbk_der_eisendrache:quest/bows/electric/soul_pots/initialize
scoreboard players reset * de_ec_used
scoreboard players reset * de_ec_fire
function zbk_der_eisendrache:quest/bows/electric/reforging/management/reset

function zbk_der_eisendrache:quest/bows/electric/ritual_box/management/reset
