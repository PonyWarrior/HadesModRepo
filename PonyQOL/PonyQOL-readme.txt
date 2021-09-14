
1.0.0
Initial release

1.1.0

new feature :
hammer boons in the boon list now show which weapon is required

2.0.0

fixed issues :
some boons cause the boon list to crash

new features:
mod renamed to Pony's Quality Of Life
added incompatibility display in the boon list
added pom icon to level-able boons for all menus
added permanent chamber counter
can no longer roll Demeter's Nourished Soul boon with Lasting Consequences 4 pact option

2.1.0

fixed issues:
closing the boon tray hides the chamber counter

new features:
make Lucifer beam destroy projectiles
added weapon boon lists only listing their own hammer upgrades
added charon boon list
added inactive mirror upgrade to a boon's possible requirement in boon list
added bulk buy toggle to wretched broker

2.1.1

fixed issues:
game sometimes crashes when entering rooms with a charon well
incorrect modfile.txt

new features:
added reset button to pact

2.2.0

new features:
added Commendations tab to the codex
- all victory messages are listed along with their requirements
- on completion of a run all messages you qualified for are marked as completed

2.3.0

new features:
added Infographs/Flowcharts for each god in the boon list
- includes Zeus, Poseidon, Athena, Aphrodite, Ares, Hermes, Dionysus, Demeter
added boon slot requirement display to the boon list
added practice fishing
- pressing your call key anywhere in the house will initiate practice fishing
- fishing state is displayed below the bobber
- no fish obtained on success

2.3.1

new issues:
pressing the Call key during a Codex Menu boss rush encounter starts practice fishing, soon fixed in future Codex Menu update

new features:
added boss numeric health display
added regular call text hint

2.4.0

updated features:
practice fishing now requires the Call key to be held down for 3 seconds

new features:
all available bounties are now completed at once
added courtyard weapons to all post boss rooms (hammer upgrades only work for the weapon you obtained it with)

fixed issues:
numeric health only updated for the first boss you hit during the Theseus & Asterius fight

2.5.0

new issues:
opening any weapon's boon list causes a crash for some users, I put a prevention in place until I find out the reason

updated features:
all features are now split into modules which you can enable or disable (all are enabled by default)
some features have additional configuration options
added control keys to boon lists infographs for better controller support : press left to open infograph, press right to open duo infograph

new features:
god keepsake uses are refreshed/reset to 1 after completing a region
added configurable run loot caps : maximum gods, maximum hammers and maximum hermes
changed Maim from Aspect of Gilgamesh to deal -25% total damage but the damage is applied over time instead of a burst at the end

2.5.1

fixed issues:
beating a boss for the first time with a weapon caused a crash
complete all bounties did not work properly

2.5.2

fixed issues:
boss numeric health did not disappear when Demeter's Winter Harvest killed them

2.5.3

fixed issues:
resetting pact options in hell mode no longer resets locked options
closing the broker while prices are increased and coming back after a run messes with the prices
add descriptions of all features in the config

2.5.4

new features:

added boon level display in the pool of purging screen
added warnings when opening pool of purging with pauper curse
added achievement disabler (disabled by default)
added numeric wrath bar with two display modes and optional value rounding
added configurable god mode damage resistance value (disabled by default)
added force room reward type, lets you receive only the type of rewards you want (disabled by default)
when a fishing point appears in a room, doors are locked until you have used it (disabled by default)

restores Shield of Chaos - Aspect of Chaos to it's early access version
extra shields are now fired in a star pattern, can bounce and are 30% faster

added configurable room object spawn chances, includes :
Chaos door, Erebus gates, Infernal troves, Charon's wells, Pools of purging, Fishing points, Charon shop forbidden item
(disabled by default)

2.6.0

new features :

added extra hammer upgrades
currently adds Hestia's secret gunpowder recipe : requires Adamant Rail - Aspect of Hestia
Empowered shots deal 300% total damage and have 150% range, max ammo reduced to 2, reload duration +100%, can't dash anymore
added force thanatos, enable to always encounter thanatos in a run, includes max spawn, spawn location and ignore requirements options (disabled by default)
added golden urn warning, when enabled a warning message appears at the start of an encounter if a golden urn spawned in the room

changed features :

config moved to a new separate file "config.lua"
added warning message to fishing door locker

fixed issues :

some features which were supposed to be disabled by default were not

2.6.1

new features :

Gameplay: any extra last stand charges are now consumed before regular ones from the mirror
CompleteAllBounties: added two in game messages, one warning you additional bounties will be rewarded,
and a second telling you how many additional bounties were rewarded

fixed issues :

FishingDoorLocker prevented you from catching fish
CustomPerRunLoot hammer and hermes caps not working properly
CompleteAllBounties now finally works properly

other :

general code improvement

2.6.2

new features :

added UnlockHiddenAspects, lets you unlock any or all hidden aspect
Gameplay: added BetterBalance sub-module, which implements popular balance change requests
all changes can be configured and tweeked