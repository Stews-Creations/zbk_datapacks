# Swap two elements in the current array using macro parameters
# Called with: function shuffle/swap_macro {i:3, j:1}
# Swaps current[i] with current[j]

$data modify storage zombies:wolf_shuffle temp set from storage zombies:wolf_shuffle current[$(i)]
$data modify storage zombies:wolf_shuffle current[$(i)] set from storage zombies:wolf_shuffle current[$(j)]
$data modify storage zombies:wolf_shuffle current[$(j)] set from storage zombies:wolf_shuffle temp

$tellraw @a[tag=debug] [{"text":"[Wolf Shuffle] Swapped positions $(i) and $(j)","color":"gray"}]
