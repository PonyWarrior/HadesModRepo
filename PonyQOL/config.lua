PQOL =
{
	Config =
	{
		-- Change "Enabled = true" to "Enabled = false" to disable any feature
		-- Some features have additional configuration options
		BoonList =
		{
			-- Improves the boon list by showing incompatibilities and hidden requirements
			-- Adds a boon list to Daedalus hammer, individual weapons and Charon
			-- Adds infographs in the boon list. Press Enter on keyboard and Attack on controller to close.
			-- Includes infographs for Zeus, Poseidon, Athena, Aphrodite, Ares, Hermes, Dionysus, Demeter
			Enabled = true,
		},
		Broker =
		{
			-- Lets you toggle bulk buy at the broker
			Enabled = true,
		},
		Pact =
		{
			-- Adds a reset button to the pact of punishment
			Enabled = true,
		},
		ChamberCounter =
		{
			-- Adds a permanent chamber counter at the top right of the screen during runs
			Enabled = true,
		},
		PomIcons =
		{
			-- Adds small animated pom icons to level-able boons, disable when using the starting boon selector mod
			Enabled = true,
		},
		Commendations =
		{
			-- Adds a Commendations tab in the codex which lists all victory messages and their requirements
			-- Completing a run will mark all messages you qualified for as completed
			Enabled = true,
		},
		PracticeFishing =
		{
			-- Lets you practice fishing while in the House by holding your 'Shout' key for 3 seconds
			-- Fishing state is displayed below the bobber
			Enabled = true,
		},
		BossNumericHealth =
		{
			-- Adds numeric health below the health bar of bosses
			Enabled = true,
		},
		RegularCallHint =
		{
			-- Adds an on screen hint when you can use your regular shout, similar to max power shout hint
			Enabled = true,
		},
		PostBossWeaponSelect =
		{
			-- Lets you swap weapons after beating a boss
			-- All boons except hammers are kept when swapping
			Enabled = true,
		},
		CompleteAllBounties =
		{
			-- When using more heat than required, all additional bounties are rewarded and completed when defeating bosses (you don't need to increase heat 1 by 1)
			Enabled = true,
		},
		Gameplay =
		{
			-- When enabled :
			-- Can no longer roll Demeter's Nourished Soul with Lasting Consequences 4 Pact option
			-- Lucifer beam now destroys projectiles (only the base of the beam destroys projectiles, like it works with reflect)
			Enabled = true,
			GilgameshChanges =
			{
				-- Disabling Gameplay also disables this
				-- When enabled :
				-- Changes Maim from Aspect of Gilgamesh to deal -25% total damage, but the damage is applied over time instead of a burst at the end
				Enabled = true,
				BaseDamage = 25,	-- multiplied by aspect level
			},
			OldChaosShield =
			{
				-- Disabling Gameplay also disables this
				-- Restores Shield of Chaos - Aspect of Chaos to it's early access version
				-- Extra shields are now fired in a star pattern
				-- Extra shields can now bounce
				-- Extra shields are 30% faster
				Enabled = true,
			},
			ExtraHammers =
			{
				-- Adds extra hammer upgrades
				Enabled = true,
				SuperGunManualReloadTrait =
				{
					-- Hestia's Secret Gunpowder Recipe
					-- Requires Adamant Rail - Aspect of Hestia
					-- Empowered shots deal 300% total damage and have 150% range
					-- Max ammo reduced to 2
					-- Reload duration +100%
					-- Can't dash anymore
					Enabled = true,
				},
			},
		},
		BloodRefund =
		{
			-- Adds a refund titan blood button to all weapons
			Enabled = true,
			FreeMode = false,	-- Makes refunding free when enabled
			KeyCostPerBloodRefunded = 2,	-- How many keys refunding 1 titan blood costs
		},
		GodKeepsakes =
		{
			-- God keepsake uses are refreshed/reset to 1 after completing a region
			Enabled = true,
		},
		CustomPerRunLoot =
		{
			-- Adds configurable run loot caps
			Enabled = false,
			HammerCap = 2,	-- How many hammers you can receive in a run; default = 2
			HermesCap = 2,	-- How many hermes boons you can receive in a run; default = 2
			GodCap = 4,	-- How many gods you can encounter in a run; default = 4;	min = 1;   max = 8
		},
		AlwaysEncounterStoryRooms =
		{
			-- When enabled you will always encounter Sisyphus, Euridyce and Patroclus
			Enabled = true,
		},
		PoolOfPurging =
		{
			-- Displays boon levels in the pool of purging screen
			-- Shows warnings when opening pool of purging with pauper curse
			Enabled = true,
		},
		DisableAchievements =
		{
			-- Disables achievement unlocks when enabled
			Enabled = false,
		},
		FishingDoorLocker =
		{
			-- When enabled doors are locked until you have used the fishing point in that room
			Enabled = false,
		},
		NumericWrathBar =
		{
			-- Displays numeric value of the wrath bar, up to 4 decimal points
			-- Enabling RoundValues will round values to the lowest integer
			-- Two display modes available :
			-- Regular - numeric values are shown at the right of the wrath bar, below your HP
			-- Overlay - numeric values are shown on top of the wrath bar
			-- Regular = 1, Overlay = 2
			Enabled = true,
			RoundValues = false,
			DisplayMode = 1,
		},
		RoomObjectSpawnChances =
		{
			-- Allows you to set a custom spawn chance for all room objects
			-- Disabling this disables everything
			Enabled = false,
				Chaos =
				{
					Enabled = false,
					Chance = 0.5, -- Choose a value between 0 and 1.0; 0 = 0%, 0.5 = 50%, 1.0 = 100%
					IgnoreRequirements = false, -- Ignores all spawn requirements except for a valid spawn location when enabled
				},
				Erebus =
				{
					Enabled = false,
					Chance = 0.5, -- Choose a value between 0 and 1.0; 0 = 0%, 0.5 = 50%, 1.0 = 100%
					IgnoreRequirements = false, -- Ignores all spawn requirements except for a valid spawn location when enabled
				},
				InfernalTrove =
				{
					Enabled = false,
					Chance = 0.5, -- Choose a value between 0 and 1.0; 0 = 0%, 0.5 = 50%, 1.0 = 100%
					IgnoreRequirements = false, -- Ignores all spawn requirements except for a valid spawn location when enabled
				},
				CharonWell =
				{
					Enabled = false,
					Chance = 0.5, -- Choose a value between 0 and 1.0; 0 = 0%, 0.5 = 50%, 1.0 = 100%
					IgnoreRequirements = false, -- Ignores all spawn requirements except for a valid spawn location when enabled
				},
				PurgingPool =
				{
					Enabled = false,
					Chance = 0.5, -- Choose a value between 0 and 1.0; 0 = 0%, 0.5 = 50%, 1.0 = 100%
					IgnoreRequirements = false, -- Ignores all spawn requirements except for a valid spawn location when enabled
				},
				Fish =
				{
					Enabled = false,
					Chance = 0.5, -- Choose a value between 0 and 1.0; 0 = 0%, 0.5 = 50%, 1.0 = 100%
					IgnoreRequirements = false, -- Ignores all spawn requirements except for a valid spawn location when enabled
				},
				CharonShopForbiddenItem =
				{
					Enabled = false,
					Chance = 0.5, -- Choose a value between 0 and 1.0; 0 = 0%, 0.5 = 50%, 1.0 = 100%
					IgnoreRequirements = false, -- Ignores all spawn requirements except for a valid spawn location when enabled
				},
		},
		GodMode =
		{
			-- Enable to set a fixed damage resistance value for god mode
			Enabled = false,
			FixedValue = 0.2, -- Percentage of damage resistance; 0 = 0%, 0.5 = 50%, 1.0 = 100%
		},
		ForceRoomRewardType =
		{
			-- Enable to only receive room rewards of a desired type
			-- MetaProgress = resources used outside of runs like darkness and keys
			-- RunProgress = resources used during a run like boons and hammers
			-- Set RewardType to 1 for MetaProgress, 2 for RunProgress
			-- Please not that some rooms have a hard set reward type and won't be affected
			Enabled = false,
			RewardType = 1,
		},
		ForceThanatos =
		{
			-- Enable to always encounter Thanatos in a run
			Enabled = false,
			SpawnLocation = 0, -- 0 = anywhere, 1 = Tartarus, 2 = Asphodel, 3 = Elysium
			MaxEncounters = 1, -- -1 = unlimited
			IgnoreRequirements = false, -- when enabled any room can have Thanatos appear except forced encounters (bosses etc), ignores SpawnLocation
		},
		GoldenUrnWarning =
		{
			-- When enabled a warning appears at the start of an encounter if a golden urn spawned in the room
			Enabled = true,
		},
		UnlockHiddenAspects =
		{
			-- Enable to unlock any or all hidden aspects
			-- Switch UnlockAll to true to unlock all hidden aspects
			-- Or switch any individual aspect to true to unlock it
			Enabled = false,
			UnlockAll = false,
			UnlockArthur = false,
			UnlockGuanYu = false,
			UnlockLucifer = false,
			UnlockRama = false,
			UnlockBeowulf = false,
			UnlockGilgamesh = false,
		}
	}
}

SaveIgnores["PQOL"] = true