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

2.3.0
unfixed issues :
deleting a boon in the boon manager does not delete all related screen objects

new issues :

fixed issues :
many users cannot execute commands with the Gift key

new/changed features :
menu key switched back to Codex key (default = C)
executing commands now requires holding down the key for 1.5s

other :
updated modfile.txt to work with new modimporter
removed 'Scripts' folder

2.3.1

unfixed issues :
deleting a boon in the boon manager does not delete all related screen objects

new issues :
some casts have bugged animations
pom of power spawns in a random location in the room
some users crash when opening the boon manager

fixed issues :
consumable-type boons don't work properly or cause crashes
can't select rarity of consumable-type boons
consumable-type boons not displayed in the boon manager
pom of power doesn't spawn

2.3.2

ongoing issues :
some casts have bugged animations
pom of power spawns in a random location in the room
some users crash when opening the boon manager

new issues :
various bugs with all mode in boon manager
opening the boon manager during a run resets progress of stacking keepsakes

fixed issues :
beowulf shield specific boons not displayed correctly
deleting a boon in the boon manager does not delete all related screen objects

2.3.3

ongoing issues :
some casts have bugged animations
pom of power spawns in a random location in the room
some users crash when opening the boon manager
various bugs with all mode in boon manager
opening the boon manager during a run resets progress of stacking keepsakes

fixed issues :
'ricochet fire' hammer boon missing for gun
hades keepsake increase call level when some menus are opened or closed
crash on opening cerberus entry

removed feature :
pact of punishment removed from Skelly. changing the pact options during a run bricks that option,
and making it work during an ongoing run is too much work.
unless many users request this feature it won't be added again.

2.4.0

ongoing issues :
some casts have bugged animations
pom of power spawns in a random location in the room
some users crash when opening the boon manager
various bugs with all mode in boon manager
opening the boon manager during a run resets progress of stacking keepsakes

fixed issues :
codex not closing when opening certain screens
fixed some boons not having god colors in the boon manager

changed feature :
command key changed to 'Confirm' (default = Enter) and no longer needs to be held down

removed feature :
spawn boss removed

new feature :
load boss fight - opening a boss entry teleports you in a room to fight them
your saved state is restored when entering the room
suicide added to Skelly entry

2.4.1

ongoing issues :
some casts have bugged animations
some users crash when opening the boon manager
various bugs with all mode in boon manager
opening the boon manager during a run resets progress of stacking keepsakes

fixed issues :
getting boons normally and then deleting them individually in the boon manager causes a crash for some of them
some 4th aspect specific hammer boons not added
poseidon huge catch missing
chaos and hermes boons not able to have their rarity upgraded
one missing chaos boon
pom of power spawns in a random location in the room

2.4.2

fixed issues :
(Boon Selector)
dionysus trippy flare caused a crash
curse of longing was listed twice
adding weapon-slot boons or retaliation boons removed each other
(Boon Manager)
all mode + rarity mode crashed with some boons
all mode + level mode did not update the on-screen level display
rarity mode crash with some boons
level mode crash with some boons

2.4.3

ongoing issues :
some casts have bugged animations
some users crash when opening the boon manager
various bugs with all mode in boon manager

fixed issues :
opening the boon manager during a run resets progress of stacking keepsakes (@SpaceHamster)
deleting a boon in the boon manager sometimes only removed 1 level

new/changed features :
fish can now be spawned
level cap for boons increased to 100 from 10

2.4.4

ongoing issues :
some casts have bugged animations
some users crash when opening the boon manager
various bugs with all mode in boon manager

fixed issues :
rarity mode duplicates boons with levels

changed feature :
code rewrite/optimization

2.4.5

ongoing issues :
some casts have bugged animations
some users crash when opening the boon manager
various bugs with all mode in boon manager

fixed issues :
god mode causes issues with the boon manager
cerberus entry causes zagreus to turn into a box during a run
pressing confirm while having the boon list opened opens the boon selector

2.4.6

ongoing issues :
some casts have bugged animations
some users crash when opening the boon manager
various bugs with all mode in boon manager

updated features:
boon manager page buttons can now be controlled with shoulder buttons on controller

fixed issues:
pony qol practice fishing works during boss rush encounters

2.4.7

fixed issues :
rare crash in boss rush when there is special dialogue
animations are not properly loaded when equipping certain boons (requires modutil)
added missing 'Rending Claws' upgrade to Twin Fists hammer