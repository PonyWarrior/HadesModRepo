Files :
Content/Mods/CodexMenu_PonyWarrior/Scripts/CodexMenu.lua

Change logs :

1.0.0
Initial release

1.0.1
Updated mod files to update v0.25053

1.0.2
Loot now spawns next to player

1.2.0
Can spawn all items
Can switch weapon
No longer need to re-enter a room after clearing all boons
Mod no longer modifies original game files, has its own file

1.2.1
Fix mod not loading

1.3.0
Can spawn all enemies
Can spawn all bosses
Can spawn Thanatos NPC
Clear all boons command now linked to Zagreus
Added launch greater call to Achilles
Added open mirror to Nyx
Added open pact to Skelly
Added open keepsake rack to Cerberus
Added open charon well to Charon
Added open pool of purging to Hypnos

1.3.1
Updated mod files to update v0.25129
Added Chaos boon spawn

1.3.2
Fix crash if you press codex key while codex is opening
Added remove last added trait to Orpheus
Added upgrade last added trait rarity to Eurydice

1.3.3
Updated to game version 0.26829

1.4.0
Updated to game version 0.27008
Removed feature "Remove last added trait (Orpheus)"
Removed feature "Upgrade last added trait rarity (Eurydice)"
Added feature "Upgrade all boons rarity (Eurydice)"
Added feature "Save state (Orpheus)"
Added feature "Load saved state (Patroclus)"
Merged all files into one and no longer modify original files

1.4.1
Feature "Save State (Orpheus)" now saves Weapon, Weapon aspect, Keepsake and Assist

1.5.0
Fixed "Upgrade all boons rarity (Eurydice)" not upgrading Hermes or Chaos boons
Reworked feature "Open mirror of night (Nyx)" now opens a custom mirror with free upgrades, unlock and refund

2.0.0
Massive overhaul, how many features work has been changed
All (gods, chaos and hammer) entries now use the [Boon selector]
Removed feature "Upgrade all boons rarity (Eurydice)"
Added feature "Open Boon Manager (Eurydice)"
Added feature "Show all duo boons (Dusa)"
Added feature "Show all hammer upgrades for current weapon (Daedalus Hammer)"
Switching weapon now also opens the aspect menu

2.0.1
Fix a crash when trying to save a state without a weapon aspect
Fix hchc boons removing equipped weapon boons
Fix hchc boons removed when changing weapon boon

2.0.2
Add modfile.txt for compatibility with modimporter

2.0.3
New game update fix

2.1.0
Added all new boons
Fixed a bug with the Boon Manager where daedalus hammer boons caused a crash
Added rarity color codes to Boon Manager
Added level display to Boon Manager
Added decrease sub-mode for level and rarity modes in Boon Manager (all mode WIP)
Already equipped boons are now grayed out in the Boon Selector

2.2.0
new issues :
deleting a boon in the boon manager does not delete all related screen objects

fixed issues :
pressing the codex key immediately opens both the codex and executes the menu command
can't close or use boon selector and manager
fixed some artifacts not spawning or crashing the game

new/changed features :
menu key switched to 'Gift' (default = G)
pressing the codex key (default = C) again after the codex is opened will close it
