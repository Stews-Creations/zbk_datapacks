# Pack-a-Punch machine

Owns reusable Pack-a-Punch markers, machine displays, purchase flow, upgrade cycling, claims, and reset behavior. Saved markers are the source of truth; `initialize` rebuilds their derived runtime entities.

`management/` owns player entry and pending-upgrade recovery. `upgrade/` charges points and saves the bought weapon and slot. `cycle/` and `animations/` own machine presentation, while `claim/` restores the saved weapon. Pack I costs 5,000 points; Pack II costs 2,500 points and applies the selected ammunition effect. The module accepts supported weapons through the shared Combat purchase path.

The four directional display functions use the shared Pack-a-Punch font assets. Upgrade purchases use the shared sound event, and no map selection or map-specific presentation is required.
