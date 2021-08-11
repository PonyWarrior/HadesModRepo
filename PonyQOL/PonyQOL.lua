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
			Enabled = true,
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
	}
}

SaveIgnores["PQOL"] = true

--fix a bullshit crash
function IsTraitEligible( currentRun, traitData )
	--Mod start
	if traitData == nil then
		return false
	end
	--Mod end

	if traitData.MaxAmount ~= nil and traitData.MaxAmount <= GetTraitCount(CurrentRun.Hero, traitData) then
		return false
	end

	if not IsGameStateEligible( currentRun, traitData ) then
		return
	end

	return true
end

if PQOL.Config.Gameplay.Enabled then
    --Make Lucifer beam base destroy projectiles
    for i, property in pairs (TraitData.GunLoadedGrenadeTrait.PropertyChanges) do
        if property.ProjectileProperty == "ProjectileDefenseRadius" then
            table.remove(TraitData.GunLoadedGrenadeTrait.PropertyChanges, i)
        end
    end

    -- No Nourished Soul with LC4
    ModUtil.WrapBaseFunction( "SetTraitsOnLoot", function(baseFunc, lootData, args)
        if lootData.Name == "DemeterUpgrade" then
        if GetNumMetaUpgrades("HealingReductionShrineUpgrade") == 4 and Contains(LootData[lootData.Name].Consumables, "HealingPotencyDrop") then
            for i, loot in pairs (LootData[lootData.Name].Consumables) do
            if loot == "HealingPotencyDrop" then
                table.remove(LootData[lootData.Name].Consumables, i)
            end
            end
        elseif GetNumMetaUpgrades("HealingReductionShrineUpgrade") < 4 and not Contains(LootData[lootData.Name].Consumables, "HealingPotencyDrop") then
            table.insert(LootData[lootData.Name].Consumables, "HealingPotencyDrop")
        end
        end
        return baseFunc(lootData, args)
	end)

	if PQOL.Config.Gameplay.GilgameshChanges.Enabled then
		for i, property in pairs(TraitData.FistDetonateTrait.PropertyChanges) do
			if property.EffectName == "FistDetonationDamage" and property.EffectProperty == "Amount" then
				property.BaseValue = PQOL.Config.Gameplay.GilgameshChanges.BaseDamage
			end
		end
		table.insert(TraitData.FistDetonateTrait.PropertyChanges,
		{
			WeaponName = "FistDetonationWeapon",
			EffectName = "FistDetonationDamage",
			EffectProperty = "Cooldown",
			ChangeValue = 1.0,
			ChangeType = "Absolute",
		})
		table.insert(TraitData.FistDetonateTrait.PropertyChanges,
		{
			WeaponName = "FistDetonationWeapon",
			EffectName = "FistDetonationDamage",
			EffectProperty = "DamageOnExpire",
			ChangeValue = false,
			ChangeType = "Absolute",
		})
	end
end

if PQOL.Config.BoonList.Enabled then
    local mod = "Pony QoL"
    local package = "Charts"

    ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
        DebugPrint({Text = "@"..mod.." Trying to load package "..package..".pkg"})
        LoadPackages({Name = package})
        return baseFunc()
	end)

	ModUtil.WrapBaseFunction( "CreateBoonInfoButton", function(baseFunc, traitName, index)
		if traitName == nil then
			DebugPrint({Text = "@PonyQOL a traitName was nil! Closed boon info screen to prevent a crash"})
			ModUtil.Hades.PrintStack("PonyQOL: a traitName was nil!")
			ModUtil.Hades.PrintStack("Canceled opening boon list to prevent a crash!")
			ModUtil.Hades.PrintStack("Please report to PonyWarrior and include your savefile!")
			return
		end
        return baseFunc(traitName, index)
    end)

    --Add Hammer boon list
    --Add weapon boon lists
    --Display extra info in boon list
    table.insert(BoonInfoScreenData.Ordering, "WeaponUpgrade")
    table.insert(BoonInfoScreenData.Ordering, "SwordWeapon")
    table.insert(BoonInfoScreenData.Ordering, "BowWeapon")
    table.insert(BoonInfoScreenData.Ordering, "ShieldWeapon")
    table.insert(BoonInfoScreenData.Ordering, "SpearWeapon")
    table.insert(BoonInfoScreenData.Ordering, "GunWeapon")
    table.insert(BoonInfoScreenData.Ordering, "FistWeapon")
    table.insert(BoonInfoScreenData.Ordering, "NPC_Charon_01")
    local swordUpgrades = {}
    local bowUpgrades = {}
    local shieldUpgrades = {}
    local spearUpgrades = {}
    local gunUpgrades = {}
    local fistUpgrades = {}
    for i, upgrade in pairs(LootData.WeaponUpgrade.Traits) do
        if TraitData[upgrade].RequiredWeapon == "SwordWeapon" then
            table.insert(swordUpgrades, upgrade)
        elseif TraitData[upgrade].RequiredWeapon == "BowWeapon" then
            table.insert(bowUpgrades, upgrade)
        elseif TraitData[upgrade].RequiredWeapon == "ShieldWeapon" then
            table.insert(shieldUpgrades, upgrade)
        elseif TraitData[upgrade].RequiredWeapon == "SpearWeapon" then
            table.insert(spearUpgrades, upgrade)
        elseif TraitData[upgrade].RequiredWeapon == "GunWeapon" then
            table.insert(gunUpgrades, upgrade)
        elseif TraitData[upgrade].RequiredWeapon == "FistWeapon" then
            table.insert(fistUpgrades, upgrade)
        end
    end
    local charonUpgrades = StoreData.RoomShop.Traits
    for i, offer in pairs(StoreData.RoomShop.HealingOffers.WeightedList) do
        table.insert(charonUpgrades, offer.Name)
    end
    BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"] = LootData.WeaponUpgrade.Traits
    BoonInfoScreenData.SortedTraitIndex["SwordWeapon"] = swordUpgrades
    BoonInfoScreenData.SortedTraitIndex["BowWeapon"] = bowUpgrades
    BoonInfoScreenData.SortedTraitIndex["ShieldWeapon"] = shieldUpgrades
    BoonInfoScreenData.SortedTraitIndex["SpearWeapon"] = spearUpgrades
    BoonInfoScreenData.SortedTraitIndex["GunWeapon"] = gunUpgrades
    BoonInfoScreenData.SortedTraitIndex["FistWeapon"] = fistUpgrades
    BoonInfoScreenData.SortedTraitIndex["NPC_Charon_01"] = charonUpgrades

    function CreateTraitRequirements( traitName )
        local screen = ScreenAnchors.BoonInfoScreen
        Destroy({Ids = screen.TraitRequirements })
        screen.TraitRequirements = {}
        local traitData = TraitData[traitName]
        if not traitData then
            traitData = ConsumableData[traitName]
        end
        local startY = 120
        local startX = 10
        local width = 500
        local hasRequirement = false
        if traitData.RequiredMetaUpgradeSelected then
            local requiredMetaUpgrade = traitData.RequiredMetaUpgradeSelected
            local requirementsText = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
            table.insert(screen.TraitRequirements, requirementsText.Id )
            Attach({ Id = requirementsText.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX , OffsetY = -405 })

            local color = Color.White
            if IsGameStateEligible( CurrentRun, { RequiredMetaUpgradeSelected = traitData.RequiredMetaUpgradeSelected }) then
                color = Color.BoonInfoAcquired
            end
            CreateTextBox({
            Id = requirementsText.Id,
            Text = "BoonInfo_RequiredMetaupgrade",
            FontSize = 24,
            Width = 360,
            OffsetX = 200,
            OffsetY =  startY-5,
            Color = color,
            Font = "AlegreyaSansSCLight",
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
            Justification = "Left",
            LuaKey = "TempTextData",
            LuaValue = { MetaupgradeName = requiredMetaUpgrade }})
            startY = startY + 45
            hasRequirement = true

            if MetaUpgradeData[requiredMetaUpgrade] and MetaUpgradeData[requiredMetaUpgrade].Icon then
                local metaupgradeIcon = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
                SetAnimation({ Name = MetaUpgradeData[requiredMetaUpgrade].Icon, DestinationId = metaupgradeIcon.Id })
                table.insert(screen.TraitRequirements, metaupgradeIcon.Id )
                Attach({ Id = metaupgradeIcon.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX + 175, OffsetY = -290 })
            end
        end
        --Mod start
        if traitData.RequiredInactiveMetaUpgrade then
            local requiredMetaUpgrade = traitData.RequiredInactiveMetaUpgrade
            local requirementsText = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
            table.insert(screen.TraitRequirements, requirementsText.Id )
            Attach({ Id = requirementsText.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX , OffsetY = -405 })

            local color = Color.White
            if IsGameStateEligible( CurrentRun, { RequiredInactiveMetaUpgrade = traitData.RequiredInactiveMetaUpgrade }) then
                color = Color.BoonInfoAcquired
            end
            CreateTextBox({
            Id = requirementsText.Id,
            Text = "BoonInfo_RequiredInactiveMetaupgrade",
            FontSize = 24,
            Width = 360,
            OffsetX = 200,
            OffsetY =  startY-5,
            Color = color,
            Font = "AlegreyaSansSCLight",
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
            Justification = "Left",
            LuaKey = "TempTextData",
            LuaValue = { MetaupgradeName = requiredMetaUpgrade }})
            startY = startY + 45
            hasRequirement = true

            if MetaUpgradeData[requiredMetaUpgrade] and MetaUpgradeData[requiredMetaUpgrade].Icon then
                local metaupgradeIcon = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
                SetAnimation({ Name = MetaUpgradeData[requiredMetaUpgrade].Icon, DestinationId = metaupgradeIcon.Id })
                table.insert(screen.TraitRequirements, metaupgradeIcon.Id )
                Attach({ Id = metaupgradeIcon.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX + 175, OffsetY = -290 })
            end
        end
        --Mod end

        if traitData.RequiredTrait then
            local requirementsText = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
            table.insert(screen.TraitRequirements, requirementsText.Id )
            Attach({ Id = requirementsText.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX + 35, OffsetY = -405 })
            local color = Color.BoonInfoUnacquired
            if HeroHasTrait(traitData.RequiredTrait) then
                color = Color.BoonInfoAcquired
            end
            CreateTextBox({
            Id = requirementsText.Id,
            Text = "BoonInfo_RequiredTrait",
            FontSize = 20,
            OffsetX = 170,
            OffsetY =  startY,
            Color = color,
            Font = "AlegreyaSansSCMedium",
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
            Justification = "Left",
            LuaKey = "TempTextData",
            LuaValue = { TraitName = traitData.RequiredTrait}})
            startY = startY + 45
            hasRequirement = true


            if TraitData[traitData.RequiredTrait] and TraitData[traitData.RequiredTrait].Icon then
                local metaupgradeIcon = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
                SetAnimation({ Name = GetTraitIcon( TraitData[traitData.RequiredTrait] ), DestinationId = metaupgradeIcon.Id })
                SetScale({ Id = metaupgradeIcon.Id, Fraction = 0.5 })
                table.insert(screen.TraitRequirements, metaupgradeIcon.Id )
                Attach({ Id = metaupgradeIcon.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX + 180, OffsetY = -405 + 120 })
            end
        end

      --Mod start
      if traitData.RequiredWeapon then
        local requirementsText = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
        table.insert(screen.TraitRequirements, requirementsText.Id )
        Attach({ Id = requirementsText.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX + 35, OffsetY = -405 })
        local color = Color.BoonInfoUnacquired
        if HeroHasTrait(traitData.RequiredTrait) then
          color = Color.BoonInfoAcquired
        end
        CreateTextBox({
        Id = requirementsText.Id,
        Text = "BoonInfo_RequiredTrait",
        FontSize = 20,
        OffsetX = 170,
        OffsetY =  startY,
        Color = color,
        Font = "AlegreyaSansSCMedium",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
        Justification = "Left",
        LuaKey = "TempTextData",
        LuaValue = { TraitName = traitData.RequiredWeapon}})
        startY = startY + 45
        hasRequirement = true
      end
      --Mod end

      --Mod start
      if traitData.RequiredSlottedTrait then
        local requirementsText = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
        table.insert(screen.TraitRequirements, requirementsText.Id )
        Attach({ Id = requirementsText.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX + 35, OffsetY = -405 })
        local color = Color.BoonInfoUnacquired
        if HeroHasTrait(traitData.RequiredSlottedTrait) then
          color = Color.BoonInfoAcquired
        end
        CreateTextBox({
        Id = requirementsText.Id,
        Text = "BoonInfo_RequiredTrait",
        FontSize = 20,
        OffsetX = 170,
        OffsetY =  startY,
        Color = color,
        Font = "AlegreyaSansSCMedium",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
        Justification = "Left",
        LuaKey = "TempTextData",
        LuaValue = { TraitName = traitData.RequiredSlottedTrait}})
        startY = startY + 45
        hasRequirement = true
      end
      --Mod end

        if traitData.RequiredOneOfTraits then
            startY = CreateTraitRequirementList( screen, { Text = "BoonInfo_OneOf", TextSingular = "BoonInfo_OneOf_Singular" }, traitData.RequiredOneOfTraits, startY, IsGameStateEligible(CurrentRun, { RequiredOneOfTraits = traitData.RequiredOneOfTraits }))
            hasRequirement = true
        end

      --Mod start
      if traitData.RequiredFalseTraits then
        local list = traitData.RequiredFalseTraits
        for i, entry in pairs (list) do
          if entry == traitData.Name then
            table.remove(list, i)
          end
        end
        if not IsEmpty(list) then
          startY = CreateTraitRequirementList( screen, { Text = "Incompatible with:", TextSingular = "Incompatible with:" }, list, startY, IsGameStateEligible(CurrentRun, { RequiredFalseTraits = list }))
          hasRequirement = true
        end
      end

      --Mod end

        --Mod start
        local onelist = {}
        local setlist = {}
        local twolist = {}
        if TraitData[traitData.Name] then
            for _, trait in pairs (TraitData) do
                if BoonInfoScreenData.TraitRequirementsDictionary[trait.Name] then
                    local requirementData = BoonInfoScreenData.TraitRequirementsDictionary[trait.Name]
                    if requirementData.Type == "OneOf" and Contains(requirementData.OneOf, traitData.Name) then
                        table.insert(onelist, trait.Name)
                    end
                    if requirementData .Type == "OneFromEachSet" then
                        for i, set in pairs(requirementData.OneFromEachSet) do
                            if Contains(set, traitData.Name) then
                                table.insert(setlist, trait.Name)
                            end
                        end
                    elseif requirementData.Type == "TwoOf" then
                        for i, set in pairs(requirementData.OneFromEachSet) do
                            if Contains(set, traitData.Name) then
                                table.insert(twolist, trait.Name)
                            end
                        end
                    end
                end
            end
        else
            for _, trait in pairs (ConsumableData) do
                if BoonInfoScreenData.TraitRequirementsDictionary[trait.Name] then
                    local requirementData = BoonInfoScreenData.TraitRequirementsDictionary[trait.Name]
                    if requirementData.Type == "OneOf" and Contains(requirementData.OneOf, traitData.Name) then
                        table.insert(onelist, trait.Name)
                    end
                    if requirementData .Type == "OneFromEachSet" then
                        for i, set in pairs(requirementData.OneFromEachSet) do
                            if Contains(set, traitData.Name) then
                                table.insert(setlist, trait.Name)
                            end
                        end
                    elseif requirementData.Type == "TwoOf" then
                        for i, set in pairs(requirementData.OneFromEachSet) do
                            if Contains(set, traitData.Name) and not Contains(twolist, trait.Name) then
                                table.insert(twolist, trait.Name)
                            end
                        end
                    end
                end
            end
        end
        if not IsEmpty(onelist) then
            startY = CreateTraitRequirementList( screen, { Text = "Fulfills requirement:", TextSingular = "Fulfills requirement:" }, onelist, startY )
            hasRequirement = true
        end
        if not IsEmpty(setlist) then
            startY = CreateTraitRequirementList( screen, { Text = "Partially fulfills requirement:", TextSingular = "Partially fulfills requirement:" }, setlist, startY )
            hasRequirement = true
        end
        if not IsEmpty(twolist) then
            startY = CreateTraitRequirementList( screen, { Text = "Required by (TwoOf):", TextSingular = "Required by (TwoOf):" }, twolist, startY )
            hasRequirement = true
        end
        --Mod end

        if BoonInfoScreenData.TraitRequirementsDictionary[traitName] then
            hasRequirement = true
            local requirementData = BoonInfoScreenData.TraitRequirementsDictionary[traitName]
            if requirementData.Type == "OneOf" then
                startY = CreateTraitRequirementList( screen, { Text = "BoonInfo_OneOf", TextSingular = "BoonInfo_OneOf_Singular"  }, requirementData.OneOf, startY )
            elseif requirementData .Type == "OneFromEachSet" then
                for i, set in pairs(requirementData.OneFromEachSet) do
                    startY = CreateTraitRequirementList( screen, { Text = "BoonInfo_OneOf", TextSingular = "BoonInfo_OneOf_Singular"  }, set, startY )
                end
            elseif requirementData.Type == "TwoOf" then
                local allTraitsDictionary = {}
                local hasRequirement = false
                local hasAmount = 0
                for i, traitSet in pairs(requirementData .OneFromEachSet) do
                    for s, traitName in pairs(traitSet) do
                        allTraitsDictionary[traitName] = true
                    end
                end
                for traitName in pairs( allTraitsDictionary ) do
                    if HeroHasTrait( traitName ) then
                        hasAmount = hasAmount + 1
                    end
                end

                startY = CreateTraitRequirementList( screen, { Text = "BoonInfo_TwoOf" }, (GetAllKeys(allTraitsDictionary)), startY, ( hasAmount >= 2 ))
            end
        end

        if not hasRequirement then
            local requirementsText = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
            table.insert(screen.TraitRequirements, requirementsText.Id )
            Attach({ Id = requirementsText.Id, DestinationId = screen.Components.ShopBackground.Id, OffsetX = startX , OffsetY = -405 })

            CreateTextBox({
            Id = requirementsText.Id,
            Text = "BoonInfo_NoRequirements",
            FontSize = 24,
            OffsetX = 170,
            OffsetY =  startY,
            Color = {159, 159, 159, 255},
            Font = "AlegreyaSansSCRegular",
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
            Justification = "Left"})
        end
    end

    --Boon list infographs
    function ShowBoonInfoScreen( lootName )
        OnScreenOpened( { Flag = "BoonInfoScreen", PersistCombatUI = true } )
        SetConfigOption({ Name = "ExclusiveInteractGroup", Value = "Combat_Menu_TraitTray_Backing" })

        FreezePlayerUnit("BoonInfoScreen" )

        PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENULoud" })

        ScreenAnchors.BoonInfoScreen = { LootName = lootName, StartingIndex = 1, Components = {}, Name = "BoonInfoScreen", TraitContainers = {}, TraitRequirements = {} }
        local screen = ScreenAnchors.BoonInfoScreen
        local components = ScreenAnchors.BoonInfoScreen.Components
        BoonInfoPopulateTraits( screen )
        EnableShopGamepadCursor( ScreenAnchors.BoonInfoScreen.Name )
        SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
        SetConfigOption({ Name = "FreeFormSelectStepDistance", Value = 32 })
        SetConfigOption({ Name = "FreeFormSelectSuccessDistanceStep", Value = 18 })
        if IsScreenOpen("Codex") then
            screen.OldFreeFormSelecSearchFromId = GetConfigOptionValue({ Name = "FreeFormSelecSearchFromId" })
            CodexUI.Screen.Components.CloseButton.OnPressedFunctionName = nil
        end

        components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu_TraitTray_Backing" })
        SetScale({ Id = components.ShopBackgroundDim.Id, Fraction = 10 })
        SetColor({ Id = components.ShopBackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.6} })

        components.ShopBackground = CreateScreenComponent({ Name = "BoonInfoBacking", Group = "Combat_Menu_TraitTray_Backing", X = ScreenCenterX, Y = ScreenHeight/2 })

        components.PageUp = CreateScreenComponent({ Name = "ButtonCodexUp", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
        Attach({ Id = components.PageUp.Id, DestinationId = components.ShopBackground.Id, OffsetX = -400 , OffsetY = -395 })
        components.PageUp.OnPressedFunctionName = "BoonInfoScreenPrevious"
        components.PageUp.ControlHotkey = "MenuUp"

        components.PageDown = CreateScreenComponent({ Name = "ButtonCodexDown", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
        Attach({ Id = components.PageDown.Id, DestinationId = components.ShopBackground.Id, OffsetX = -400 , OffsetY = 415 })
        components.PageDown.OnPressedFunctionName = "BoonInfoScreenNext"
        components.PageDown.ControlHotkey = "MenuDown"


        components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 1, Group = "Combat_Menu_TraitTray_Backing" })
        Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0 , OffsetY = 490 })
        components.CloseButton.OnPressedFunctionName = "CloseBoonInfoScreen"
        components.CloseButton.ControlHotkey = "Cancel"
        CreateTextBox({ Id = components.ShopBackground.Id, Text = "Codex_BoonInfo_Title",
            FontSize = 32,
            OffsetX = 0, OffsetY = -487,
            Color = Color.White,
            Font = "SpectralSCLightTitling",
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 3},
            OutlineThickness = 3,
            Justification = "Center",
            LuaKey = "TempTextData",
            LuaValue = { BoonName = lootName }
        })

        for i = screen.StartingIndex, screen.StartingIndex + BoonInfoScreenData.NumPerPage - 1 do
            CreateBoonInfoButton( screen.SortedTraitIndex[i], i )
		end
		--Mod start
		if ScreenAnchors.BoonInfoScreen.Components["BooninfoButton1"] == nil then
			ScreenAnchors.BoonInfoScreen.CanClose = true
			CloseBoonInfoScreen()
			return
		end
		--Mod end
		TeleportCursor({ DestinationId = ScreenAnchors.BoonInfoScreen.Components["BooninfoButton1"].DetailsBacking.Id, ForceUseCheck = true })

        components.RequirementsTitle = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
        Attach({ Id = components.RequirementsTitle.Id, DestinationId = components.ShopBackground.Id, OffsetX = 100 , OffsetY = -405 })
        CreateTextBox(MergeTables({
            Id = components.RequirementsTitle.Id,
            Text = "BoonInfo_Requirements",
            FontSize = 28,
            OffsetX = 75,
            OffsetY = 60,
            Color = color,
            Font = "AlegreyaSansSCLight",
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
            Justification = "Left",
        }, LocalizationData.BoonInfoScreenScripts.RequirementsTitle ))
        --Mod start
        components.InfographButton = CreateScreenComponent({ Name = "ButtonDefault", Scale = 1.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
        Attach({ Id = components.InfographButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 750 , OffsetY = -300 })
		components.InfographButton.OnPressedFunctionName = "ShowInfograph"
		components.InfographButton.ControlHotkeys = { "MenuLeft", "Left" }
        CreateTextBox({ Id = components.InfographButton.Id, Text = "Show Infograph",
            FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchHeroic, Font = "AlegreyaSansSCLight",
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"})

        components.DuoInfographButton = CreateScreenComponent({ Name = "ButtonDefault", Scale = 1.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
        Attach({ Id = components.DuoInfographButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 750 , OffsetY = -200 })
		components.DuoInfographButton.OnPressedFunctionName = "ShowDuoInfograph"
		components.DuoInfographButton.ControlHotkeys = { "MenuRight", "Right" }
        CreateTextBox({ Id = components.DuoInfographButton.Id, Text = "Show Duo Infograph",
            FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchDuo, Font = "AlegreyaSansSCLight",
            ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"})
        --Mod end

        UpdateBoonInfoPageButtons( screen )

        ScreenAnchors.BoonInfoScreen.KeepOpen = true
        ScreenAnchors.BoonInfoScreen.CanClose = true
        thread( HandleWASDInput, ScreenAnchors.BoonInfoScreen )
        HandleScreenInput( ScreenAnchors.BoonInfoScreen )
    end

    local ValidSolo =
    {
        "ZeusUpgrade",
        "AresUpgrade",
        "ArtemisUpgrade",
        "AphroditeUpgrade",
        "DionysusUpgrade",
        "AthenaUpgrade",
        "PoseidonUpgrade",
        "DemeterUpgrade",
        "HermesUpgrade",
    }
    local ValidDuo =
    {
        "ZeusUpgrade",
        "AresUpgrade",
        "ArtemisUpgrade",
        "AphroditeUpgrade",
        "DionysusUpgrade",
        "AthenaUpgrade",
        "PoseidonUpgrade",
        "DemeterUpgrade",
    }

    function ShowInfograph(screen, button)
        DebugPrint({Text = " "..screen.LootName})
        local components = screen.Components
        if Contains(ValidSolo, screen.LootName) then
            if components.Infograph ~= nil or components.DuoInfograph ~= nil then
                CloseInfograph(screen, components.Infograph or components.DuoInfograph)
            end
            components.Infograph = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1, Group = "Infograph" })
            Attach({ Id = components.Infograph.Id, DestinationId = components.ShopBackground.Id, OffsetX = -135 , OffsetY = 13 })
            components.Infograph.OnPressedFunctionName = "CloseInfograph"
            components.Infograph.ControlHotkey = "Confirm"
            SetAnimation({ Name = screen.LootName.."_Solo", DestinationId = components.Infograph.Id })
            SetScale({ Id = components.Infograph.Id, Fraction = 0.73})
            SetScaleX({ Id = components.Infograph.Id, Fraction = 1.03})

        end
    end

    function CloseInfograph(screen, button)
        Destroy({Id = button.Id})
        screen.Components.Infograph = nil
        screen.Components.DuoInfograph = nil

    end

    function ShowDuoInfograph(screen, button)
        local components = screen.Components
        if Contains(ValidDuo, screen.LootName) then
            if components.Infograph ~= nil or components.DuoInfograph ~= nil then
                CloseInfograph(screen, components.Infograph or components.DuoInfograph)
            end
            components.DuoInfograph = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1, Group = "Infograph" })
            Attach({ Id = components.DuoInfograph.Id, DestinationId = components.ShopBackground.Id, OffsetX = -135 , OffsetY = 13 })
            components.DuoInfograph.OnPressedFunctionName = "CloseInfograph"
            components.DuoInfograph.ControlHotkey = "Confirm"
            SetAnimation({ Name = screen.LootName.."_Duo", DestinationId = components.DuoInfograph.Id })
            SetScale({ Id = components.DuoInfograph.Id, Fraction = 0.73})
            SetScaleX({ Id = components.DuoInfograph.Id, Fraction = 1.03})
        end
    end
end

if PQOL.Config.ChamberCounter.Enabled then
	-- Permanent Depth Counter
	ModUtil.WrapBaseFunction("ShowHealthUI", function(baseFunc)
	ShowDepthCounter()
	return baseFunc()
	end)

	local baseCloseAdvancedTooltipScreen = CloseAdvancedTooltipScreen
	function CloseAdvancedTooltipScreen()
		baseCloseAdvancedTooltipScreen()
		ShowDepthCounter()
	end
end

if PQOL.Config.PomIcons.Enabled then
	--Show 'pom-able' boons when opening the boon tab
	function ShowAdvancedTooltipScreen( args )
		OnScreenOpened( { Flag = "TraitTrayScreen", PersistCombatUI = true, SkipBlockTimer = true, } )
		if args.DontDuckAudio then
			SetAdvancedTooltipMixing( 1 )
		end
		FreezePlayerUnit("AdvancedTooltip", { DisableTray = false })
		thread(MarkObjectiveComplete, "AdvancedTooltipPrompt")

		local firstTrait = nil

		ScreenAnchors.TraitTrayScreen = DeepCopyTable( ScreenData.TraitTrayScreen )
		local components = ScreenAnchors.TraitTrayScreen.Components
		EnableShopGamepadCursor( ScreenAnchors.TraitTrayScreen.Name )
		if not GetConfigOptionValue({ Name = "UseMouse" }) then
			SetConfigOption({ Name = "ExclusiveInteractGroup", Value = "TraitTrayTraits" })
		end
		SetConfigOption({ Name = "FreeFormSelectStepDistance", Value = 12.0 })

		components.BackgroundTint = CreateScreenComponent({ Name = "rectangle01", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_UI_Backing" })
		SetScale({ Id = components.BackgroundTint.Id, Fraction = 10 })
		SetColor({ Id = components.BackgroundTint.Id, Color = {20, 20, 20, 255} })
		SetAlpha({ Id = components.BackgroundTint.Id, Fraction = 0.0, Duration = 0 })
		SetAlpha({ Id = components.BackgroundTint.Id, Fraction = 0.66, Duration = 0.25 })

		local possibleAutoPins = {}

		local displayedTrait = 0
		if IsEmpty(CurrentRun.Hero.RecentTraits) then
			displayedTrait = displayedTrait - 5
		else
			displayedTrait = TableLength( CurrentRun.Hero.RecentTraits) - 5
		end
		local displayedTraits = {}
		local highlightedTrait = nil
		for i, trait in pairs( CurrentRun.Hero.Traits ) do
			if not trait.Hidden and (not IsExistingTraitShown(trait) or trait == GetExistingUITrait( trait )) then
				-- two column pairs of 5 and 6
				local itemColumn = math.floor( displayedTrait / 11 )
				local itemNum = displayedTrait % 11
				local traitIcon = nil
				local xOffset = 0
				local yOffset = 0
				if IsShownInTraitTray( trait ) and trait == GetExistingUITrait( trait ) then
					xOffset = CombatUI.TraitUIStart - xOffset
					yOffset = TraitUI.IconStartY + GetTraitIndex(trait) * TraitUI.SpacerY
					if trait.Slot == nil then
						xOffset = 8 + xOffset + TraitUI.SpacerX * 0.5
						yOffset = yOffset - TraitUI.SpacerY * 0.5
					end
				else
					if itemNum < 6 then
						-- first column of the two column pair
						xOffset = 8 + CombatUI.TraitUIStart + ( itemColumn + 1 ) * TraitUI.SpacerX
						yOffset = TraitUI.IconStartY + ( itemNum ) * TraitUI.SpacerY
					else
						-- second column of the two column pair
						xOffset = 8 + CombatUI.TraitUIStart + ( itemColumn + 1.5 ) * TraitUI.SpacerX
						yOffset = TraitUI.IconStartY + ( itemNum - 7 + 1.5 ) * TraitUI.SpacerY
					end
				end

				traitIcon = CreateScreenComponent({ Name = "TraitTrayIconButton", X = xOffset, Y = yOffset, Group = "Combat_Menu_TraitTray" })
				AddToGroup({ Id  = traitIcon.Id, Name = "TraitTrayTraits" })
				traitIcon.OnPressedFunctionName = "PinTraitDetails"
				if not IsExistingTraitShown( trait ) then
					trait.AnchorId = traitIcon.Id
				end
				SetAnimation({ Name = GetTraitIcon( trait ), DestinationId = traitIcon.Id, Group = "Combat_Menu_TraitTray" })
				traitIcon.OffsetX = xOffset
				traitIcon.OffsetY = yOffset
				CreateTextBox({
					Id = traitIcon.Id,
					UseDescription = true,
					VariableAutoFormat = "BoldFormatGraft",
					Scale = 0.0,
					Hide = true,
				})

				if args.DisableTooltips then
					ModifyTextBox({ Id = traitIcon.Id, BlockTooltip = true })
				end

				table.insert( components, traitIcon )
				traitIcon.TraitData = trait
				ScreenAnchors.TraitTrayScreen.Icons[ traitIcon.Id ] = traitIcon

				local traitFrameId = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray"  })
				Attach({ Id = traitFrameId, DestinationId = traitIcon.Id })
				if GetTraitFrame(trait) ~= nil then
					local traitFrame = GetTraitFrame( trait )
					local rarityValue = GetRarityValue( trait )
					for i, existingTrait in pairs( CurrentRun.Hero.TraitDictionary[trait.Name]) do
						if (AreTraitsIdentical(trait, existingTrait) and rarityValue < GetRarityValue( existingTrait.Rarity )) then
							rarityValue = GetRarityValue( existingTrait.Rarity )
							traitFrame = GetTraitFrame( existingTrait )
						end
					end
					SetAnimation({ Name = traitFrame, DestinationId = traitFrameId })
				end
				table.insert( ScreenAnchors.TraitTrayScreen.Frames, traitFrameId )
		--Mod start
		if GetTraitNameCount(CurrentRun.Hero, trait.Name) == 1 and IsGameStateEligible(CurrentRun, TraitData[trait.Name]) and IsGodTrait(trait.Name) then
			local pom = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray"  })
			Attach({ Id = pom, DestinationId = traitIcon.Id, OffsetX = 0, OffsetY = 40 })
			SetAnimation({ Name = "StackUpgradePreview", DestinationId = pom, Group = "Combat_Menu_TraitTray" })
			SetScale({ Id = pom, Fraction = 0.3})
		end
		--Mod end
				if not IsShownInTraitTray(trait) then
					displayedTrait = displayedTrait + 1
				end
				TraitUICreateText( trait, "Combat_Menu_TraitTray_Overlay" )

				if not firstTrait or (not IsEmpty(CurrentRun.Hero.RecentTraits) and AreTraitsIdentical( CurrentRun.Hero.RecentTraits[1], trait )) then
					TeleportCursor({ OffsetX = xOffset, OffsetY = yOffset, ForceUseCheck = true })
					highlightedTrait = traitIcon
					firstTrait = true
				end

				if args.AutoPin and IsPossibleAutoPin( trait ) then
					table.insert( possibleAutoPins, traitIcon )
				end
			end
		end

		local shownColumns = math.ceil( displayedTrait / 11 )
		if displayedTrait % 11 >= 6 then
			shownColumns = shownColumns + 1
		end
		shownColumns = shownColumns + 1
		ScreenAnchors.TraitTrayScreen.ShownColumns = shownColumns

		-- dynamically sized backing

		components.ShopBackground = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "Combat_Menu_TraitTray_Backing", X = 450, Y = ScreenHeight/2 - 118})
		for cosmeticName, status in pairs( GameState.Cosmetics ) do
			local cosmeticData = ConditionalItemData[cosmeticName]
			if cosmeticData ~= nil and cosmeticData.TraitTrayBackground ~= nil then
				SetAnimation({ Name = cosmeticData.TraitTrayBackground, DestinationId = components.ShopBackground.Id })
				break
			end
		end

		components.CenterColumn = CreateScreenComponent({ Name = "TraitTray_Center", Group = "Combat_Menu_TraitTray_Backing", X = CombatUI.TraitUIStart, Y = 32 + ScreenHeight/2 - 100 })
		SetScaleX({ Id = components.CenterColumn.Id, Fraction = (shownColumns + 1) / 2 })
		components.EndColumn = CreateScreenComponent({ Name = "TraitTray_Right", Group = "Combat_Menu_TraitTray_Backing", X = CombatUI.TraitUIStart + ( shownColumns + 1 ) * TraitUI.SpacerX / 2, Y = ScreenHeight/2 - 100 })

		for cosmeticName, status in pairs( GameState.Cosmetics ) do
			local cosmeticData = ConditionalItemData[cosmeticName]
			if cosmeticData ~= nil and cosmeticData.TraitTrayTop ~= nil then
				DebugPrint({ Text = "cosmeticData.TraitTrayTop = "..cosmeticData.TraitTrayTop })
				components.BackingTop = CreateScreenComponent({ Name = cosmeticData.TraitTrayTop, Group = "Combat_Menu_TraitTray_Backing", X = 160, Y = 200, Scale = 0.5 })
				components.BackingBottom = CreateScreenComponent({ Name = cosmeticData.TraitTrayBottom, Group = "Combat_Menu_TraitTray_Backing", X = 160, Y = 910, Scale = 0.5 })
				break
			end
		end

		if not args.HideCloseButton then
			components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu_TraitTray" })
			Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -355 + ( shownColumns * 32 ), OffsetY = 435 })
			components.CloseButton.OnPressedFunctionName = "CloseAdvancedTooltipScreen"
			components.CloseButton.ControlHotkey = "Cancel"
			AddToGroup({ Id  = components.CloseButton.Id, Name = "TraitTrayTraits" })
			AddToGroup({ Id  = components.CloseButton.Id, Name = "TraitTrayShrineUpgrades" })
			AddToGroup({ Id  = components.CloseButton.Id, Name = "TraitTrayMetaUpgrades" })
		end

		-- dynamic sockets
		for i = 0, shownColumns do
			local xOffset = 0
			if i % 2 == 0 then
				xOffset = 8 + CombatUI.TraitUIStart + ( math.floor(i/2) + 1 ) * TraitUI.SpacerX
				local newColumnObject = CreateScreenComponent({ Name = "TraitTray_ShortColumn", Group = "Combat_Menu_TraitTray_Backing", X = xOffset - 64, Y = (TraitUI.IconStartY + 2.5 * TraitUI.SpacerY) - 0 })
				table.insert( ScreenAnchors.TraitTrayScreen.Columns, newColumnObject.Id )
			else
				xOffset = 8 + CombatUI.TraitUIStart + ( math.floor(i/2) + 1.5 ) * TraitUI.SpacerX
				local newColumnObject = CreateScreenComponent({ Name = "TraitTray_LongColumn", Group = "Combat_Menu_TraitTray_Backing", X = xOffset - 64, Y = (TraitUI.IconStartY + 2.5 * TraitUI.SpacerY) - 0 })
				table.insert( ScreenAnchors.TraitTrayScreen.Columns, newColumnObject.Id )
			end
		end

		-- ShrineUpgrades / MetaUpgrades
		local offsetX = 20
		local offsetY = 50

		if GameState.SpentShrinePointsCache ~= nil and GameState.SpentShrinePointsCache > 0 then
			components.ShrineUpgradeBacking = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray_Backing", X = offsetX, Y = offsetY, Scale = 0.5, })
			SetScaleX({ Id = components.ShrineUpgradeBacking.Id, Fraction = 1.0 })
			local backingAnim = "MetaUpgradeTrayBacking"
			for cosmeticName, status in pairs( GameState.Cosmetics ) do
				local cosmeticData = ConditionalItemData[cosmeticName]
				if cosmeticData ~= nil and cosmeticData.ShrineUpgradeBacking ~= nil then
					backingAnim = cosmeticData.ShrineUpgradeBacking
					break
				end
			end
			SetAnimation({ DestinationId = components.ShrineUpgradeBacking.Id, Name = backingAnim })
			offsetX = offsetX + 190
			for k, upgradeName in ipairs( ShrineUpgradeOrder ) do
				local upgradeData = MetaUpgradeData[upgradeName]
				if upgradeData.GameStateRequirements ~= nil and not IsGameStateEligible( CurrentRun, upgradeData.GameStateRequirements ) then
					-- Blank
				else
					components["ShrineIcon"..k] = CreateScreenComponent({ Name = "TraitTrayMetaUpgradeIconButton", Group = "Combat_Menu_TraitTray", X = offsetX, Y = offsetY })
					SetAnimation({ DestinationId = components["ShrineIcon"..k].Id, Name = upgradeData.Icon })
					local numUpgrades = GetNumMetaUpgrades( upgradeName )
					if numUpgrades > 0 then
						local totalStatChange = GetTotalStatChange( upgradeData )
						local text = GetMetaUpgradeShortTotalText( upgradeData, true )
						CreateTextBox({
							Id = components["ShrineIcon"..k].Id,
							Text = text,
							LuaKey = "TempTextData",
							LuaValue = { Amount = totalStatChange },
							FontSize = 18,
							OffsetX = 20, OffsetY = 12,
							Color = Color.White,
							Font = "AlegreyaSansSCBold",
							ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0,2},
							Justification = "Center",
							OutlineThickness = 2,
							OutlineColor = {0,0,0,1},
						})
						SetupMetaIconTrayTooltip( components["ShrineIcon"..k], upgradeName, upgradeData, offsetX, args )
						AddToGroup({ Id  = components["ShrineIcon"..k].Id, Name = "TraitTrayShrineUpgrades" })
						ScreenAnchors.TraitTrayScreen.HasShrineUpgradeIcon = true
					else
						UseableOff({ Id = components["ShrineIcon"..k].Id })
						SetColor({ Id = components["ShrineIcon"..k].Id, Color = {0.5, 0.55, 0.6, 0.55} })
					end
				end
				offsetX = offsetX + 65
			end
		end
		offsetX = 20
		offsetY = offsetY + 60
		GameState.SpentMetaPointsCache = GetTotalSpentMetaPoints()
		if GameState.SpentMetaPointsCache > 0 then
			components.MetaUpgradeBacking = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray_Backing", X = offsetX, Y = offsetY, Scale = 0.5, })
			SetScaleX({ Id = components.MetaUpgradeBacking.Id, Fraction = 1.0 })
			CreateTextBox({ Id = components.MetaUpgradeBacking.Id,
				Text = "InGameUI_ActiveMetaPoints",
				FontSize = 22,
				OffsetX = 20, OffsetY = 0,
				Color = titleColor,
				Font = "AlegreyaSansSCBold",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = "Left" })
			local backingAnim = "MetaUpgradeTrayBacking"
			for cosmeticName, status in pairs( GameState.Cosmetics ) do
				local cosmeticData = ConditionalItemData[cosmeticName]
				if cosmeticData ~= nil and cosmeticData.MetaUpgradeBacking ~= nil then
					backingAnim = cosmeticData.MetaUpgradeBacking
					break
				end
			end
			SetAnimation({ DestinationId = components.MetaUpgradeBacking.Id, Name = backingAnim })
			offsetX = offsetX + 190
			for k, upgradeName in ipairs( GameState.MetaUpgradesSelected ) do
				if k > GetNumLockedMetaUpgrades() then
					-- Blank
				else
					local upgradeData = MetaUpgradeData[upgradeName]
					components["MetaIcon"..k] = CreateScreenComponent({ Name = "TraitTrayMetaUpgradeIconButton", Group = "Combat_Menu_TraitTray", X = offsetX, Y = offsetY })
					SetAnimation({ DestinationId = components["MetaIcon"..k].Id, Name = upgradeData.Icon })
					local numUpgrades = GetNumMetaUpgrades( upgradeName )
					if numUpgrades > 0 then
						local totalStatChange = GetTotalStatChange( upgradeData )
						local text = GetMetaUpgradeShortTotalText( upgradeData, true )
						CreateTextBox({
							Id = components["MetaIcon"..k].Id,
							Text = text,
							LuaKey = "TempTextData",
							LuaValue = { Amount = totalStatChange },
							FontSize = 18,
							OffsetX = 20, OffsetY = 12,
							Color = Color.White,
							Font = "AlegreyaSansSCBold",
							ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0,2},
							Justification = "Center",
							OutlineThickness = 2,
							OutlineColor = {0,0,0,1},
						})
						SetupMetaIconTrayTooltip( components["MetaIcon"..k], upgradeName, upgradeData, offsetX, args )
						AddToGroup({ Id  = components["MetaIcon"..k].Id, Name = "TraitTrayMetaUpgrades" })
						ScreenAnchors.TraitTrayScreen.HasMetaUpgradeIcon = true
					else
						UseableOff({ Id = components["MetaIcon"..k].Id })
						SetColor({ Id = components["MetaIcon"..k].Id, Color = {0.5, 0.55, 0.6, 0.55} })
					end
				end
				offsetX = offsetX + 89
			end
		end


		CreatePrimaryBacking()
		if highlightedTrait ~= nil then
			SetHighlightedTraitFrame( highlightedTrait )
		end

		PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENULoud" })

		SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
		ScreenAnchors.TraitTrayScreen.CanClose = true
		ScreenAnchors.TraitTrayScreen.KeepOpen = true

		if IsEmpty( possibleAutoPins ) then
			if highlightedTrait ~= nil then
				PinTraitDetails( ScreenAnchors.TraitTrayScreen, highlightedTrait, { Hover = true } )
			end
		else
			for k = 1, ScreenAnchors.TraitTrayScreen.MaxPins do
				local traitButton = RemovePriorityPin( possibleAutoPins )
				PinTraitDetails( ScreenAnchors.TraitTrayScreen, traitButton )
				if IsEmpty( possibleAutoPins ) then
					break
				end
			end
		end

		ScreenAnchors.TraitTrayScreen.OnWASDInputFunctionName = "TraitTrayWASDInput"

		thread( HandleWASDInput, ScreenAnchors.TraitTrayScreen )
		HandleScreenInput( ScreenAnchors.TraitTrayScreen )
	end

	local baseSetTraitTrayDetails = SetTraitTrayDetails
	function SetTraitTrayDetails( button, detailsBox, rarityBox, titleBox, patch, icon )
	baseSetTraitTrayDetails( button, detailsBox, rarityBox, titleBox, patch, icon )
		--Mod start
		if not button.ForBoonInfo and GetTraitNameCount(CurrentRun.Hero, button.TraitData.Name) == 1 and IsGameStateEligible(CurrentRun, TraitData[button.TraitData.Name]) and IsGodTrait(button.TraitData.Name) then
		local pom = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray"  })
		Attach({ Id = pom, DestinationId = icon.Id, OffsetX = 0, OffsetY = 40 })
		SetAnimation({ Name = "StackUpgradePreview", DestinationId = pom, Group = "Combat_Menu_TraitTray" })
		SetScale({ Id = pom, Fraction = 0.4})
			-- elseif button.ForBoonInfo and IsGameStateEligible(CurrentRun, TraitData[button.TraitData.Name]) and IsGodTrait(button.TraitData.Name) then
			-- 	local pom = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray"  })
			-- 	Attach({ Id = pom, DestinationId = icon.Id, OffsetX = 0, OffsetY = 40 })
			-- 	SetAnimation({ Name = "StackUpgradePreview", DestinationId = pom, Group = "Combat_Menu_TraitTray" })
			-- 	SetScale({ Id = pom, Fraction = 0.4})
		end
		--Mod end
	end

	function CreateBoonLootButtons( lootData, reroll)

		local components = ScreenAnchors.ChoiceScreen.Components
		local upgradeName = lootData.Name
		local upgradeChoiceData = LootData[upgradeName]
		local upgradeOptions = lootData.UpgradeOptions
		if upgradeOptions == nil then
			SetTraitsOnLoot( lootData )
			upgradeOptions = lootData.UpgradeOptions
		end

		if not lootData.StackNum then
			lootData.StackNum = 1
		end
		if not reroll then
			lootData.StackNum = lootData.StackNum + GetTotalHeroTraitValue("PomLevelBonus")
		end
		local tooltipData = {}

		local itemLocationY = 370
		local itemLocationX = ScreenCenterX - 355
		local firstOption = true
		local buttonOffsetX = 350

		if IsEmpty( upgradeOptions ) then
			table.insert(upgradeOptions, { ItemName = "FallbackMoneyDrop", Type = "Consumable", Rarity = "Common" })
		end

		local blockedIndexes = {}
		for i = 1, TableLength(upgradeOptions) do
			table.insert( blockedIndexes, i )
		end
		for i = 1, CalcNumLootChoices() do
			RemoveRandomValue( blockedIndexes )
		end

		-- Sort traits in the following order: Melee, Secondary, Rush, Range
		table.sort(upgradeOptions, function (x, y)
			local slotToInt = function( slot )
				if slot ~= nil then
					local slotType = slot.Slot

					if slotType == "Melee" then
						return 0
					elseif slotType == "Secondary" then
						return 1
					elseif slotType == "Ranged" then
						return 2
					elseif slotType == "Rush" then
						return 3
					elseif slotType == "Shout" then
						return 4
					end
				end
				return 99
			end
			return slotToInt(TraitData[x.ItemName]) < slotToInt(TraitData[y.ItemName])
		end)

		if TableLength( upgradeOptions ) > 1 then
			-- Only create the "Choose One" textbox if there's something to choose
			CreateTextBox({ Id = components.ShopBackground.Id, Text = "UpgradeChoiceMenu_SubTitle",
				FontSize = 30,
				OffsetX = -435, OffsetY = -318,
				Color = Color.White,
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
				Justification = "Left"
			})
		end
		for itemIndex, itemData in ipairs( upgradeOptions ) do
			local itemBackingKey = "Backing"..itemIndex
			components[itemBackingKey] = CreateScreenComponent({ Name = "TraitBacking", Group = "Combat_Menu", X = ScreenCenterX, Y = itemLocationY })
			SetScaleY({ Id = components[itemBackingKey].Id, Fraction = 1.25 })
			local upgradeData = nil
			local upgradeTitle = nil
			local upgradeDescription = nil
			if itemData.Type == "Trait" then
				upgradeData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.ItemName, Rarity = itemData.Rarity })
				local traitNum = GetTraitCount(CurrentRun.Hero, upgradeData)
				if HeroHasTrait(itemData.ItemName) then
					upgradeTitle = "TraitLevel_Upgrade"
					upgradeData.Title = upgradeData.Name
				else
					upgradeTitle = GetTraitTooltipTitle( TraitData[itemData.ItemName] )

					upgradeData.Title = GetTraitTooltipTitle( TraitData[itemData.ItemName] ) .."_Initial"
					if not HasDisplayName({ Text = upgradeData.Title }) then
						upgradeData.Title = GetTraitTooltipTitle( TraitData[itemData.ItemName] )
					end
				end

				if itemData.TraitToReplace ~= nil then
					upgradeData.TraitToReplace = itemData.TraitToReplace
					upgradeData.OldRarity = itemData.OldRarity
					local existingNum = GetTraitNameCount( CurrentRun.Hero, upgradeData.TraitToReplace )
					tooltipData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.ItemName, FakeStackNum = existingNum, RarityMultiplier = upgradeData.RarityMultiplier})
					if existingNum > 1 then
						upgradeTitle = "TraitLevel_Exchange"
						tooltipData.Title = GetTraitTooltipTitle( TraitData[upgradeData.Name])
						tooltipData.Level = existingNum
					end
				elseif lootData.StackOnly then
					tooltipData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.ItemName, FakeStackNum = lootData.StackNum, RarityMultiplier = upgradeData.RarityMultiplier})
					tooltipData.OldLevel = traitNum;
					tooltipData.NewLevel = traitNum + lootData.StackNum;
					tooltipData.Title = GetTraitTooltipTitle( TraitData[itemData.ItemName] )
					upgradeData.Title = tooltipData.Title
				else
					if upgradeData.Rarity == "Legendary" then
						if TraitData[upgradeData.Name].IsDuoBoon then
							CreateAnimation({ Name = "BoonEntranceDuo", DestinationId = components[itemBackingKey].Id })
						else
						CreateAnimation({ Name = "BoonEntranceLegendary", DestinationId = components[itemBackingKey].Id })
						end
					end

					tooltipData = upgradeData
				end
				SetTraitTextData( tooltipData )
				upgradeDescription = GetTraitTooltip( tooltipData , { Default = upgradeData.Title })

			elseif itemData.Type == "Consumable" then
				-- TODO(Dexter) Determinism

				upgradeData = GetRampedConsumableData(ConsumableData[itemData.ItemName], itemData.Rarity)
				upgradeTitle = upgradeData.Name
				upgradeDescription = GetTraitTooltip(upgradeData)

				if upgradeData.UseFunctionArgs ~= nil then
					if upgradeData.UseFunctionName ~= nil and upgradeData.UseFunctionArgs.TraitName ~= nil then
						local traitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = upgradeData.UseFunctionArgs.TraitName, Rarity = itemData.Rarity })
						SetTraitTextData( traitData )
						upgradeData.UseFunctionArgs.TraitName = nil
						upgradeData.UseFunctionArgs.TraitData = traitData
						tooltipData = MergeTables( tooltipData, traitData )
					elseif upgradeData.UseFunctionNames ~= nil then
						local hasTraits = false
						for i, args in pairs(upgradeData.UseFunctionArgs) do
							if args.TraitName ~= nil then
								hasTraits = true
								local processedTraitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = args.TraitName, Rarity = itemData.Rarity })
								SetTraitTextData( processedTraitData )
								tooltipData = MergeTables( tooltipData, processedTraitData )
								upgradeData.UseFunctionArgs[i].TraitName = nil
								upgradeData.UseFunctionArgs[i].TraitData = processedTraitData
							end
						end
						if not hasTraits then
							tooltipData = upgradeData
						end
					end
				else
					tooltipData = upgradeData
				end
			elseif itemData.Type == "TransformingTrait" then
				local blessingData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.ItemName, Rarity = itemData.Rarity })
				local curseData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.SecondaryItemName, Rarity = itemData.Rarity })
				curseData.OnExpire =
				{
					TraitData = blessingData
				}
				upgradeTitle = "ChaosCombo_"..curseData.Name.."_"..blessingData.Name
				blessingData.Title = "ChaosBlessingFormat"

				SetTraitTextData( blessingData )
				SetTraitTextData( curseData )
				blessingData.TrayName = blessingData.Name.."_Tray"

				tooltipData = MergeTables( tooltipData, blessingData )
				tooltipData = MergeTables( tooltipData, curseData )
				tooltipData.Blessing = itemData.ItemName
				tooltipData.Curse = itemData.SecondaryItemName

				upgradeDescription = blessingData.Title
				upgradeData = DeepCopyTable( curseData )
				upgradeData.Icon = blessingData.Icon

				local extractedData = GetExtractData( blessingData )
				for i, value in pairs(extractedData) do
					local key = value.ExtractAs
					if key then
						upgradeData[key] = blessingData[key]
					end
				end
			end

			-- Setting button graphic based on boon type
			local purchaseButtonKey = "PurchaseButton"..itemIndex


			local iconOffsetX = -338
			local iconOffsetY = -2
			local exchangeIconPrefix = nil
			local overlayLayer = "Combat_Menu_Overlay_Backing"

			components[purchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot"..itemIndex, Group = "Combat_Menu", Scale = 1, X = itemLocationX + buttonOffsetX, Y = itemLocationY })
			if upgradeData.CustomRarityColor then
				components[purchaseButtonKey.."Patch"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = iconOffsetX + itemLocationX + buttonOffsetX + 38, Y = iconOffsetY + itemLocationY })
				SetAnimation({ DestinationId = components[purchaseButtonKey.."Patch"].Id, Name = "BoonRarityPatch"})
				SetColor({ Id = components[purchaseButtonKey.."Patch"].Id, Color = upgradeData.CustomRarityColor })
			elseif itemData.Rarity ~= "Common" then
				components[purchaseButtonKey.."Patch"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = iconOffsetX + itemLocationX + buttonOffsetX + 38, Y = iconOffsetY + itemLocationY })
				SetAnimation({ DestinationId = components[purchaseButtonKey.."Patch"].Id, Name = "BoonRarityPatch"})
				SetColor({ Id = components[purchaseButtonKey.."Patch"].Id, Color = Color["BoonPatch" .. itemData.Rarity] })
			end

			if Contains( blockedIndexes, itemIndex ) then
				itemData.Blocked = true
				overlayLayer = "Combat_Menu"
				UseableOff({ Id = components[purchaseButtonKey].Id })
				ModifyTextBox({ Ids = components[purchaseButtonKey].Id, BlockTooltip = true })
				CreateTextBox({ Id = components[purchaseButtonKey].Id,
				Text = "ReducedLootChoicesKeyword",
				OffsetX = textOffset, OffsetY = -30,
				Color = Color.Transparent,
				Width = 675,
				})
				thread( TraitLockedPresentation, { Components = components, Id = purchaseButtonKey, OffsetX = itemLocationX + buttonOffsetX, OffsetY = iconOffsetY + itemLocationY } )
			end

			if upgradeData.Icon ~= nil then
				components[purchaseButtonKey.."Icon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = iconOffsetX + itemLocationX + buttonOffsetX, Y = iconOffsetY + itemLocationY })
				SetAnimation({ DestinationId = components[purchaseButtonKey.."Icon"].Id, Name = upgradeData.Icon .. "_Large" })
				SetScale({ Id = components[purchaseButtonKey.."Icon"].Id, Fraction = 0.85 })
		--Mod start
		if IsGameStateEligible(CurrentRun, TraitData[upgradeData.Name]) and IsGodTrait(upgradeData.Name) then
			local pom = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray"  })
			Attach({ Id = pom, DestinationId = components[purchaseButtonKey.."Icon"].Id, OffsetX = 0, OffsetY = 40 })
			SetAnimation({ Name = "StackUpgradePreview", DestinationId = pom, Group = "Combat_Menu_TraitTray" })
			SetScale({ Id = pom, Fraction = 0.5})
		end
		--Mod end
			end

			if upgradeData.TraitToReplace ~= nil then
				local yOffset = 70
				local xOffset = 700
				local blockedIconOffset = 0
				local textOffset = xOffset * -1 + 110
				if Contains( blockedIndexes, itemIndex ) then
					blockedIconOffset = -20
				end

				components[purchaseButtonKey.."ExchangeIcon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = overlayLayer, X = iconOffsetX + itemLocationX + buttonOffsetX + xOffset, Y = iconOffsetY + itemLocationY + yOffset + blockedIconOffset})
				SetAnimation({ DestinationId = components[purchaseButtonKey.."ExchangeIcon"].Id, Name = TraitData[upgradeData.TraitToReplace].Icon .. "_Small" })

				components[purchaseButtonKey.."ExchangeIconFrame"] = CreateScreenComponent({ Name = "BlankObstacle", Group = overlayLayer, X = iconOffsetX + itemLocationX + buttonOffsetX + xOffset, Y = iconOffsetY + itemLocationY + yOffset + blockedIconOffset})
				SetAnimation({ DestinationId = components[purchaseButtonKey.."ExchangeIconFrame"].Id, Name = "BoonIcon_Frame_".. itemData.OldRarity})

				exchangeIconPrefix = "{!Icons.TraitExchange} "

				CreateTextBox(MergeTables({
					Id = components[purchaseButtonKey.."ExchangeIcon"].Id,
					Text = "ReplaceTraitPrefix",
					OffsetX = textOffset,
					OffsetY = -12 - blockedIconOffset + (LocalizationData.UpgradeChoice.ExchangeText.LangOffsetY[GetLanguage({})] or 0),
					FontSize = 20,
					Color = {160, 160, 160, 255},
					Width = 675,
					Font = "AlegreyaSansSCRegular",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
					Justification = "Left",
					VerticalJustification = "Top",
				}, LocalizationData.UpgradeChoice.ExchangeText))

				CreateTextBox(MergeTables({
					Id = components[purchaseButtonKey.."ExchangeIcon"].Id,
					Text = GetTraitTooltipTitle( TraitData[itemData.TraitToReplace ]),
					OffsetX = textOffset + 150,
					OffsetY = -12 - blockedIconOffset + (LocalizationData.UpgradeChoice.ExchangeText.LangOffsetY[GetLanguage({})] or 0),
					FontSize = 20,
					Color = Color["BoonPatch" .. itemData.OldRarity],
					Width = 675,
					Font = "AlegreyaSansSCRegular",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
					Justification = "Left",
					VerticalJustification = "Top",
				}, LocalizationData.UpgradeChoice.ExchangeText))

			end

			components[purchaseButtonKey.."Frame"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = iconOffsetX + itemLocationX + buttonOffsetX, Y = iconOffsetY + itemLocationY })
			if upgradeData.Frame then
				SetAnimation({ DestinationId = components[purchaseButtonKey.."Frame"].Id, Name = "Frame_Boon_Menu_".. upgradeData.Frame})
				SetScale({ Id = components[purchaseButtonKey.."Frame"].Id, Fraction = 0.85 })
			else
				SetAnimation({ DestinationId = components[purchaseButtonKey.."Frame"].Id, Name = "Frame_Boon_Menu_".. itemData.Rarity})
				SetScale({ Id = components[purchaseButtonKey.."Frame"].Id, Fraction = 0.85 })
			end
			-- Button data setup
			components[purchaseButtonKey].OnPressedFunctionName = "HandleUpgradeChoiceSelection"
			components[purchaseButtonKey].Data = upgradeData
			components[purchaseButtonKey].UpgradeName = upgradeName
			components[purchaseButtonKey].Type = itemData.Type
			components[purchaseButtonKey].LootData = lootData
			components[purchaseButtonKey].LootColor = upgradeChoiceData.LootColor
			components[purchaseButtonKey].BoonGetColor = upgradeChoiceData.BoonGetColor

			components[components[purchaseButtonKey].Id] = purchaseButtonKey
			-- Creates upgrade slot text
			SetInteractProperty({ DestinationId = components[purchaseButtonKey].Id, Property = "TooltipOffsetX", Value = 675 })
			local selectionString = "UpgradeChoiceMenu_PermanentItem"
			local selectionStringColor = Color.Black

			if itemData.Type == "Trait" then
				local traitData = TraitData[itemData.ItemName]
				if traitData.Slot ~= nil then
					selectionString = "UpgradeChoiceMenu_"..traitData.Slot
				end
			elseif itemData.Type == "Consumable" then
				selectionString = upgradeData.UpgradeChoiceText or "UpgradeChoiceMenu_PermanentItem"
			end

			local textOffset = 115 - buttonOffsetX
			local exchangeIconOffset = 0
			local lineSpacing = 8
			local text = "Boon_"..tostring(itemData.Rarity)
			local overlayLayer = ""
			if upgradeData.CustomRarityName then
				text = upgradeData.CustomRarityName
			end
			local color = Color["BoonPatch" .. itemData.Rarity ]
			if upgradeData.CustomRarityColor then
				color = upgradeData.CustomRarityColor
			end

			CreateTextBox({ Id = components[purchaseButtonKey].Id, Text = text  ,
				FontSize = 27,
				OffsetX = textOffset + 630, OffsetY = -60,
				Width = 720,
				Color = color,
				Font = "AlegreyaSansSCLight",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
				Justification = "Right"
			})
			if exchangeIconPrefix then
				CreateTextBox({ Id = components[purchaseButtonKey].Id,
					Text = exchangeIconPrefix ,
					FontSize = 27,
					OffsetX = textOffset, OffsetY = -55,
					Color = color,
					Font = "AlegreyaSansSCLight",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
					Justification = "Left",
					LuaKey = "TooltipData", LuaValue = tooltipData,
				})
				exchangeIconOffset = 40
				if upgradeData.Slot == "Shout" then
					lineSpacing = 4
				end
			end
			CreateTextBox({ Id = components[purchaseButtonKey].Id,
				Text = upgradeTitle,
				FontSize = 27,
				OffsetX = textOffset + exchangeIconOffset, OffsetY = -55,
				Color = color,
				Font = "AlegreyaSansSCLight",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
				Justification = "Left",
				LuaKey = "TooltipData", LuaValue = tooltipData,
			})

			-- Chaos curse/blessing traits need VariableAutoFormat disabled
			local autoFormat = "BoldFormatGraft"
			if upgradeDescription == "ChaosBlessingFormat" or itemData.Type == "TransformingTrait" then
				autoFormat = nil
			end

			CreateTextBoxWithFormat(MergeTables({ Id = components[purchaseButtonKey].Id,
				Text = upgradeDescription,
				OffsetX = textOffset, OffsetY = -30,
				Width = 675,
				Justification = "Left",
				VerticalJustification = "Top",
				LineSpacingBottom = lineSpacing,
				UseDescription = true,
				LuaKey = "TooltipData", LuaValue = tooltipData,
				Format = "BaseFormat",
				VariableAutoFormat = autoFormat,
				TextSymbolScale = 0.8,
			}, LocalizationData.UpgradeChoice.BoonLootButton))

			local needsQuestIcon = false
			if not GameState.TraitsTaken[upgradeData.Name] and HasActiveQuestForTrait( upgradeData.Name ) then
				needsQuestIcon = true
			elseif itemData.ItemName ~= nil and not GameState.TraitsTaken[itemData.ItemName] and HasActiveQuestForTrait( itemData.ItemName ) then
				needsQuestIcon = true
			end

			if needsQuestIcon then
				components[purchaseButtonKey.."QuestIcon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = itemLocationX + 92, Y = itemLocationY - 55 })
				SetAnimation({ DestinationId = components[purchaseButtonKey.."QuestIcon"].Id, Name = "QuestItemFound" })
				-- Silent toolip
				CreateTextBox({ Id = components[purchaseButtonKey].Id, TextSymbolScale = 0, Text = "TraitQuestItem", Color = Color.Transparent, LuaKey = "TooltipData", LuaValue = tooltipData, })
			end

			if upgradeData.LimitedTime then
				-- Silent toolip
				CreateTextBox({ Id = components[purchaseButtonKey].Id, TextSymbolScale = 0, Text = "SeasonalItem", Color = Color.Transparent, LuaKey = "TooltipData", LuaValue = tooltipData, })
			end

			if firstOption then
				TeleportCursor({ OffsetX = itemLocationX + buttonOffsetX, OffsetY = itemLocationY, ForceUseCheck = true, })
				firstOption = false
			end

			itemLocationY = itemLocationY + 220
		end



		if IsMetaUpgradeSelected( "RerollPanelMetaUpgrade" ) then
			local cost = -1
			if lootData.BlockReroll then
				cost = -1
			elseif lootData.Name == "WeaponUpgrade" then
				cost = RerollCosts.Hammer
			else
				cost = RerollCosts.Boon
			end
			local baseCost = cost

			local name = "RerollPanelMetaUpgrade_ShortTotal"
			local tooltip = "MetaUpgradeRerollHint"
			if cost >= 0 then

				local increment = 0
				if CurrentRun.CurrentRoom.SpentRerolls then
					increment = CurrentRun.CurrentRoom.SpentRerolls[lootData.ObjectId] or 0
				end
				cost = cost + increment
			else
				name = "RerollPanel_Blocked"
				tooltip = "MetaUpgradeRerollBlockedHint"
			end
			local color = Color.White
			if CurrentRun.NumRerolls < cost or cost < 0 then
				color = Color.CostUnaffordable
			end

			if baseCost > 0 then
				components["RerollPanel"] = CreateScreenComponent({ Name = "ShopRerollButton", Scale = 1.0, Group = "Combat_Menu" })
				Attach({ Id = components["RerollPanel"].Id, DestinationId = components.ShopBackground.Id, OffsetX = 0, OffsetY = 410 })
				components["RerollPanel"].OnPressedFunctionName = "AttemptPanelReroll"
				components["RerollPanel"].RerollFunctionName = "RerollBoonLoot"
				components["RerollPanel"].RerollColor = lootData.LootColor
				components["RerollPanel"].RerollId = lootData.ObjectId

				components["RerollPanel"].Cost = cost

				CreateTextBox({ Id = components["RerollPanel"].Id, Text = name, OffsetX = 28, OffsetY = -5,
				ShadowColor = {0,0,0,1}, ShadowOffset={0,3}, OutlineThickness = 3, OutlineColor = {0,0,0,1},
				FontSize = 28, Color = color, Font = "AlegreyaSansSCExtraBold", LuaKey = "TempTextData", LuaValue = { Amount = cost }})
				SetInteractProperty({ DestinationId = components["RerollPanel"].Id, Property = "TooltipOffsetX", Value = 350 })
				CreateTextBox({ Id = components["RerollPanel"].Id, Text = tooltip, FontSize = 1, Color = Color.Transparent, Font = "AlegreyaSansSCExtraBold", LuaKey = "TempTextData", LuaValue = { Amount = cost }})
			end
		end
	end
end

if PQOL.Config.Broker.Enabled then
	--Wretched Broker bulk buy
	function OpenMarketScreen()
		local screen = { Components = {} }
		screen.Name = "Market"
		screen.NumSales = 0
		screen.NumItemsOffered = 0
		--Mod start
		screen.SwapType = "Increase"
		--Mod end

		if IsScreenOpen( screen.Name ) then
			return
		end
		OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
		FreezePlayerUnit()
		EnableShopGamepadCursor()

		PlaySound({ Name = "/SFX/Menu Sounds/DialoguePanelIn" })

		local components = screen.Components

		components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
		components.ShopBackground = CreateScreenComponent({ Name = "ShopBackground", Group = "Combat_Menu" })
		components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Group = "Combat_Menu", Scale = 0.7 })
		Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0, OffsetY = 440 })
		components.CloseButton.OnPressedFunctionName = "CloseMarketScreen"
		components.CloseButton.ControlHotkey = "Cancel"
		--Mod start
		components.TestButton = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({ Id = components.TestButton.Id, DestinationId = components.ShopBackground.Id })
		components.TestButton.OnPressedFunctionName = "SwapMarketPrices"
		components.TestButton.ControlHotkey = "Confirm"
		--Mod end
		SetScale({ Id = components.ShopBackgroundDim.Id, Fraction = 4 })
		SetColor({ Id = components.ShopBackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.7} })

		-- Title
		CreateTextBox({ Id = components.ShopBackground.Id, Text = "MarketScreen_Title", FontSize = 32, OffsetX = 0, OffsetY = -445, Color = Color.White, Font = "SpectralSCLightTitling", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 3}, Justification = "Center" })
		CreateTextBox({ Id = components.ShopBackground.Id, Text = "MarketScreen_Hint", FontSize = 14, OffsetX = 0, OffsetY = 380, Width = 840, Color = Color.Gray, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })

		-- Flavor Text
		local flavorTextOptions = { "MarketScreen_FlavorText01", "MarketScreen_FlavorText02", "MarketScreen_FlavorText03", }
		local flavorText = GetRandomValue( flavorTextOptions )
		CreateTextBox({ Id = components.ShopBackground.Id, Text = flavorText,
				FontSize = 16,
				OffsetY = -385, Width = 840,
				Color = {0.698, 0.702, 0.514, 1.0},
				Font = "AlegreyaSansSCExtraBold",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = "Center" })
		--Mod start
		CreateTextBox({ Id = components.ShopBackground.Id, Text = "Press Enter(PC), Square(PS) or X(Xbox) to increase and decrease amounts",
				FontSize = 16,
				OffsetY = -320, Width = 840,
				Color = {0.698, 0.702, 0.514, 1.0},
				Font = "AlegreyaSansSCExtraBold",
				ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
				Justification = "Center" })
		--Mod end
		-- image
		--Mod start
		CreateMarketButtons(screen)
		--Mod end

		if screen.NumItemsOffered == 0 then
			thread( PlayVoiceLines, GlobalVoiceLines.MarketSoldOutVoiceLines, true )
		else
			thread( PlayVoiceLines, GlobalVoiceLines.OpenedMarketVoiceLines, true )
		end

		HandleScreenInput( screen )
		return screen
	end

	function CreateMarketButtons(screen)
		local components = screen.Components
		local tooltipData = {}
		local yScale = math.min( 3 / CurrentRun.MarketOptions , 1 )

		local itemLocationStartY = ShopUI.ShopItemStartY - ( ShopUI.ShopItemSpacerY * (1 - yScale) * 0.5)
		local itemLocationYSpacer = ShopUI.ShopItemSpacerY * yScale
		local itemLocationMaxY = itemLocationStartY + 4 * itemLocationYSpacer

		local itemLocationStartX = ShopUI.ShopItemStartX
		local itemLocationXSpacer = ShopUI.ShopItemSpacerX
		local itemLocationMaxX = itemLocationStartX + 1 * itemLocationXSpacer

		local itemLocationTextBoxOffset = 380

		local itemLocationX = itemLocationStartX
		local itemLocationY = itemLocationStartY

		local textSymbolScale = 0.8

		local firstUseable = false
		for itemIndex, item in ipairs( CurrentRun.MarketItems ) do

			if not item.SoldOut then

				screen.NumItemsOffered = screen.NumItemsOffered + 1

				local purchaseButtonKey = "PurchaseButton"..itemIndex
				components[purchaseButtonKey] = CreateScreenComponent({ Name = "MarketSlot", Group = "Combat_Menu", Scale = 1, X = itemLocationX, Y = itemLocationY })
				SetInteractProperty({ DestinationId = components[purchaseButtonKey].Id, Property = "TooltipOffsetX", Value = 665 })

				local iconKey = "Icon"..itemIndex
				components[iconKey] = CreateScreenComponent({ Name = "BlankObstacle", X = itemLocationX - 360, Y = itemLocationY, Group = "Combat_Menu" })

				local itemBackingKey = "Backing"..itemIndex
				components[itemBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = itemLocationX + itemLocationTextBoxOffset, Y = itemLocationY })

				local purchaseButtonTitleKey = "PurchaseButtonTitle"..itemIndex
				components[purchaseButtonTitleKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", Scale = 1, X = itemLocationX, Y = itemLocationY })

				local costColor = {0.878, 0.737, 0.259, 1.0}
				if not HasResource( item.CostName, item.CostAmount ) then
					costColor = Color.TradeUnaffordable
				end

				components[purchaseButtonKey].OnPressedFunctionName = "HandleMarketPurchase"
				if not firstUseable then
					TeleportCursor({ OffsetX = itemLocationX, OffsetY = itemLocationY })
					firstUseable = true
				end

				-- left side text
				local buyResourceData = ResourceData[item.BuyName]
				if buyResourceData then
					components[purchaseButtonTitleKey .. "Icon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", Scale = 1 })
					SetAnimation({ Name = buyResourceData.Icon, DestinationId = components[purchaseButtonTitleKey .. "Icon"].Id, Scale = 1 })
					Attach({ Id = components[purchaseButtonTitleKey .. "Icon"].Id, DestinationId = components[purchaseButtonTitleKey].Id, OffsetX = -400, OffsetY = 0 })
					components[purchaseButtonTitleKey .. "SellText"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", Scale = 1 })
					Attach({ Id = components[purchaseButtonTitleKey .. "SellText"].Id, DestinationId = components[purchaseButtonTitleKey].Id, OffsetX = 0, OffsetY = 0 })

					local titleText = "MarketScreen_Entry_Title"
					if item.BuyAmount == 1 then
						titleText = "MarketScreen_Entry_Title_Singular"
					end
					CreateTextBox({ Id = components[purchaseButtonKey].Id, Text = titleText,
						FontSize = 48 * yScale ,
						OffsetX = -350, OffsetY = -35,
						Width = 720,
						Color = {0.878, 0.737, 0.259, 1.0},
						Font = "AlegreyaSansSCMedium",
						ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
						Justification = "Left",
						VerticalJustification = "Top",
						LuaKey = "TempTextData",
						LuaValue = item,
						LineSpacingBottom = 20,
						TextSymbolScale = textSymbolScale,
					})
					CreateTextBox({ Id = components[purchaseButtonTitleKey.."SellText"].Id, Text = "MarketScreen_Cost",
						FontSize = 48 * yScale ,
						OffsetX = 420, OffsetY = -24,
						Width = 720,
						Color = costColor,
						Font = "AlegreyaSansSCMedium",
						ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
						Justification = "Right",
						LuaKey = "TempTextData",
						LuaValue = item,
						LineSpacingBottom = 20,
						TextSymbolScale = textSymbolScale,
					})
					ModifyTextBox({ Ids = components[purchaseButtonTitleKey.."SellText"].Id, BlockTooltip = true })

					CreateTextBoxWithFormat({ Id = components[purchaseButtonKey].Id, Text = buyResourceData.IconString or item.BuyName,
						FontSize = 16 * yScale,
						OffsetX = -350, OffsetY = 0,
						Width = 650,
						Color = Color.White,
						Justification = "Left",
						VerticalJustification = "Top",
						LuaKey = "TempTextData",
						LuaValue = item,
						TextSymbolScale = textSymbolScale,
						Format = "MarketScreenDescriptionFormat",
						VariableAutoFormat = "BoldFormatGraft",
						UseDescription = true
					})
					if not item.Priority then
						CreateTextBox({ Id = components[purchaseButtonKey].Id, Text = "Market_LimitedTimeOffer", OffsetX = 300, OffsetY = 0, FontSize = 28, Color = costColor, Font = "AlegreyaSansSCRegular", Justification = "Left", TextSymbolScale = textSymbolScale })
					end
				end

				components[purchaseButtonKey].Data = item
				components[purchaseButtonKey].Index = itemIndex
				components[purchaseButtonKey].TitleId = components[purchaseButtonTitleKey].Id
			end

			itemLocationX = itemLocationX + itemLocationXSpacer
			if itemLocationX >= itemLocationMaxX then
				itemLocationX = itemLocationStartX
				itemLocationY = itemLocationY + itemLocationYSpacer
			end
		end
	end

	local marketSwapType = "Increase"
	function SwapMarketPrices(screen, button)
		if marketSwapType == "Increase" then
			for itemIndex, item in ipairs( CurrentRun.MarketItems ) do
				if item.Priority then
					item.CostAmount = item.CostAmount * 10
					item.BuyAmount = item.BuyAmount * 10
				end
			end
			marketSwapType = "Decrease"
			CloseMarketScreen(screen, button, true)
			OpenMarketScreen()
		elseif marketSwapType == "Decrease" then
			for itemIndex, item in ipairs( CurrentRun.MarketItems ) do
				if item.Priority then
					item.CostAmount = item.CostAmount / 10
					item.BuyAmount = item.BuyAmount / 10
				end
			end
			marketSwapType = "Increase"
			CloseMarketScreen(screen, button, true)
			OpenMarketScreen()
		end
	end

	function CloseMarketScreen( screen, button, isSwap )
		--mod start
		if not isSwap and marketSwapType == "Decrease" then
			for itemIndex, item in ipairs( CurrentRun.MarketItems ) do
				if item.Priority then
					item.CostAmount = item.CostAmount / 10
					item.BuyAmount = item.BuyAmount / 10
				end
			end
			marketSwapType = "Increase"
		end
		--mod end
		DisableShopGamepadCursor()
		CloseScreen( GetAllIds( screen.Components ) )
		PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
		UnfreezePlayerUnit()
		screen.KeepOpen = false
		OnScreenClosed({ Flag = screen.Name })
	end
end

if PQOL.Config.Pact.Enabled then
	--Add reset button to pact
	function OpenShrineUpgradeMenu( args )
		args = args or {}
		GameState.Flags.ShrineUnlocked = true

		ScreenAnchors.ShrineScreen = { Components = {} }
		local screen = ScreenAnchors.ShrineScreen
		local components = screen.Components
		OverwriteTableKeys( screen, args )
		screen.Name = "ShrineUpgrade"
		screen.ResourceName = "ShrinePoints"
		screen.MaxShrinePoints = GetMaximumPossibleShrinePoints()
		screen.CloseAnimation = "ShrineOut"
		screen.SubtitleText = "ShrineMenu_Subtitle_CurrentMetaPoints"
		screen.InvestedColor = Color.MetaUpgradePointsInvalidPulseColor
		screen.UnlockVoiceLines = HeroVoiceLines.ShrineUpgradeUnlockedVoiceLines
		screen.FreeSpend = true
		screen.RefundPresentationName = "ShrinePointRefundPresentation"
		screen.SpendPresentationName = "ShrinePointSpendPresentation"
		screen.StatChangeX = 360 - 68
		screen.UpgradeCostX = 550 - 68
		screen.UpgradeCostJustification = "Left"
		screen.HighlightX = -196 + 80 - 68
		screen.TooltipOffsetX = 350
		screen.BackingOffsetX = -25 - 68

		screen.BackingTooltipOffsetX = 35 - 68
		screen.BackingTooltipOffsetY = 1

		screen.RightArrowOffsetX = LevelUpUI.RightArrowOffsetX + 10
		screen.LeftArrowOffsetX = LevelUpUI.LeftArrowOffsetX + 23
		screen.RightArrowOverride = "LevelUpArrowRight"
		screen.IconX = 970 - 68

		local firstView = not GameState.ScreensViewed[screen.Name]

		OnScreenOpened({ Flag = screen.Name, PersistCombatUI = false })
		FreezePlayerUnit()

		EnableShopGamepadCursor()
		HideCombatUI()
		SetConfigOption({ Name = "FreeFormSelectWrapY", Value = true })
		SetConfigOption({ Name = "ExclusiveInteractGroup", Value = nil })
		SetConfigOption({ Name = "FreeFormSelectStepDistance", Value = 16 })
		SetConfigOption({ Name = "FreeFormSelectSuccessDistanceStep", Value = 8 })
		SetConfigOption({ Name = "FreeFormSelecSearchFromId", Value = 0 })
		SetConfigOption({ Name = "FreeFormSelectRepeatDelay", Value = 0.6 })
		SetConfigOption({ Name = "FreeFormSelectRepeatInterval", Value = 0.1 })

		screen.SubjectName = "ShrineUpgrades"
		components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
		components.ShopBackgroundSplatter = CreateScreenComponent({ Name = "LevelUpBackground", Group = "Combat_Menu" })
		components.ShopBackground = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })

		local thermometerCenter = 550
		components.ThermometerForeground = CreateScreenComponent({ Name = "ShrineMeterBarFill", Group = "Combat_Menu", X = thermometerCenter, Y = ScreenCenterY - 90 })
		SetScale({ Id = components.ThermometerForeground.Id, Fraction = 0.88 })
		local fraction = 1
		if GetShrinePointLimit() > 0 then
			fraction = GetTotalSpentShrinePoints() / GetShrinePointLimit()
		end
		SetAnimationFrameTarget({ Name = "ShrineMeterBarFill", Fraction = fraction, DestinationId = components.ThermometerForeground.Id, Instant = true })
		components.ThermometerEffects = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_Additive" })
		SetScale({ Id = components.ThermometerEffects.Id, Fraction = 0.88 })
		Attach({ Id = components.ThermometerEffects.Id, DestinationId = components.ThermometerForeground.Id })

		SetAnimation({ DestinationId = components.ShopBackground.Id, Name = "ShrineIn" })
		SetScale({ Id = components.ShopBackgroundDim.Id, Fraction = 4 })
		SetColor({ Id = components.ShopBackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })

		PlaySound({ Name = "/SFX/Menu Sounds/PactMenuOpenSFX" })

		thread( PlayVoiceLines, HeroVoiceLines.OpenedShrineVoiceLines, true )

		-- for conditional VO on menu close
		screen.PointsAddedThisTime = 0

		local yStart = -475
		-- Title
		CreateTextBox({ Id = components.ShopBackground.Id, Text = "ShrineMenu", FontSize = 38, OffsetX = 0, OffsetY = yStart, Color = {1.000, 0.776, 0.000, 1.0}, Font = "SpectralSCExtraLight", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
		CreateTextBox({ Id = components.ShopBackground.Id, Text = "ShrineMenu_Flavor", FontSize = 15, OffsetX = 0, OffsetY = yStart + 45, Width = 840, Color = {1.000, 0.443, 0.110, 1.0}, Font = "CrimsonTextItalic", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })

		CreateTextBox({ Id = components.ShopBackground.Id, Text = "ShrineMenu_SubHead", FontSize = 24, OffsetX = -620, OffsetY = yStart + 130, Width = 1080, Color = Color.White, Font = "AlegreyaSansSCExtraBold", ShadowBlur = 0, ShadowColor = {0,0,0,255}, ShadowOffset={0, 1}, Justification = "Left", VerticalJustification = "CENTER", TextSymbolScale = 1.0 })

		if not screen.ReadOnly then
			CreateTextBox({ Id = components.ShopBackground.Id, Text = "ShrineMenu_Hint", FontSize = 18, OffsetX = -475, OffsetY = yStart + 825, Width = 540, Color = {255, 255, 255, 240}, Font = "AlegreyaSansRegular", ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 1}, ShadowAlpha=0.5, Justification = "Center", LineSpacingBottom = 10, Scale = 0 })
		end

		local weaponName = GetEquippedWeapon()
		components.WeaponTitle = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
		Attach({ Id = components.WeaponTitle, DestinationId = components.ShopBackground.Id })

		components.WeaponImage = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu_TraitTray", X = 250, Y = 470 })
		SetAnimation({ DestinationId = components.WeaponImage.Id, Name = GetWeaponAspectImage( weaponName ) })

		SetThingProperty({ Property = "Ambient", Value = 0.0, DestinationId = components.WeaponImage.Id })

		local text = "RequiredShrineThreshold"
		local weaponName = GetEquippedWeapon()
		local currentShrineThreshold = GetCurrentRunClearedShrinePointThreshold( weaponName )
		if not IsShrinePointLevelFullyCleared( GetEquippedWeapon(), 0 ) and GetLastClearedShrinePointThreshold( weaponName ) <= 0 and not GameState.Flags.HardMode then
			text = "RequiredShrineThreshold_Zero"
		elseif currentShrineThreshold > GetMaximumAllocatableShrinePoints() then
			currentShrineThreshold = GetMaximumAllocatableShrinePoints()
			text = "RequiredShrineThreshold_AtSoftLimit"
			if not IsShrinePointLevelFullyCleared( GetEquippedWeapon(), 0 ) and not GameState.Flags.HardMode then
				text = "RequiredShrineThreshold_AtSoftLimit_ZeroLimitUncleared"
			end
		end

		CreateTextBox({ Id = components.WeaponTitle.Id, Text = text, FontSize = 20, OffsetX = -600, OffsetY = yStart + 235, Width = 540, Color = Color.White, Font = "AlegreyaSansSCRegular", ShadowBlur = 0, ShadowColor = {0,0,0,255}, ShadowOffset={0, 1}, Justification = "Left", VerticalJustification = "CENTER", LineSpacingBottom = 10, TextSymbolScale = 1.0, LuaKey = "TempTextData", LuaKey = "TempTextData", LuaValue = { Limit = GetShrinePointLimit(), WeaponName = weaponName },
			LangRuScaleModifier = 0.9,
			LangPlScaleModifier = 0.9,
			LangItScaleModifier = 0.9,
			LangKoScaleModifier = 0.9,
			LangCnScaleModifier = 0.9
		})
			-- Alert text
		components.LocationAlerts = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
		Attach({ Id = components.LocationAlerts, DestinationId = components.ShopBackground.Id })

		components.LocationAlertHeader = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
		Attach({ Id = components.LocationAlertHeader, DestinationId = components.ShopBackground.Id })

		components.ThresholdText = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX - 210, Y = ScreenCenterY - 15, Group = "Combat_Menu" })
		Attach({ Id = components.ThresholdText, DestinationId = components.ShopBackground.Id })
		CreateTextBox({ Id = components.ThresholdText.Id, Text = "Blank", FontSize = 18, Width = 600, Color = Color.White, Font = "AlegreyaSansRegular", ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 1}, Justification = "Center", VerticalJustification = "CENTER", TextSymbolScale = 1.0, LineSpacingBottom = 8, OffsetX = -155, OffsetY = -26,
			LangRuScaleModifier = 0.7,
			LangPlScaleModifier = 0.8,
			LangKoScaleModifier = 0.7,
		})


		-- location rewards

		local locationY = yStart + 678
		local locationMarkY = locationY - 35

		local locationXSpacer = 124
		local locationX = -548
		local iconOffsetX = -18
		local iconOffsetY = -22
		local checkMarkOffsetX = 18
		local checkMarkOffsetY = 16

		local rewardShrineAmount = GetTotalSpentShrinePoints()
		if rewardShrineAmount > GetCurrentRunClearedShrinePointThreshold( weaponName ) then
			rewardShrineAmount = GetCurrentRunClearedShrinePointThreshold( weaponName )
		end

		CreateTextBox({ Id = components.LocationAlertHeader.Id, Text = "ShrineRewardBiomeProgress", FontSize = 22, OffsetX = -580, OffsetY = locationY - 160, Width = 580, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,255}, ShadowOffset={0, 1}, Justification = "Left", VerticalJustification = "Top", TextSymbolScale = 0.75, LuaKey = "TempTextData", LineSpacingBottom = 12, LuaValue = { ShrinePointThreshold = rewardShrineAmount, WeaponName = WeaponData[GetEquippedWeapon()].ShortName },
			LangRuScaleModifier = 0.75,
			LangPlScaleModifier = 0.75,
			LangKoScaleModifier = 0.85,
		})

		screen.ClearIndicatorIds = {}

		if HasSeenRoom( "RoomOpening" ) then
			CreateTextBox({ Id = components.LocationAlerts.Id, Text = "Location_Tartarus", FontSize = 14, OffsetX = locationX, OffsetY = locationY, Width = 200, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 1}, Justification = "Center", VerticalJustification = "Top", TextSymbolScale = 1.0, LuaKey = "TempTextData", LuaValue = { TartarusCleared = tartarusText, AsphodelCleared = asphodelText, ElysiumCleared = elysiumText, StyxCleared = styxText } })
		end
		components.TartarusClearIndicator = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({ Id = components.TartarusClearIndicator.Id, DestinationId = components.LocationAlerts.Id, OffsetX = locationX + checkMarkOffsetX, OffsetY = locationMarkY + checkMarkOffsetY})
		components.TartarusClearRewardIndicator = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		SetScale({ Id = components.TartarusClearRewardIndicator.Id, Fraction = 0.8})
		Attach({ Id = components.TartarusClearRewardIndicator.Id, DestinationId = components.TartarusClearIndicator.Id, OffsetX = iconOffsetX, OffsetY = iconOffsetY })
		table.insert( screen.ClearIndicatorIds, components.TartarusClearIndicator.Id )
		table.insert( screen.ClearIndicatorIds, components.TartarusClearRewardIndicator.Id )
		locationX = locationX + locationXSpacer

		if HasSeenRoom( "B_Intro" ) then
			CreateTextBox({ Id = components.LocationAlerts.Id, Text = "Location_Asphodel", FontSize = 14, OffsetX = locationX, OffsetY = locationY, Width = 200, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 1}, Justification = "Center", VerticalJustification = "Top", TextSymbolScale = 1.0, LuaKey = "TempTextData", LuaValue = { TartarusCleared = tartarusText, AsphodelCleared = asphodelText, ElysiumCleared = elysiumText, StyxCleared = styxText } })
		end
		components.AsphodelClearIndicator = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({ Id = components.AsphodelClearIndicator.Id, DestinationId = components.LocationAlerts.Id, OffsetX = locationX + checkMarkOffsetX, OffsetY = locationMarkY + checkMarkOffsetY})
		components.AsphodelClearRewardIndicator = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		SetScale({ Id = components.AsphodelClearRewardIndicator.Id, Fraction = 0.8})
		Attach({ Id = components.AsphodelClearRewardIndicator.Id, DestinationId = components.AsphodelClearIndicator.Id, OffsetX = iconOffsetX, OffsetY = iconOffsetY })
		table.insert( screen.ClearIndicatorIds, components.AsphodelClearIndicator.Id )
		table.insert( screen.ClearIndicatorIds, components.AsphodelClearRewardIndicator.Id )
		locationX = locationX + locationXSpacer

		if HasSeenRoom( "C_Intro" ) then
			CreateTextBox({ Id = components.LocationAlerts.Id, Text = "Location_Elysium", FontSize = 14, OffsetX = locationX,	OffsetY = locationY, Width = 200, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 1}, Justification = "Center", VerticalJustification = "Top", TextSymbolScale = 1.0, LuaKey = "TempTextData", LuaValue = { TartarusCleared = tartarusText, AsphodelCleared = asphodelText, ElysiumCleared = elysiumText, StyxCleared = styxText } })
		end
		components.ElysiumClearIndicator = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({ Id = components.ElysiumClearIndicator.Id, DestinationId = components.LocationAlerts.Id, OffsetX = locationX + checkMarkOffsetX, OffsetY = locationMarkY + checkMarkOffsetY})
		components.ElysiumClearRewardIndicator = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		SetScale({ Id = components.ElysiumClearRewardIndicator.Id, Fraction = 0.8})
		Attach({ Id = components.ElysiumClearRewardIndicator.Id, DestinationId = components.ElysiumClearIndicator.Id, OffsetX = iconOffsetX, OffsetY = iconOffsetY })
		table.insert( screen.ClearIndicatorIds, components.ElysiumClearIndicator.Id )
		table.insert( screen.ClearIndicatorIds, components.ElysiumClearRewardIndicator.Id )
		locationX = locationX + locationXSpacer

		if HasSeenRoom( "D_Intro" ) then
			CreateTextBox({ Id = components.LocationAlerts.Id, Text = "Location_Styx_Short", FontSize = 14, OffsetX = locationX, OffsetY = locationY, Width = 150, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 1}, Justification = "Center", VerticalJustification = "Top", TextSymbolScale = 1.0, LuaKey = "TempTextData", LuaValue = { TartarusCleared = tartarusText, AsphodelCleared = asphodelText, ElysiumCleared = elysiumText, StyxCleared = styxText } })
		end
		components.StyxClearIndicator = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		Attach({ Id = components.StyxClearIndicator.Id, DestinationId = components.LocationAlerts.Id, OffsetX = locationX + checkMarkOffsetX, OffsetY = locationMarkY + checkMarkOffsetY})
		components.StyxClearRewardIndicator = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		SetScale({ Id = components.StyxClearRewardIndicator.Id, Fraction = 0.8})
		Attach({ Id = components.StyxClearRewardIndicator.Id, DestinationId = components.StyxClearIndicator.Id, OffsetX = iconOffsetX, OffsetY = iconOffsetY })
		table.insert( screen.ClearIndicatorIds, components.StyxClearIndicator.Id )
		table.insert( screen.ClearIndicatorIds, components.StyxClearRewardIndicator.Id )
		-- Subtitle

		if not screen.ReadOnly then
			local pointsSpent = GetTotalSpentShrinePoints()
			local bonus = (pointsSpent * CurrentRun.Hero.ShrinePointMetaPointBonusMultiplier) * 100
			components.SubtitleMetaPointBonus = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
			screen.SubtitleMetaPointBonusText = "ShrineMenu_Subtitle_MetaPointBonus"
			CreateTextBox({ Id = components.SubtitleMetaPointBonus.Id, Text = screen.SubtitleMetaPointBonusText, FontSize = 24, OffsetX = -232, OffsetY = yStart + 195, Width = 840, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,255}, ShadowOffset={0, 1}, Justification = "Right", TextSymbolScale = 1.0, LuaKey = "TempTextData", LuaValue = { Current = pointsSpent, Limit = GetShrinePointLimit()} })

			components.SubTitle = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })

			components.SpentShrinePoints = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
			CreateTextBox({ Id = components.SpentShrinePoints.Id, Text = screen.SubtitleText, FontSize = 26, OffsetX = -165, OffsetY = yStart + 385, Width = 840, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,255}, ShadowOffset={0, 1}, Justification = "Center", TextSymbolScale = 1.0, LuaKey = "TempTextData", LuaValue = { CurrentAmount = pointsSpent, Limit = GetShrinePointLimit()},
				LangRuScaleModifier = 0.65,
				LangPlScaleModifier = 0.65
			})

			if GameState.Flags.HardMode and GameState.SpentShrinePointsCache < currentShrineThreshold then
				local shrinePointThreshold = GetCurrentRunClearedShrinePointThreshold( weaponName )
				local shrinePointsSpent = GameState.SpentShrinePointsCache or 5
				if shrinePointsSpent < shrinePointThreshold then
					thread( HardModeShrinePointThresholdIncreasedPresentation, screen )
				end
			end
		end

		if not screen.ReadOnly then
			local hasLockedUpgrades = false
			for k, upgradeName in pairs( ShrineUpgradeOrder ) do
				if not GameState.MetaUpgradesUnlocked[upgradeName] then
					hasLockedUpgrades = true
					break
				end
			end

			if hasLockedUpgrades then
				components.SubTitleKeys = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = ScreenCenterY, Group = "Combat_Menu" })
				Attach({ Id = components.SubTitleKeys, DestinationId = components.ShopBackground.Id })

				local keyAmount = GameState.Resources.LockKeys or 0
				local superKeyAmount = GameState.Resources.SuperLockKeys or 0
				CreateTextBox({ Id = components.SubTitleKeys.Id, Text = "MetaUpgradeMenu_Subtitle_Key", FontSize = 26, OffsetX = 205, OffsetY = -225, Width = 840, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {68,68,68,255}, ShadowOffset={0, 1}, Justification = "Right", TextSymbolScale = 0.8, LuaKey = "TempTextData", LuaValue = { CurrentKeys = keyAmount, CurrentSuperKeys = superKeyAmount }})
			end
		end

		-- Info button
		components.InfoButton = CreateScreenComponent({ Name = "ShrineUpgradeMenuInfo", Scale = 1.0, Group = "Combat_Menu" })
		Attach({ Id = components.InfoButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -300, OffsetY = 456 })
		components.InfoButton.OnPressedFunctionName = "ShowShrineInfo"
		-- CreateTextBox({ Id = components.InfoButton.Id, Text = "ShrineMenu_Info", FontSize = 18, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {68,68,68,255}, ShadowOffset={0, 1}, Justification = "Center", TextSymbolScale = 0.8, })
		components.InfoButton.ControlHotkey = "MenuInfo"

		-- Close button
		components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 1, Group = "Combat_Menu" })
		Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = -440, OffsetY = 456 })
		components.CloseButton.OnPressedFunctionName = "CloseShrineUpgradeScreen"
		components.CloseButton.OnPressedGlobalVoiceLines = "SkellyClosedShrineReactionVoiceLines"
		components.CloseButton.ControlHotkey = "Cancel"


		if not args or not args.BlockRunStartButton then
			components.StartButton = CreateScreenComponent({ Name = "ShrineUpgradeMenuConfirm", Scale = 1, Group = "Combat_Menu" })
			Attach({ Id = components.StartButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 400, OffsetY = 456 })
			components.StartButton.OnPressedFunctionName = "CloseShrineUpgradeScreenAndStartOver"
			CreateTextBox({ Id = components.StartButton.Id, Text = "ShrineMenu_Confirm", FontSize = 26, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {68,68,68,255}, ShadowOffset={0, 1}, Justification = "Center", TextSymbolScale = 0.8, })
			components.StartButton.ControlHotkey = "Confirm"
		end

		--Mod start
		components.ResetButton = CreateScreenComponent({ Name = "ShrineUpgradeMenuConfirm", Scale = 1, Group = "Combat_Menu" })
		Attach({ Id = components.ResetButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0, OffsetY = 456 })
		components.ResetButton.OnPressedFunctionName = "ResetShrine"
		CreateTextBox({ Id = components.ResetButton.Id, Text = "Reset Options", FontSize = 26, Color = Color.White, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {68,68,68,255}, ShadowOffset={0, 1}, Justification = "Center", TextSymbolScale = 0.8, })
		--Mod end

		components.LevelUpStatHighlight = CreateScreenComponent({ Name = "ShrineStatHighlight", Group = "Combat_Menu" })
		SetAlpha({ Id = components.LevelUpStatHighlight.Id, Fraction = 0.0 })
		ScreenAnchors.LevelUpStatHighlightId = components.LevelUpStatHighlight.Id

		local itemLocationX = ScreenCenterX + 280 - 68
		local itemLocationY = yStart + 765
		local firstUseable = false
		for k, upgradeName in ipairs( ShrineUpgradeOrder ) do
			local upgradeData = MetaUpgradeData[upgradeName]
			local itemBackingKey = "Backing"..k
			components[itemBackingKey] = CreateScreenComponent({ Name = "BlankObstacle", X = itemLocationX, Y = itemLocationY, Group = "Combat_Menu" })

			local graphicKey = "Graphic"..k
			components[graphicKey] = CreateScreenComponent({ Name = "BlankObstacle", X = itemLocationX, Y = itemLocationY, Scale = 0.7, Group = "Combat_Menu" })
			Attach({ Id = components[graphicKey].Id, DestinationId = components[itemBackingKey].Id, OffsetX = -265 - 30, OffsetY = -30 })

			if ( upgradeData.GameStateRequirements ~= nil and not IsGameStateEligible( CurrentRun, upgradeData.GameStateRequirements ) and not args.IgnoreRequirements ) then
				-- Leave blank
			elseif GetNumMetaUpgrades( upgradeName ) > 0 or not upgradeData.RequiredHeatThreshold or GetHighestRunClearShrinePointThreshold() >= upgradeData.RequiredHeatThreshold or ( upgradeData.RequiredPreUpdateSevenHeatThreshold and GetPreUpdateSevenHighestShrinePointRunClear() > upgradeData.RequiredPreUpdateSevenHeatThreshold ) then
				if not GameState.MetaUpgradesUnlocked[upgradeName] and not screen.ReadOnly then
					CreateTextBox({ Id = components[itemBackingKey].Id, Text = upgradeData.Name,
						FontSize = 21,
						OffsetX = LevelUpUI.TextInfoBaseX, OffsetY = -30,
						Color = Color.ShrineAttributeLocked,
						Font = "AlegreyaSansSCExtraBold",
						ShadowBlur = 0, ShadowColor = {0,0,0,255}, ShadowOffset={0, 2},
						Justification = "Left" })

					local unlockId = "Locked"..k
					local metaUpgradeNextCostKey = "UpgradeCost"..k

					local button = CreateUnlockButton( upgradeData, { Screen = screen, OffsetX = itemLocationX, OffsetY = itemLocationY, Index = k, IsEnabled = HasResource( upgradeData.ResourceName, upgradeData.UnlockCost ), KeyCostKey = metaUpgradeNextCostKey } )
					button.ResourceName = screen.ResourceName

					components[metaUpgradeNextCostKey] = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = itemLocationY, Group = "Combat_Menu" })
					Attach({ Id = components[metaUpgradeNextCostKey].Id, DestinationId = components[unlockId].Id })

					local color = Color.White
					if not HasResource( upgradeData.ResourceName, upgradeData.UnlockCost ) then
						color = Color.MetaUpgradePointsInvalid
					end

					local text = "Blank"
					if ResourceData[ upgradeData.ResourceName ] and ResourceData[ upgradeData.ResourceName ].RequirementText then
						text = ResourceData[ upgradeData.ResourceName ].RequirementText
					end
					CreateTextBox({
						Id = components[metaUpgradeNextCostKey].Id, Text = text,
						LuaKey = "TempTextData", LuaValue = { Amount = tostring(upgradeData.UnlockCost) },
						FontSize = 26,
						OffsetX = 160, OffsetY = 0,
						TextSymbolScale = 0.85,
						Color = color,
						Font = "AlegreyaSansSCRegular",
						ShadowBlur = 0, ShadowColor = {96,96,96,255}, ShadowOffset={0, 1},
						Justification = "Right" })

					local lockIconKey = "LockIcon"..k
					components[lockIconKey] = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = itemLocationY, Group = "Combat_Menu" })
					Attach({ Id = components[lockIconKey].Id, DestinationId = components[unlockId].Id, OffsetX = -530, OffsetY = -2 })
					SetAnimation({ Name = "LockedIcon", DestinationId = components[lockIconKey].Id, Scale = 1.0 })
				else
					CreateMetaUpgradeEntry( { Screen = screen, Components = components, Data = upgradeData, Index = k, OffsetY = itemLocationY } )
				end
			elseif upgradeData.RequiredHeatThreshold and not screen.ReadOnly  then
				CreateTextBox({ Id = components[itemBackingKey].Id, Text = "UnknownShrineUpgrade",
					FontSize = 21,
					OffsetX = LevelUpUI.TextInfoBaseX, OffsetY = -30,
					Color = Color.ShrineAttribute,
					Font = "AlegreyaSansSCExtraBold",
					ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 1},
					Justification = "Left",
					LuaKey = "TempTextData", LuaValue = { Amount = tostring(upgradeData.RequiredHeatThreshold) },
				})
			end
			itemLocationY = itemLocationY + LevelUpUI.MetaUpgradeSpacer
		end

		UpdateButtonStates( screen )

		if firstView then
			ShowShrineInfo( screen )
			TeleportCursor({ OffsetX = 1470, OffsetY = 280, ForceUseCheck = true })
		else
			TeleportCursor({ OffsetX = ScreenCenterX + 300, OffsetY = ScreenCenterY + 456, ForceUseCheck = true })
		end

		screen.KeepOpen = true
		thread( HandleWASDInput, screen )
		HandleScreenInput( screen )

	end

	function ResetShrine(screen, button)
		if GameState.Flags.HardMode then
			local HellModeLockedOptions = { "EnemyDamageShrineUpgrade", "HealingReductionShrineUpgrade", "EnemyCountShrineUpgrade", "EnemyHealthShrineUpgrade", "NoInvulnerabilityShrineUpgrade"}
			for k, upgradeName in pairs( ShrineUpgradeOrder ) do
				if not Contains(HellModeLockedOptions, upgradeName) then
					local upgradeData = MetaUpgradeData[upgradeName]
					if GameState.MetaUpgrades[upgradeName] ~= nil and GameState.MetaUpgrades[upgradeName] > 0 then
						while GameState.MetaUpgrades[upgradeName] > 0 do
							DecrementTableValue( GameState.MetaUpgrades, upgradeName )
							ApplyMetaUpgrade( upgradeData, true, GameState.MetaUpgrades[upgradeName] <= 0, true )
						end
					end
				end
			end
		else
			for k, upgradeName in pairs( ShrineUpgradeOrder ) do
				local upgradeData = MetaUpgradeData[upgradeName]
				if GameState.MetaUpgrades[upgradeName] ~= nil and GameState.MetaUpgrades[upgradeName] > 0 then
					while GameState.MetaUpgrades[upgradeName] > 0 do
						DecrementTableValue( GameState.MetaUpgrades, upgradeName )
						ApplyMetaUpgrade( upgradeData, true, GameState.MetaUpgrades[upgradeName] <= 0, true )
					end
				end
			end
		end
		CloseShrineUpgradeScreen(screen, button)
		OpenShrineUpgradeMenu()
	end
end

if PQOL.Config.Commendations.Enabled then
	--Add Commendations codex tab
	local Commendations =
	{
		Order =
		{
			"ClearNumOne",
			"ClearNumTen",
			"ClearNumFifty",
			"ClearNumOneHundred",
			"ClearNumTwoFifty",
			"ClearNumFiveHundred",
			"ClearNearDeath",
			"ClearFullHealth",
			"ClearHighMaxHealth",
			"ClearTimeFast",
			"ClearTimeVeryFast",
			"ClearTimeSlow",
			"ClearMoneyNone",
			"ClearMoneyHigh",
			"ClearMetaPointsInvestedNone",
			"ClearNoOlympianBoons",
			"ClearAllStoryRooms",
			"ClearAllReprieveRooms",
			"ClearAllShopRooms",
			"ClearRequiredTraitsZeus",
			"ClearRequiredTraitsPoseidon",
			"ClearRequiredTraitsAthena",
			"ClearRequiredTraitsAres",
			"ClearRequiredTraitsArtemis",
			"ClearRequiredTraitsAphrodite",
			"ClearRequiredTraitsDionysus",
			"ClearRequiredTraitsDemeter",
			"ClearRequiredTraitsHermes",
			"ClearRequiredTraitsChaos",
			"ClearSynergyTraits",
			"ClearLegendaryTraits",
			"ClearChallengeSwitches",
			"ClearDevotionEncounters",
			"ClearShrineChallengeEncounters",
			"ClearMiniBossEncounters",
			"ClearWeaponsFiredWrath",
			"ClearWeaponsFiredRanged",
			"ClearFishCaught",
			"ClearConsecutiveHigh",
			"ClearHealItems",
			"ClearStackUpgrades",
			"ClearGiftDrops",
			"ClearLockKeyDrops",
			"ClearConsolationPrizes",
			"ClearManyLastStands",
			"ClearShutDownThanatos",
			"ClearManyTraitsSold",
		}
	}

	table.insert(CodexOrdering.Order, "Commendations")
	CodexOrdering.Commendations = Commendations

	Commendations =
	{
		UnlockType = CodexUnlockTypes.Mystery,
		TitleText = "Commendations",
		Entries =
		{
			ClearNumOne =
			{
				Entries =
				{
					{
						Text = "Commendation_0001"
					},
					{
						Text = "Commendation_0002",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearNumTen =
			{
				Entries =
				{
					{
						Text = "Commendation_0003"
					},
					{
						Text = "Commendation_0004",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearNumFifty =
			{
				Entries =
				{
					{
						Text = "Commendation_0005"
					},
					{
						Text = "Commendation_0006",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearNumOneHundred =
			{
				Entries =
				{
					{
						Text = "Commendation_0007"
					},
					{
						Text = "Commendation_0008",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearNumTwoFifty =
			{
				Entries =
				{
					{
						Text = "Commendation_0009"
					},
					{
						Text = "Commendation_0010",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearNumFiveHundred =
			{
				Entries =
				{
					{
						Text = "Commendation_0011"
					},
					{
						Text = "Commendation_0012",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearNearDeath =
			{
				Entries =
				{
					{
						Text = "Commendation_0013"
					},
					{
						Text = "Commendation_0014",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearFullHealth =
			{
				Entries =
				{
					{
						Text = "Commendation_0015"
					},
					{
						Text = "Commendation_0016",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearHighMaxHealth =
			{
				Entries =
				{
					{
						Text = "Commendation_0017"
					},
					{
						Text = "Commendation_0018",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearTimeFast =
			{
				Entries =
				{
					{
						Text = "Commendation_0019"
					},
					{
						Text = "Commendation_0020",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearTimeVeryFast =
			{
				Entries =
				{
					{
						Text = "Commendation_0021"
					},
					{
						Text = "Commendation_0022",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearTimeSlow =
			{
				Entries =
				{
					{
						Text = "Commendation_0023"
					},
					{
						Text = "Commendation_0024",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearMoneyNone =
			{
				Entries =
				{
					{
						Text = "Commendation_0025"
					},
					{
						Text = "Commendation_0026",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearMoneyHigh =
			{
				Entries =
				{
					{
						Text = "Commendation_0027"
					},
					{
						Text = "Commendation_0028",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearMetaPointsInvestedNone =
			{
				Entries =
				{
					{
						Text = "Commendation_0029"
					},
					{
						Text = "Commendation_0030",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearNoOlympianBoons =
			{
				Entries =
				{
					{
						Text = "Commendation_0031"
					},
					{
						Text = "Commendation_0032",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearAllStoryRooms =
			{
				Entries =
				{
					{
						Text = "Commendation_0033"
					},
					{
						Text = "Commendation_0034",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearAllReprieveRooms =
			{
				Entries =
				{
					{
						Text = "Commendation_0035"
					},
					{
						Text = "Commendation_0036",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearAllShopRooms =
			{
				Entries =
				{
					{
						Text = "Commendation_0037"
					},
					{
						Text = "Commendation_0038",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsZeus =
			{
				Entries =
				{
					{
						Text = "Commendation_0039"
					},
					{
						Text = "Commendation_0040",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsPoseidon =
			{
				Entries =
				{
					{
						Text = "Commendation_0041"
					},
					{
						Text = "Commendation_0042",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsAthena =
			{
				Entries =
				{
					{
						Text = "Commendation_0043"
					},
					{
						Text = "Commendation_0044",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsAres =
			{
				Entries =
				{
					{
						Text = "Commendation_0045"
					},
					{
						Text = "Commendation_0046",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsArtemis =
			{
				Entries =
				{
					{
						Text = "Commendation_0047"
					},
					{
						Text = "Commendation_0048",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsAphrodite =
			{
				Entries =
				{
					{
						Text = "Commendation_0049"
					},
					{
						Text = "Commendation_0050",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsDionysus =
			{
				Entries =
				{
					{
						Text = "Commendation_0051"
					},
					{
						Text = "Commendation_0052",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsDemeter =
			{
				Entries =
				{
					{
						Text = "Commendation_0053"
					},
					{
						Text = "Commendation_0054",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsHermes =
			{
				Entries =
				{
					{
						Text = "Commendation_0055"
					},
					{
						Text = "Commendation_0056",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearRequiredTraitsChaos =
			{
				Entries =
				{
					{
						Text = "Commendation_0057"
					},
					{
						Text = "Commendation_0058",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearSynergyTraits =
			{
				Entries =
				{
					{
						Text = "Commendation_0059"
					},
					{
						Text = "Commendation_0060",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearLegendaryTraits =
			{
				Entries =
				{
					{
						Text = "Commendation_0061"
					},
					{
						Text = "Commendation_0062",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearChallengeSwitches =
			{
				Entries =
				{
					{
						Text = "Commendation_0063"
					},
					{
						Text = "Commendation_0064",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearDevotionEncounters =
			{
				Entries =
				{
					{
						Text = "Commendation_0065"
					},
					{
						Text = "Commendation_0066",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearShrineChallengeEncounters =
			{
				Entries =
				{
					{
						Text = "Commendation_0067"
					},
					{
						Text = "Commendation_0068",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearMiniBossEncounters =
			{
				Entries =
				{
					{
						Text = "Commendation_0069"
					},
					{
						Text = "Commendation_0070",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearWeaponsFiredWrath =
			{
				Entries =
				{
					{
						Text = "Commendation_0071"
					},
					{
						Text = "Commendation_0072",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearWeaponsFiredRanged =
			{
				Entries =
				{
					{
						Text = "Commendation_0073"
					},
					{
						Text = "Commendation_0074",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearFishCaught =
			{
				Entries =
				{
					{
						Text = "Commendation_0075"
					},
					{
						Text = "Commendation_0076",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearConsecutiveHigh =
			{
				Entries =
				{
					{
						Text = "Commendation_0077"
					},
					{
						Text = "Commendation_0078",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearHealItems =
			{
				Entries =
				{
					{
						Text = "Commendation_0079"
					},
					{
						Text = "Commendation_0080",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearStackUpgrades =
			{
				Entries =
				{
					{
						Text = "Commendation_0081"
					},
					{
						Text = "Commendation_0082",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearGiftDrops =
			{
				Entries =
				{
					{
						Text = "Commendation_0083"
					},
					{
						Text = "Commendation_0084",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearLockKeyDrops =
			{
				Entries =
				{
					{
						Text = "Commendation_0085"
					},
					{
						Text = "Commendation_0086",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearConsolationPrizes =
			{
				Entries =
				{
					{
						Text = "Commendation_0087"
					},
					{
						Text = "Commendation_0088",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearManyLastStands =
			{
				Entries =
				{
					{
						Text = "Commendation_0089"
					},
					{
						Text = "Commendation_0090",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearShutDownThanatos =
			{
				Entries =
				{
					{
						Text = "Commendation_0091"
					},
					{
						Text = "Commendation_0092",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
			ClearManyTraitsSold =
			{
				Entries =
				{
					{
						Text = "Commendation_0093"
					},
					{
						Text = "Commendation_0094",
						UnlockType = CodexUnlockTypes.Mystery,
						UnlockThreshold = 1,
					}
				}
			},
		}
	}
	Codex.Commendations = Commendations

	local baseShowRunClearScreen = ShowRunClearScreen
	function ShowRunClearScreen()
		baseShowRunClearScreen()
		for name, message in pairs( GameData.RunClearMessageData ) do
			if IsGameStateEligible( CurrentRun, message.GameStateRequirements ) then
				UnlockCodexEntry("Commendations", message.Name, 2)
			end
		end
	end

	function CheckRunCompletionCommendations()
		local totalRuns = GetNumRunsCleared()
		if totalRuns >= 1 then
			UnlockCodexEntry("Commendations", "ClearNumOne", 2)
		end
		if totalRuns >= 10 then
			UnlockCodexEntry("Commendations", "ClearNumTen", 2)
		end
		if totalRuns >= 50 then
			UnlockCodexEntry("Commendations", "ClearNumFifty", 2)
		end
		if totalRuns >= 100 then
			UnlockCodexEntry("Commendations", "ClearNumOneHundred", 2)
		end
		if totalRuns >= 250 then
			UnlockCodexEntry("Commendations", "ClearNumTwoFifty", 2)
		end
		if totalRuns >= 500 then
			UnlockCodexEntry("Commendations", "ClearNumFiveHundred", 2)
		end
	end
	OnAnyLoad{"DeathArea",function(triggerArgs)
	CheckRunCompletionCommendations()
  end}
end

if PQOL.Config.PracticeFishing.Enabled then
	--Practice fishing
	OnControlPressed{ "Shout",
	function(triggerArgs)
		if CurrentDeathAreaRoom ~= nil and DeathLoopData[CurrentDeathAreaRoom.Name] then
			local ticks = 3
			while IsControlDown({ Name = "Shout" }) do
			if ticks <= 0 then
				ModUtil.Hades.PrintStack('Initiating practice fishing', 1)
				local fishingpoint = SpawnObstacle({ Name = "FishingPoint", Group = "FX_Terrain", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = 100, OffsetY = 100 })
				CurrentRun.Hero.FishingStarted = true
				FreezePlayerUnit( "FishingStartUp", { DisableTray = true, DisableCodex = true } )
				AddTimerBlock( CurrentRun, "Fishing" )
				wait( 0.25, "FishingStartDelay" )
				UnfreezePlayerUnit("FishingStartUp")
				if CurrentRun.Hero.FishingStarted then
					UseableOff({ Id = fishingpoint })
					SetAlpha({ Id = fishingpoint, Fraction = 0.0, Duration = 0.25 })
					BlockVfx({ DestinationId = fishingpoint })
					StartPracticeFishing( fishingpoint )
				end
				return
			else
				ModUtil.Hades.PrintStack('Initiating practice fishing in '..ticks, 1)
				ticks = ticks - 1
			end
			wait(1)
			end
		end
	end}

	function StartPracticeFishing(fishingPointId)
		FreezePlayerUnit( "Fishing", { DisableTray = true, DisableCodex = true } )
		CurrentRun.Hero.FishingInput = false
		CurrentRun.Hero.FishingState = "TooEarly"
		local fishingFailed = false
		local fishingAnimationPointId = SpawnObstacle({ Name = "BlankObstacle", DestinationId = fishingPointId, Group = GetGroupName({ Id = fishingPointId, DrawGroup = true }) })
		CreateTextBox({Id = fishingAnimationPointId, Text = CurrentRun.Hero.FishingState, FontSize = 24, Color = Color.Yellow, OffsetY = 30})

		FishingStartPresentation( fishingPointId, fishingAnimationPointId )
		-- zag fishing pose
		wait(1.5, "Fishing")
		thread( WaitForPracticeFishingInput, fishingAnimationPointId )

		local numfakedunks = RandomInt( FishingData.NumFakeDunks.Min, FishingData.NumFakeDunks.Max )
		for i = 1, numfakedunks do
			wait( RandomFloat( FishingData.FakeDunkInterval.Min, FishingData.FakeDunkInterval.Max ), "Fishing" )
			SetAnimation({ Name = "FishingBobberFakeDunkA", DestinationId = fishingAnimationPointId })
			thread( DoRumble, { { ScreenPreWait = 0.01, LeftFraction = 0.17, Duration = 0.17 }, } )
		end

		local warnTime = RandomFloat( FishingData.WarnInterval.Min, FishingData.WarnInterval.Max )
		wait( warnTime , "Fishing" )
		SetAnimation({ Name = "FishingBobberDunk", DestinationId = fishingAnimationPointId })
		thread( DoRumble, { { ScreenPreWait = 0.01, RightFraction = 0.4, Duration = 0.3 }, } )

		if not CurrentRun.Hero.FishingInput then
			CurrentRun.Hero.FishingState = "Perfect"
			ModifyTextBox({Id = fishingAnimationPointId, Text = CurrentRun.Hero.FishingState})
		end
		wait( FishingData.PerfectInterval, "Fishing" )

		if not CurrentRun.Hero.FishingInput then
			CurrentRun.Hero.FishingState = "Good"
			ModifyTextBox({Id = fishingAnimationPointId, Text = CurrentRun.Hero.FishingState})
		end
		wait( FishingData.GoodInterval, "Fishing" )

		if not CurrentRun.Hero.FishingInput then
			CurrentRun.Hero.FishingState = "TooLate"
			ModifyTextBox({Id = fishingAnimationPointId, Text = CurrentRun.Hero.FishingState})
		end

		SetAnimation({ Name = "FishingBobberResurface", DestinationId = fishingAnimationPointId })

		wait( FishingData.WayLateInterval, "Fishing" )
		if not CurrentRun.Hero.FishingInput then
			CurrentRun.Hero.FishingState = "WayLate"
			thread( CheckForFishNotCaughtWayTooLateVoiceLines )
			ModifyTextBox({Id = fishingAnimationPointId, Text = CurrentRun.Hero.FishingState})
		end
		wait( FishingData.GiveUpInterval, "Fishing" )
		notify("FishingInput")
	end

	function WaitForPracticeFishingInput( fishingAnimationPointId )
		ToggleControl({ Names = { "Use" }, Enabled = true })
		NotifyOnControlPressed({ Names = { "Use", }, Notify = "FishingInput" })
		waitUntil( "FishingInput" )
		DestroyTextBox({Id = fishingAnimationPointId})
		PracticeFishingEndPresentation( fishingAnimationPointId )
	end

	function PracticeFishingEndPresentation( fishingAnimationPointId )
		CreateAnimation({ Name = "FishingSplashB", DestinationId = fishingAnimationPointId })
		SetAlpha({ Id = fishingAnimationPointId, Fraction = 0, Duration = 0 })

		CurrentRun.Hero.FishingInput = true
		killTaggedThreads( "Fishing")
		local fishingState = CurrentRun.Hero.FishingState
		local fishName = nil
		local biomeName = CurrentRun.CurrentRoom.FishBiome or CurrentRun.CurrentRoom.RoomSetName or "None"
		fishName = GetFish( biomeName, fishingState )
		local fishData = FishingData.FishValues[fishName]

		if fishName then
			thread( MarkObjectiveComplete, "Fishing" )
			thread( PlayVoiceLines, fishData.FishCaughtVoiceLines )

			--Shake({ Id = CurrentRun.Hero.ObjectId, Distance = 2, Speed = 200, Duration = 0.35 })
			PlaySound({ Name = "/SFX/CriticalHit" })
			PlaySound({ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" })
			thread( DoRumble, { { ScreenPreWait = 0.04, RightFraction = 0.28, Duration = 0.4 }, } )
			wait(0.1)
			PlaySound({ Name = "/SFX/Player Sounds/ZagreusWhooshDropIn" })
			wait(0.2)
			--Shake({ Id = CurrentRun.Hero.ObjectId, Distance = 2, Speed = 200, Duration = 0.35 })
			PlaySound({ Name = "/SFX/Enemy Sounds/Megaera/MegDeathSplash", Id = fishingAnimationPointId })
			PlaySound({ Name = "/VO/ZagreusEmotes/EmoteRanged" })
			SetAnimation({ Name = "ZagreusInteractionFishing_PullSuccess", DestinationId = CurrentRun.Hero.ObjectId })
			thread( DoRumble, { { ScreenPreWait = 0.7, LeftFraction = 0.35, Duration = 0.4 }, } )

			PlaySound({ Name = "/Leftovers/SFX/VictoryScreenUpdateSFX", Delay = 1 })

			local fishingText = "Fishing_SuccessGoodTitle"
			if fishingState == "Perfect" then
				fishingText = "Fishing_SuccessPerfectTitle"
			end

			thread( PlayVoiceLines, fishData.FishIdentifiedVoiceLines )

			DisplayUnlockText({
				Icon = fishName,
				TitleText = fishingText,
				SubtitleText = "Fishing_SuccessSubtitle",
				SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = fishName }},
				IconOffsetY = 20,
				HighlightIcon = true,
				IconMoveSpeed = 0.1,
				IconScale = 0.64,
				AdditionalAnimation = "FishCatchPresentationSparkles",
				IconBacking = "FishCatchIconBacking",
				AnimationName = "LocationTextBGFish",
				AnimationOutName = "LocationTextBGFishOut",
			})
		else
			thread( MarkObjectiveFailed, "Fishing" )
			SetAnimation({ Name = "ZagreusInteractionFishing_PullFailure", DestinationId = CurrentRun.Hero.ObjectId })
			PlaySound({ Name = "/Leftovers/SFX/BigSplashRing", Delay = 0.3 })
			PlaySound({ Name = "/SFX/CrappyRewardDrop", Delay = 0.5 })

			PlaySound({ Name = "/Leftovers/SFX/ImpCrowdLaugh" })
			thread( DoRumble, { { ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 0.7 }, } )

			if CurrentRun.Hero.FishingState == "TooEarly" then
				thread( PlayVoiceLines, HeroVoiceLines.FishNotCaughtVoiceLines, true )

				thread( DisplayUnlockText, {
				TitleText = "Fishing_FailedTitle",
				SubtitleText = "Fishing_FailedEarly",
				})

			else
				if CurrentRun.Hero.FishingState == "TooLate" then
					thread( PlayVoiceLines, HeroVoiceLines.FishNotCaughtVoiceLines, true )
				elseif CurrentRun.Hero.FishingState == "WayLate" then
					thread( PlayVoiceLines, HeroVoiceLines.FishNotCaughtTooLateVoiceLines, true )
				end

				thread( DisplayUnlockText, {
				TitleText = "Fishing_FailedTitle",
				SubtitleText = "Fishing_FailedLate",
				})
			end
			wait( 2 )
		end
		CurrentRun.CurrentRoom.CompletedFishing = true
		CurrentRun.Hero.FishingStarted = false
		RemoveTimerBlock( CurrentRun, "Fishing" )
		UnfreezePlayerUnit("Fishing")
		UnblockCombatUI("Fishing")

		if CurrentRun.CurrentRoom.ZoomFraction ~= nil then
			AdjustZoom({ Fraction = CurrentRun.CurrentRoom.ZoomFraction, LerpTime = 1.5 })
		else
			AdjustZoom({ Fraction = 1.0, LerpTime = 1.5 })
		end
	end
end

if PQOL.Config.RegularCallHint.Enabled then
	--Display regular call text hint
	function SuperReachedPresentation( pipIndex, maxedOutMeter )
		if pipIndex == 1 then
			--Mod start
			thread( InCombatText, CurrentRun.Hero.ObjectId, "SuperCharged", 1.8, { ShadowScale = 0.8 } )
			--Mod end
		end

		if maxedOutMeter then
			thread( InCombatText, CurrentRun.Hero.ObjectId, "MaxSuperCharged", 1.8, { ShadowScale = 0.8 } )
		end

		if ScreenAnchors.SuperMeterHint then
			if maxedOutMeter then
				SetAnimation({ Name = "WrathBarFullFxStart", DestinationId = ScreenAnchors.SuperMeterHint })
			end
		end

		if ScreenAnchors.SuperPipIds then
			SetColor({ Color = Color.White, Ids = ScreenAnchors.SuperPipIds, Duration = 0.5 })
		end
	end
end

if PQOL.Config.BossNumericHealth.Enabled then
	--Display boss health in numbers
	function CreateBossHealthBar( boss )
		if boss.HasHealthBar then
			return
		end
		boss.HasHealthBar = true

		if ScreenAnchors.BossHealthTitles == nil then
			ScreenAnchors.BossHealthTitles = {}
		end
		local index = TableLength(ScreenAnchors.BossHealthTitles)
		local numBars = GetNumBossHealthBars()
		local yOffset = 0
		local xScale = 1 / numBars
		boss.BarXScale = xScale
		local totalWidth = ScreenWidth * xScale
		local xOffset = ( totalWidth / ( 2 * numBars )) * ( 1 + index * 2 ) + (ScreenWidth - totalWidth) / 2

		ScreenAnchors.BossHealthBack = CreateScreenObstacle({Name = "BossHealthBarBack", Group = "Combat_UI_Backing", X = xOffset , Y = 70 + yOffset})
		ScreenAnchors.BossHealthTitles[ boss.ObjectId ] = ScreenAnchors.BossHealthBack
		ScreenAnchors.BossHealthFill = CreateScreenObstacle({Name = "BossHealthBarFill", Group = "Combat_UI", X = xOffset , Y = 72 + yOffset})

		local fallOffBar = CreateScreenObstacle({Name = "BossHealthBarFillFalloff", Group = "Combat_UI_Backing", X = xOffset , Y = 72 + yOffset})

		SetColor({ Id = fallOffBar, Color = Color.HealthFalloff })
		SetAnimationFrameTarget({ Name = "EnemyHealthBarFillSlowBoss", Fraction = 0, DestinationId = fallOffBar, Instant = true })

		CreateAnimation({ Name = "BossNameShadow", DestinationId = ScreenAnchors.BossHealthBack })

		SetScaleX({ Ids = { ScreenAnchors.BossHealthBack, ScreenAnchors.BossHealthFill, fallOffBar }, Fraction = xScale, Duration = 0 })

		local bossName = boss.HealthBarTextId or boss.Name

		if boss.AltHealthBarTextIds ~= nil then
			local eligibleTextIds = {}
			for k, altTextIdData in pairs(boss.AltHealthBarTextIds) do
				if IsGameStateEligible( CurrentRun, altTextIdData.Requirements) then
					table.insert(eligibleTextIds, altTextIdData.TextId)
				end
			end
			if not IsEmpty(eligibleTextIds) then
				bossName = GetRandomValue(eligibleTextIds)
			end
		end

		CreateTextBox({ Id = ScreenAnchors.BossHealthBack, Text = bossName,
				Font = "CaesarDressing", FontSize = 22, ShadowRed = 0, ShadowBlue = 0, ShadowGreen = 0,
				OutlineColor = {0, 0, 0, 1}, OutlineThickness = 2,
				ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 3, ShadowOffsetX = 0, Justification = "Center", OffsetY = -30,
				OpacityWithOwner = false,
				AutoSetDataProperties = true,
				})
		--Mod start
		boss.NumericHealthbar = CreateScreenObstacle({Name = "BlankObstacle", Group = "Combat_UI_Backing", X = xOffset, Y = 112 + yOffset})
		CreateTextBox({ Id = boss.NumericHealthbar, Text = boss.Health.."/"..boss.MaxHealth,
				FontSize = 18, ShadowRed = 0, ShadowBlue = 0, ShadowGreen = 0,
				OutlineColor = {0, 0, 0, 1}, OutlineThickness = 2,
				ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 3, ShadowOffsetX = 0, Justification = "Center", OffsetY = 0,
				OpacityWithOwner = false,
				AutoSetDataProperties = true,
				})
		--Mod end

		ModifyTextBox({ Id = ScreenAnchors.BossHealthBack, FadeTarget = 0, FadeDuration = 0 })
		SetAlpha({ Id = ScreenAnchors.BossHealthBack, Fraction = 0.01, Duration = 0.0 })
		SetAlpha({ Id = ScreenAnchors.BossHealthBack, Fraction = boss.Health / boss.MaxHealth, Duration = 2.0 })
		EnemyHealthDisplayAnchors[boss.ObjectId.."back"] = ScreenAnchors.BossHealthBack

		boss.HealthBarFill = "EnemyHealthBarFillBoss"
		SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = boss.Health / boss.MaxHealth, DestinationId = screenId })
		SetAlpha({ Ids = { ScreenAnchors.BossHealthFill, fallOffBar }, Fraction = 0.01, Duration = 0.0 })
		SetAlpha({ Ids = { ScreenAnchors.BossHealthFill, fallOffBar }, Fraction = 1, Duration = 2.0 })
		EnemyHealthDisplayAnchors[boss.ObjectId] = ScreenAnchors.BossHealthFill
		EnemyHealthDisplayAnchors[boss.ObjectId.."falloff"] = fallOffBar
		--Mod start
		EnemyHealthDisplayAnchors[boss.ObjectId.."numeric"] = boss.NumericHealthbar
		--Mod end


		thread( BossHealthBarPresentation, boss )
	end

	function UpdateHealthBarReal( args )

		local enemy = args[1]
		local screenId = args[2]
		local backingScreenId = EnemyHealthDisplayAnchors[enemy.ObjectId.."falloff"]
		--Mod start
		local numericHealthBar = EnemyHealthDisplayAnchors[enemy.ObjectId.."numeric"]
		--Mod end

		if enemy.IsDead then
			SetAnimationFrameTarget({ Name = "EnemyHealthBarFillSlow", Fraction = 1, DestinationId = EnemyHealthDisplayAnchors[enemy.ObjectId .. "falloff"] })
			SetAnimationFrameTarget({ Name = enemy.HealthBarFill or "EnemyHealthBarFill", Fraction = 1, DestinationId = screenId, Instant = true })
			--Mod start
			if numericHealthBar ~= nil then
				Destroy({Id = numericHealthBar})
			end
			--Mod end
			return
		end

		local maxHealth = enemy.MaxHealth
		local currentHealth = enemy.Health
		if currentHealth == nil then
			--Mod start
			if numericHealthBar ~= nil then
				Destroy({Id = numericHealthBar})
			end
			--Mod end
			return
		end

		UpdateHealthBarIcons( enemy )

		if enemy.UseBossHealthBar then
			SetAnimationFrameTarget({ Name = enemy.HealthBarFill or "EnemyHealthBarFill", Fraction = 1 - ( currentHealth / maxHealth ), DestinationId = screenId, Instant = true  })
			--Mod start
			ModifyTextBox({Id = numericHealthBar, Text = currentHealth.."/"..maxHealth})
			--Mod end
			if enemy.HitShields > 0 then
				SetColor({ Id = screenId, Color = Color.HitShield})
			else
				SetColor({ Id = screenId, Color = Color.Red })
			end
			thread( UpdateBossHealthBarFalloff, enemy, newBar )
			return
		end

		local displayedHealthPercent = 1

		if enemy.CursedHealthBarEffect then
			if enemy.HitShields ~= nil and enemy.HitShields > 0 then
				SetColor({ Id = screenId, Color = Color.CurseHitShield })
			elseif enemy.HealthBuffer ~= nil and enemy.HealthBuffer > 0 then
				SetColor({ Id = screenId, Color = Color.CurseHealthBuffer })
			else
				SetColor({ Id = screenId, Color = Color.CurseHealth })
			end
			SetColor({ Id = backingScreenId, Color = Color.CurseFalloff })
		elseif enemy.Charmed then
			SetColor({ Id = screenId, Color = Color.CharmHealth })
			SetColor({ Id = backingScreenId, Color = Color.HealthBufferFalloff })
		else
			if enemy.HitShields ~= nil and enemy.HitShields > 0 then
				SetColor({ Id = screenId, Color = Color.HitShield })
			elseif enemy.HealthBuffer ~= nil and enemy.HealthBuffer > 0 then
				SetColor({ Id = screenId, Color = Color.HealthBuffer })
				SetColor({ Id = backingScreenId, Color = Color.HealthBufferFalloff })
			else
				SetColor({ Id = screenId, Color = Color.Red })
				SetColor({ Id = backingScreenId, Color = Color.HealthFalloff })
			end
		end

		if enemy.HitShields ~= nil and enemy.HitShields > 0 then
			displayedHealthPercent = 1
		elseif enemy.HealthBuffer ~= nil and enemy.HealthBuffer > 0 then
			displayedHealthPercent = enemy.HealthBuffer / enemy.MaxHealthBuffer
		else
			displayedHealthPercent = currentHealth / maxHealth
		end

		local newBar = false
		if enemy.DisplayedHealthFraction < displayedHealthPercent then
			newBar = true
		end

		enemy.DisplayedHealthFraction = displayedHealthPercent
		SetAnimationFrameTarget({ Name = enemy.HealthBarFill or "EnemyHealthBarFill", Fraction = 1 - displayedHealthPercent, DestinationId = screenId, Instant = true })
		thread( UpdateEnemyHealthBarFalloff, enemy, newBar )
	end

	ModUtil.WrapBaseFunction( "BossChillKillPresentation", function(baseFunc, unit)
		-- local numericHealthBar = EnemyHealthDisplayAnchors[unit.ObjectId.."numeric"]
		if EnemyHealthDisplayAnchors[unit.ObjectId.."numeric"] ~= nil then
			Destroy({Id = numericHealthBar})
		end
        return baseFunc(unit)
	end)
end

if PQOL.Config.CompleteAllBounties.Enabled then
	--Complete all bounties

	function CompleteAllAvailableBounties()
		if GameState.SpentShrinePointsCache ~= nil and GameState.RecordClearedShrineThreshold ~= nil then
			DebugPrint({Text="@PonyQOL Trying to complete all bounties!"})
			local activeShrinePoints = GameState.SpentShrinePointsCache - 1
			local weaponName = GetEquippedWeapon()
			local roomName = CurrentRun.CurrentRoom.GenusName or CurrentRun.CurrentRoom.Name
			if weaponName == nil
				or roomName == nil
				or GameState.RecordClearedShrineThreshold[weaponName] == nil
				or GameState.RecordClearedShrineThreshold[weaponName][roomName] == nil
				or activeShrinePoints <= GameState.RecordClearedShrineThreshold[weaponName][roomName]
				then
				return
			end
			while activeShrinePoints > GameState.RecordClearedShrineThreshold[weaponName][roomName] do
				local consumableName = GetRandomValue(RewardStoreData.SuperMetaProgress)
				local offsetY = RandomInt(0, 100)
				local offsetX = RandomInt(0, 100)
				local consumableId = SpawnObstacle({ Name = consumableName.Name, DestinationId = CurrentRun.Hero.ObjectId, Group = "Standing", OffsetX = offsetX, OffsetY = offsetY })
				local consumable = CreateConsumableItem( consumableId, consumableName.Name, 0 )

				GameState.RecordClearedShrineThreshold[weaponName][roomName] = GetLastRoomClearedShrinePointThreshold( weaponName, roomName ) + ShrineClearData.ClearThreshold
				GameState.RecordLastClearedShrineReward[weaponName][roomName][GetLastRoomClearedShrinePointThreshold( weaponName, roomName )] = consumableName.Name
				wait(0.1)
			end
		end
	end
else
	function CompleteAllAvailableBounties()
		-- do nothing
	end
end

if PQOL.Config.PostBossWeaponSelect.Enabled then
	--Add swappable weapons to post boss rooms
	table.insert(RoomSetData.Tartarus.A_PostBoss01.ThreadedEvents,
	{
		FunctionName = "AssignWeaponKits",
		Args =
		{
			PreLoadBinks = true,
			BinkCacheOverrides =
			{
				SpearWeapon = "WeaponCache",
			}
		},
	})
	table.insert(RoomSetData.Asphodel.B_PostBoss01.ThreadedEvents,
	{
		FunctionName = "AssignWeaponKits",
		Args =
		{
			PreLoadBinks = true,
			BinkCacheOverrides =
			{
				SpearWeapon = "WeaponCache",
			}
		},
	})
	table.insert(RoomSetData.Elysium.C_PostBoss01.ThreadedEvents,
	{
		FunctionName = "AssignWeaponKits",
		Args =
		{
			PreLoadBinks = true,
			BinkCacheOverrides =
			{
				SpearWeapon = "WeaponCache",
			}
		},
	})
	ModUtil.WrapBaseFunction( "AssignWeaponKits", function(baseFunc, eventSource, args)
		if string.match(eventSource.Name, "PostBoss") then
			local kits = {}
			local offsetX = 1000
			local offsetY = -150
			local incrementX = 150
			local incrementY = -50
			if eventSource.Flipped then
				offsetX = -1000
				offsetY = -150
				incrementX = -150
				incrementY = -50
			end
			for i=6, 0, -1 do
				local key = "Key"..i
				kits[key] = SpawnObstacle({ Name = "WeaponKit01", Group = "FX_Terrain", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = offsetX, OffsetY = offsetY })
				SetScale({ Id = kits[key], Fraction = 0.1 })
				offsetX = offsetX + incrementX
				offsetY = offsetY + incrementY
			end
		end
		return baseFunc(eventSource, args)
	end)
end

if PQOL.Config.BloodRefund.Enabled then
	--Add refund button to weapon select screen
	function ShowWeaponUpgradeScreen( args )

		local textOffsetX = -50

		OnScreenOpened( { Flag = "WeaponUpgradeScreen", PersistCombatUI = true } )
		FreezePlayerUnit("WeaponUpgradeScreen" )
		EnableShopGamepadCursor()

		local weaponName = args.WeaponName

		ScreenAnchors.WeaponUpgradeScreen = { Components = {}, Name = "WeaponUpgradeScreen", OpenedEquippedIndex = GetEquippedWeaponTraitIndex( weaponName ) }
		local components = ScreenAnchors.WeaponUpgradeScreen.Components
		EnableShopGamepadCursor( ScreenAnchors.WeaponUpgradeScreen.Name )

		components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
		components.ShopBackground = CreateScreenComponent({ Name = "WeaponSelectPanelBox", Group = "Combat_Menu_TraitTray_Backing", X = ScreenCenterX, Y = ScreenHeight/2 - 18})
		components.WeaponImage = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu_TraitTray", X = 335, Y = 435 })
		DebugAssert({ Condition = GetWeaponAspectImage( weaponName ) ~= nil, Text = "No weapon image available for " .. weaponName .. " index " .. GetEquippedWeaponTraitIndex( weaponName )})
		SetAnimation({ DestinationId = components.WeaponImage.Id, Name = GetWeaponAspectImage( weaponName )})

		SetAlpha({ Id = components.WeaponImage.Id, Fraction = 0 })
		SetThingProperty({ Property = "Ambient", Value = 0.0, DestinationId = components.WeaponImage.Id })


		-- CreateTextBox({ Id = components.ShopBackground.Id, Text = "WeaponUpgradeScreen_Header", FontSize = 24, OffsetX = -500, OffsetY = -380, Color = Color.White, Font = "AlegreyaSansSCRegular", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })
		CreateTextBox({ Id = components.ShopBackground.Id, Text = weaponName.."_Full", FontSize = 38, OffsetX = 0, OffsetY = -480, Color = Color.White, Font = "SpectralSCLightTitling", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center" })
		CreateTextBox({ Id = components.ShopBackground.Id, Text = weaponName.."_Full", UseDescription = true, FontSize = 20, Width = 620, OffsetX = 0, OffsetY = -406, Color = {0.643, 0.635, 0.482, 1.0}, Font = "CrimsonTextItalic", ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 2}, Justification = "Center" })
		SetScale({ Id = components.ShopBackgroundDim.Id, Fraction = 10 })
		SetColor({ Id = components.ShopBackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.6} })
		wait(0.5)
		local timesCleared = "NoClears"
		local clearTimeText = "NoClearTime"
		local heatClearText = "NoHeatClear"
		local weaponKills = "NoWeaponKills"
		local weaponSelectPanelRightString = "WeaponSelectPanel_Right"

		if GameState.TimesClearedWeapon and GameState.TimesClearedWeapon[weaponName] then
			timesCleared = GameState.TimesClearedWeapon[weaponName]
		end
		if GameState.WeaponRecordsClearTime and GameState.WeaponRecordsClearTime[weaponName] then
			clearTimeText = GetTimerString( GameState.WeaponRecordsClearTime[weaponName])
		end

		if GameState.WeaponRecordsShrinePoints and GameState.WeaponRecordsShrinePoints[weaponName] and GameState.WeaponRecordsShrinePoints[weaponName] > 0 then
			heatClearText = GameState.WeaponRecordsShrinePoints[weaponName]
		else
			weaponSelectPanelRightString = "WeaponSelectPanel_Right_Alt"
		end

		if GameState.WeaponKills and GameState.WeaponKills[weaponName] then
			weaponKills = GameState.WeaponKills[weaponName]
		end

		SetAlpha({ Id = components.WeaponImage.Id, Fraction = 1 })
		local ruScale = 0.75
		local deScale = 0.8
		local cnScale = 0.8
		local plScale = 0.8
		CreateTextBox({ Id = components.ShopBackground.Id, Text = "WeaponSelectPanel_Title", FontSize = 25, Width = 340, OffsetX = -625, OffsetY = 174, Color = {0.749, 0.749, 0.749, 1.0}, Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center", VerticalJustification = "Top", LineSpacingBottom = -5,
			LangPlScaleModifier = plScale
		})
		CreateTextBox({ Id = components.ShopBackground.Id, Text = "WeaponSelectPanel_Left", FontSize = 20, Width = 340, OffsetX = -795, OffsetY = 230, Color = {0.749, 0.749, 0.749, 1.0}, Font = "AlegreyaSansSCRegular", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Left", VerticalJustification = "Top", LineSpacingBottom = -5,

				LangRuScaleModifier = ruScale,
				LangDeScaleModifier = deScale,
				LangCnScaleModifier = cnScale,
				LangPlScaleModifier = plScale,
				})
		CreateTextBox({ Id = components.ShopBackground.Id, Text = weaponSelectPanelRightString, FontSize = 20, Width = 340, OffsetX = -485, OffsetY = 230, Color = {0.749, 0.749, 0.749, 1.0}, Font = "AlegreyaSansSCRegular", ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Right", VerticalJustification = "Top",
			LineSpacingBottom = -5,
			LangRuScaleModifier = ruScale,
			LangDeScaleModifier = deScale,
			LangCnScaleModifier = cnScale,
			LangPlScaleModifier = plScale,
			LuaKey = "TempTextData",
			LuaValue =
			{
				TimesCleared = timesCleared,
				RecordClearTime = clearTimeText,
				RecordShrinePoints = heatClearText,
				WeaponKills = weaponKills,
			}})

		components.CurrentKeys = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
		CreateTextBox({ Id = components.CurrentKeys.Id,
			Text = "MetaUpgrade_Available_SuperKeys",
			FontSize = 24,
			Width = 0,
			OffsetX = 500,
			OffsetY = -400,
			Color = Color.White,
			Font = "AlegreyaSansSCRegular",
			ShadowBlur = 0,
			ShadowColor = {0,0,0,1},
			ShadowOffset={0, 2},
			Justification = "Right",
			LuaKey = "TempTextData",
			LuaValue = { Amount = tostring(GameState.Resources.SuperLockKeys)}
		})

		PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENULoud" })

		thread( PlayVoiceLines, GlobalVoiceLines.OpenedWeaponUpgradeMenuVoiceLines, true )
		--Mod start
		local bloodCost = 0

		for itemIndex, itemData in pairs( WeaponUpgradeData[weaponName] ) do
			local level = GetWeaponUpgradeLevel(weaponName, itemIndex)
			if level > 0 then
				for i=level, 1, -1 do
					bloodCost = bloodCost + itemData.Costs[i]
				end
			end
			--Mod end
			local purchaseButtonKey = "PurchaseButton"..itemIndex
			local animationName = "BoonSlot" .. itemIndex .. "_WeaponSelect"
			if IsBuyWeaponUpgradeDisabled( weaponName, itemIndex ) and IsUpgradeWeaponUpgradeDisabled( weaponName, itemIndex ) then
				animationName = "BoonSlot4_WeaponSelect"
			end
			components[purchaseButtonKey] = CreateScreenComponent({ Name = animationName, Group = "Combat_Menu_TraitTray", X = ScreenCenterX + 40, Y = 20 + itemIndex * 220})
			SetScaleX({ Id = components[purchaseButtonKey].Id, Fraction = 1 })
			SetInteractProperty({ DestinationId = components[purchaseButtonKey].Id, Property = "TooltipOffsetX", Value = 700})

			-- Upgrade description
			local itemName = "UnknownUpgrade"
			local itemIcon = "WeaponUpgrade_Unknown"
			local traitData = {}
			if itemData.DisableBuy then
				itemName = itemData.LockedUpgradeId or "UnknownUpgrade"
				itemIcon = "WeaponUpgrade_Unknown"
			elseif itemData.GameStateRequirements and ( not IsGameStateEligible(CurrentRun, itemData.GameStateRequirements) or IsGameStateEligible(CurrentRun, itemData.GameStateRequirements) and not GameState.SeenWeaponUnlocks[weaponName..itemIndex]) then
				itemName = "UnknownLockedAspect"
				itemIcon = "WeaponUpgrade_Unknown"

				if IsGameStateEligible(CurrentRun, itemData.GameStateRequirements) and not GameState.SeenWeaponUnlocks[weaponName..itemIndex] then
					thread( WeaponAspectRevealPresentation, components, itemData.TraitName, purchaseButtonKey)
					GameState.SeenWeaponUnlocks[weaponName..itemIndex] = true
				end
			elseif itemData.TraitName == nil then
				if itemData.RequiredInvestmentTraitName then
					itemName = itemData.RequiredInvestmentTraitName
					itemIcon = TraitData[itemName].Icon .. "_Large"
					if GetWeaponUpgradeLevel(weaponName, itemIndex) > 0  then
						traitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemName, Rarity = GetRarityKey(GetWeaponUpgradeLevel( weaponName, itemIndex ))})
						SetTraitTextData( traitData )
					else
						itemName = itemData.UpgradeUnequippedId
					end
				else
					itemName = itemData.UpgradeUnequippedId or "NothingEquipped"
					itemIcon = "WeaponUpgrade_Unknown"
				end
			else
				itemName = itemData.TraitName
				itemIcon = TraitData[itemName].Icon .. "_Large"
				traitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemName, Rarity = GetRarityKey(GetWeaponUpgradeLevel( weaponName, itemIndex ))})
				SetTraitTextData( traitData )

				if itemData.MaxedTraitDescription and IsWeaponUpgradeUnlocked( weaponName, itemIndex ) and not CanUpgradeWeaponUpgrade( weaponName, itemIndex ) then
					itemName = itemData.MaxedTraitDescription
				end
			end

			components[purchaseButtonKey.."Icon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
			Attach({ Id = components[purchaseButtonKey.."Icon"].Id, DestinationId = components[purchaseButtonKey].Id, OffsetX = 365 - 750, OffsetY = 0 })
			SetAnimation({ DestinationId = components[purchaseButtonKey.."Icon"].Id, Name = itemIcon })
			if itemIcon ~= "WeaponUpgrade_Unknown" then
				SetScale({ Id = components[purchaseButtonKey.."Icon"].Id, Fraction = 1.0 })
			end

			CreateTextBoxWithFormat({ Id = components[purchaseButtonKey].Id,
				Text = itemName,
				OffsetX = 465 - 700 + textOffsetX, OffsetY = -35,
				Width = 665,
				Justification = "Left",
				VerticalJustification = "Top",
				LineSpacingBottom = 5,
				UseDescription = true,
				Format = "BaseFormat",
				VariableAutoFormat = "BoldFormatGraft",
				TextSymbolScale = 0.8,
				LuaKey = "TooltipData",
				LuaValue = traitData,
				LangCnScaleModifier = 0.8,
				LangRuScaleModifier = 0.8,
				LangDeScaleModifier = 0.8,
				LangEsScaleModifier = 0.75,
				LangFrScaleModifier = 0.8,
				LangPtBrScaleModifier = 0.8,
				--LangPlScaleModifier = 0.8,
				LangItScaleModifier = 0.8,
				LangKoScaleModifier = 0.7,
			})

			if traitData and traitData.LimitedTime then
				CreateTextBox({ Id = components[purchaseButtonKey].Id, TextSymbolScale = 0, Text = "SeasonalItem", Color = Color.Transparent })
			end

			components[purchaseButtonKey.."Frame"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
			Attach({ Id = components[purchaseButtonKey.."Frame"].Id, DestinationId = components[purchaseButtonKey.."Icon"].Id, OffsetX = 0, OffsetY = 0 })
			SetAnimation({ DestinationId = components[purchaseButtonKey.."Frame"].Id, Name = "Frame_Boon_Menu_Enchantment" })
			SetScale({ Id = components[purchaseButtonKey.."Frame"].Id, Fraction = 1.0 })

			components[purchaseButtonKey].OnPressedFunctionName = "HandleWeaponUpgradeSelection"
			components[purchaseButtonKey].UpgradeButtonKey = purchaseButtonKey .. "Upgrade"
			components[purchaseButtonKey].WeaponName = weaponName
			components[purchaseButtonKey].Data = itemData
			components[purchaseButtonKey].Index = itemIndex

			components[purchaseButtonKey.."Subtitle"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
			Attach({ Id = components[purchaseButtonKey.."Subtitle"].Id, DestinationId = components[purchaseButtonKey.."Icon"].Id, OffsetX = 710, OffsetY = 33 })
			CreateTextBox({ Id = components[purchaseButtonKey.."Subtitle"].Id,
				FontSize = 24,
				Width = 0,
				OffsetX =  0,
				OffsetY = 0,
				Color = Color.White,
				Font = "AlegreyaSansSCRegular",
				ShadowBlur = 0,
				ShadowColor = {0,0,0,1},
				ShadowOffset={0, 2},
				Justification = "Right",
				LuaKey = "TempTextData",
				LuaValue = { Amount = GetNextWeaponUpgradeKeyCost( weaponName, itemIndex )}})

			components[purchaseButtonKey .. "Title"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
			Attach({ Id = components[purchaseButtonKey.."Title"].Id, DestinationId = components[purchaseButtonKey].Id, OffsetX = textOffsetX, OffsetY = 0 })

			CreateTextBox({ Id = components[purchaseButtonKey .. "Title"].Id,
				Text = itemName,
				FontSize = 25,
				OffsetX = 465 - 700, OffsetY = -78,
				Width = 615,
				Color = Color.White,
				Font = "AlegreyaSansSCBold",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
				Justification = "Left",
				VerticalJustification = "Top"
			})

			components[purchaseButtonKey .. "Level"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
			Attach({ Id = components[purchaseButtonKey.."Level"].Id, DestinationId = components[purchaseButtonKey.."Title"].Id, OffsetX = 0, OffsetY = -75 })

			CreateTextBox({ Id = components[purchaseButtonKey .. "Level"].Id,
				FontSize = 25,
				OffsetX = 400, OffsetY = 0,
				Width = 615,
				Color = Color.White,
				Font = "AlegreyaSansSCBold",
				ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
				Justification = "Right",
				VerticalJustification = "Top",
				LuaKey = "TempTextData",
				LuaValue = { Amount = GetWeaponUpgradeLevel(weaponName, itemIndex )}})

			-- LOCK Icons
			local lockIconKey = "LockIcon"..itemIndex
			components[lockIconKey] = CreateScreenComponent({ Name = "BlankObstacle", X = ScreenCenterX, Y = 0, Group = "Combat_Menu_TraitTray" })
			Attach({ Id = components[lockIconKey].Id, DestinationId = components[purchaseButtonKey].Id, OffsetX = 365 - 753, OffsetY = -5 })
			if not IsWeaponUpgradeUnlocked( weaponName, itemIndex ) then
				SetColor({ Id = components[purchaseButtonKey.."Icon"].Id, Color = Color.DarkSlateGray })
				SetAnimation({ Name = "LockedKeepsakeIcon", DestinationId = components[lockIconKey].Id, Scale = 1.0 })
			end

			if IsWeaponUpgradeEquipped( weaponName, itemIndex ) then
				SetAnimation({ Name = "EquippedIcon", DestinationId = components[purchaseButtonKey.."Subtitle"].Id })
				TeleportCursor({ OffsetX = ScreenCenterX + 40, OffsetY = 20 + itemIndex * 220, ForceUseCheck = true })
			end

			if not IsUpgradeWeaponUpgradeDisabled( weaponName, itemIndex ) then
				if IsWeaponUpgradeUnlocked( weaponName, itemIndex ) then
					components[purchaseButtonKey .. "Upgrade" ] = CreateScreenComponent({ Name = "WeaponLevelUpArrowRight", Scale = 1.0, Group = "Combat_Menu_TraitTray" })
				else
					components[purchaseButtonKey .. "Upgrade" ] = CreateScreenComponent({ Name = "WeaponUnlockRight", Scale = 1.0, Group = "Combat_Menu_TraitTray" })
				end
				Attach({ Id = components[purchaseButtonKey .. "Upgrade"].Id, DestinationId = components[purchaseButtonKey].Id, OffsetX = 440, OffsetY = -5})
				components[purchaseButtonKey.. "Upgrade"].OnPressedFunctionName = "HandleUpgradeWeaponUpgradeSelection"
				components[purchaseButtonKey.. "Upgrade"].WeaponName = weaponName
				components[purchaseButtonKey.. "Upgrade"].Data = itemData
				components[purchaseButtonKey.. "Upgrade"].Index = itemIndex
				components[purchaseButtonKey.. "Upgrade"].Name = itemName
				components[purchaseButtonKey.."KeyCost"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
				Attach({ Id = components[purchaseButtonKey.."KeyCost"].Id, DestinationId = components[purchaseButtonKey.."Upgrade"].Id, OffsetX = 0, OffsetY = 0 })
				local text = "MetaUpgrade_Locked_SuperKeys"
				local color = Color.White
				if not CanUpgradeWeaponUpgrade( weaponName, itemIndex ) then
					text = "Blank"
					SetColor({ Id = components[purchaseButtonKey.."KeyCost"].Id, Color = Color.DarkSlateGray })
					UseableOff({ Id = components[purchaseButtonKey .. "Upgrade"].Id })
				end
				if not HasResource("SuperLockKeys", GetNextWeaponUpgradeKeyCost( weaponName, itemIndex )) then
					color = Color.CostUnaffordable
				end
				SetInteractProperty({ DestinationId = components[purchaseButtonKey.."Upgrade"].Id, Property = "TooltipOffsetX", Value = 260})
				SetInteractProperty({ DestinationId = components[purchaseButtonKey.."Upgrade"].Id, Property = "TooltipOffsetY", Value = 5})
				CreateTextBox({ Id = components[purchaseButtonKey.. "Upgrade"].Id,
					Text = itemName,
					FontSize = 1,
					UseDescription = true,
					OffsetX = 1000, OffsetY = 0,
					Justification = "LEFT",
					Color = Color.Transparent,
					LuaKey = "TooltipData",
					LuaValue = traitData,
					ScaleTarget = 0.01,
					ScaleDuration = 0,
				})
				CreateTextBox({ Id = components[purchaseButtonKey.."KeyCost"].Id,
					Text = text,
					FontSize = 24,
					Width = 0,
					OffsetX = -4,
					OffsetY = 30,
					Color = color,
					Font = "AlegreyaSansSCBold",
					ShadowBlur = 0,
					ShadowColor = {0,0,0,1},
					ShadowOffset={0, 2},
					Justification = "Center",
					LuaKey = "TempTextData",
					LuaValue = { Amount = GetNextWeaponUpgradeKeyCost( weaponName, itemIndex ) } })

				if not CanUpgradeWeaponUpgrade( weaponName, itemIndex ) then
					ModifyTextBox({ Id = components[purchaseButtonKey.."Level"].Id, Text = "UI_TraitLevel_Max" })
				elseif GetWeaponUpgradeLevel(weaponName, itemIndex ) > 0 then
					ModifyTextBox({ Id = components[purchaseButtonKey.."Level"].Id, Text = "UI_TraitLevel", LuaKey = "TempTextData", LuaValue = { Amount = GetWeaponUpgradeLevel(weaponName, itemIndex )} })
				end
			end

			wait(0.02)
		end

		--Mod start
		local amount = bloodCost * PQOL.Config.BloodRefund.KeyCostPerBloodRefunded
		if PQOL.Config.BloodRefund.EasyMode then
			amount = 0
		end
		components.RefundButton = CreateScreenComponent({ Name = "ButtonRefund", Scale = 1, Group = "Combat_Menu_TraitTray" })
		Attach({ Id = components.RefundButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 630, OffsetY = -380 })
		components.RefundButton.OnPressedFunctionName = "RefundBlood"
		components.RefundButton.Cost = bloodCost
		components.RefundButton.KeyCost = amount
		components.RefundButton.Weapon = weaponName

		local color = Color.White
		if not PQOL.Config.BloodRefund.FreeMode or bloodCost == 0 then
			if not HasResource("LockKeys", bloodCost * PQOL.Config.BloodRefund.KeyCostPerBloodRefunded) or bloodCost == 0 then
				color = Color.CostUnaffordable
			end
		end

		CreateTextBox({ Id = components.RefundButton.Id, Text = "WeaponUpgrade_Refund", FontSize = 22, Color = color, Font = "AlegreyaSansSCBold",
		OffsetX = 35, LuaKey = "TempTextData", LuaValue = { Amount = bloodCost}, })
		if not PQOL.Config.BloodRefund.FreeMode then
			CreateTextBox({ Id = components.RefundButton.Id, Text = "WeaponUpgrade_Key_Cost", FontSize = 19, Color = color, Font = "AlegreyaSansSCBold",
			OffsetX = 35, OffsetY = 45, LuaKey = "TempTextData", LuaValue = { Amount = amount}, })
		end
		--Mod end

		components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu_TraitTray_Overlay" })
		Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0 , OffsetY = 515 })
		components.CloseButton.OnPressedFunctionName = "CloseWeaponUpgradeScreen"
		components.CloseButton.ControlHotkey = "Cancel"

		ScreenAnchors.WeaponUpgradeScreen.KeepOpen = true
		ScreenAnchors.WeaponUpgradeScreen.CanClose = true
		thread( HandleWASDInput, ScreenAnchors.WeaponUpgradeScreen )
		HandleScreenInput( ScreenAnchors.WeaponUpgradeScreen )
	end

	function RefundBlood(screen, button)
		local weaponName = button.Weapon
		local bloodCost = button.Cost
		local keyCost = button.KeyCost
		if bloodCost > 0 and HasResource("LockKeys", keyCost) then
			for itemIndex, itemData in pairs(WeaponUpgradeData[weaponName]) do
				GameState.WeaponUnlocks[weaponName][itemIndex] = 0
			end
			SelectWeaponUpgrade( screen, weaponName, 1 )
			CloseWeaponUpgradeScreen(screen, button)
			AddResource("SuperLockKeys", bloodCost, "Item")
			if not PQOL.Config.BloodRefund.FreeMode then
				SpendResource("LockKeys", keyCost, "Item")
			end
		end
	end
end

if PQOL.Config.GodKeepsakes.Enabled then
	--Reset the uses of god keepsakes after beating a boss
	table.insert(RoomSetData.Tartarus.A_PostBoss01.ThreadedEvents,
	{
		FunctionName = "ResetGodKeepsakeUses",
	})
	table.insert(RoomSetData.Asphodel.B_PostBoss01.ThreadedEvents,
	{
		FunctionName = "ResetGodKeepsakeUses",
	})
	table.insert(RoomSetData.Elysium.C_PostBoss01.ThreadedEvents,
	{
		FunctionName = "ResetGodKeepsakeUses",
	})
	function ResetGodKeepsakeUses()
		for i, traitData in pairs(CurrentRun.Hero.Traits) do
			if traitData.Name == GameState.LastAwardTrait and traitData.ForceBoonName ~= nil then
				traitData.Uses = traitData.Uses + 1
			end
		end
	end
end

if PQOL.Config.CustomPerRunLoot.Enabled then
	if PQOL.Config.CustomPerRunLoot.HammerCap ~= 2 then
		local newCap = PQOL.Config.CustomPerRunLoot.HammerCap
		if newCap > 2 then
			for i, loot in pairs(RewardStoreData.RunProgress) do
				if loot.Name == "WeaponUpgrade" and loot.GameStateRequirements.RequiredFalseConsumablesThisRun == nil then
					loot.RequiredMaxWeaponUpgrades = newCap - 1
					break
				end
			end
		elseif newCap == 1 then
			for i, loot in pairs(RewardStoreData.RunProgress) do
				if loot.Name == "WeaponUpgrade" and loot.GameStateRequirements.RequiredFalseConsumablesThisRun then
					RewardStoreData.RunProgress[i] = nil
					break
				end
			end
		elseif newCap == 0 then
			for i, loot in pairs(RewardStoreData.RunProgress) do
				if loot.Name == "WeaponUpgrade" then
					RewardStoreData.RunProgress[i] = nil
				end
			end
		end
	end

	if PQOL.Config.CustomPerRunLoot.HermesCap ~= 2 then
		local newCap = PQOL.Config.CustomPerRunLoot.HermesCap
		if newCap > 2 then
			for i, loot in pairs(RewardStoreData.RunProgress) do
				if loot.Name == "HermesUpgrade" then
					loot.RequiredMaxHermesUpgrades = newCap - 1
					break
				end
			end
		elseif newCap == 1 then
			for i, loot in pairs(RewardStoreData.RunProgress) do
				if loot.Name == "HermesUpgrade" then
					loot.RequiredMaxHermesUpgrades = 0
					break
				end
			end
		elseif newCap == 0 then
			for i, loot in pairs(RewardStoreData.RunProgress) do
				if loot.Name == "HermesUpgrade" then
					RewardStoreData.RunProgress[i] = nil
				end
			end
		end
	end

	if PQOL.Config.CustomPerRunLoot.GodCap ~= 4 then
		function ReachedMaxGods( excludedGods )
			excludedGods = excludedGods or {}
			--Mod start
			local maxLootTypes = 4
			if PQOL.Config.CustomPerRunLoot.GodCap < 1 then
				maxLootTypes = 1
			elseif PQOL.Config.CustomPerRunLoot.GodCap > 8 then
				maxLootTypes = 8
			else
				maxLootTypes = PQOL.Config.CustomPerRunLoot.GodCap
			end
			--Mod end
			local gods = ShallowCopyTable( excludedGods )
			for i, godName in pairs(GetInteractedGodsThisRun()) do
				if not Contains( gods, godName ) then
					table.insert( gods, godName )
				end
			end
			return TableLength( gods ) >= maxLootTypes
		end
	end
end

if PQOL.Config.AlwaysEncounterStoryRooms.Enabled then
	RoomSetData.Tartarus.A_Story01.ForceAtBiomeDepthMin = 1
	RoomSetData.Tartarus.A_Story01.ForceAtBiomeDepthMax = 10

	RoomSetData.Asphodel.B_Story01.ForceAtBiomeDepthMin = 1
	RoomSetData.Asphodel.B_Story01.ForceAtBiomeDepthMax = 10

	RoomSetData.Elysium.C_Story01.ForceAtBiomeDepthMin = 1
	RoomSetData.Elysium.C_Story01.ForceAtBiomeDepthMax = 10
end

if PQOL.Config.PoolOfPurging.Enabled then
	-- Add boon levels to pool of purging
	-- Add warnings when opening pool of purging with pauper curse
	local baseCreateSellButtons = CreateSellButtons
	function CreateSellButtons()

		local itemLocationY = 370
		local itemLocationX = ScreenCenterX - 355
		local firstOption = true
		local buttonOffsetX = 350
		local components = ScreenAnchors.SellTraitScreen.Components
		local sellList = {}
		local upgradeOptionsTable = {}
		for itemIndex, sellData in pairs( CurrentRun.CurrentRoom.SellOptions ) do
			for index, traitData in pairs (CurrentRun.Hero.Traits) do
				if sellData.Name == traitData.Name and traitData.Rarity and ( upgradeOptionsTable[traitData.Name] == nil or GetRarityValue(upgradeOptionsTable[traitData.Name].Rarity) > GetRarityValue(traitData.Rarity) ) then
					upgradeOptionsTable[traitData.Name] = { Data = traitData, Value = sellData.Value }
				end
			end
		end

		for i, value in pairs(upgradeOptionsTable) do
			table.insert( sellList, value )
		end

		for itemIndex, sellData in pairs( sellList ) do
			local itemData = sellData.Data
			if itemData ~= nil then
				local itemBackingKey = "Backing"..itemIndex
				components[itemBackingKey] = CreateScreenComponent({ Name = "TraitBacking", Group = "Combat_Menu", X = ScreenCenterX, Y = itemLocationY })
				SetScaleY({ Id = components[itemBackingKey].Id, Fraction = 1.25 })
				local upgradeData = nil
				local upgradeTitle = nil
				local upgradeDescription = nil
				local upgradeData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.Name, Rarity = itemData.Rarity })
				local tooltipData = upgradeData
				SetTraitTextData( tooltipData, { OldOnly = true })
				upgradeTitle = GetTraitTooltipTitle( upgradeData )
				upgradeDescription = GetTraitTooltip( upgradeData, { ForTraitTray = true, Initial = true })
				-- Setting button graphic based on boon type
				local purchaseButtonKey = "PurchaseButton"..itemIndex

				local iconOffsetX = -338
				local iconOffsetY = -2
				local exchangeIconPrefix = nil
				local overlayLayer = "Combat_Menu_Overlay"

				components[purchaseButtonKey] = CreateScreenComponent({ Name = "SellSlot"..itemIndex, Group = "Combat_Menu", Scale = 1, X = itemLocationX + buttonOffsetX, Y = itemLocationY })
				if upgradeData.CustomRarityColor then
					components[purchaseButtonKey.."Patch"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = iconOffsetX + itemLocationX + buttonOffsetX + 35, Y = iconOffsetY + itemLocationY })
					SetAnimation({ DestinationId = components[purchaseButtonKey.."Patch"].Id, Name = "BoonRarityPatch"})
					SetColor({ Id = components[purchaseButtonKey.."Patch"].Id, Color = upgradeData.CustomRarityColor })
				elseif itemData.Rarity ~= "Common" and itemData.Rarity then
					components[purchaseButtonKey.."Patch"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = iconOffsetX + itemLocationX + buttonOffsetX + 35, Y = iconOffsetY + itemLocationY })
					SetAnimation({ DestinationId = components[purchaseButtonKey.."Patch"].Id, Name = "BoonRarityPatch"})
					SetColor({ Id = components[purchaseButtonKey.."Patch"].Id, Color = Color["BoonPatch" .. itemData.Rarity] })
				end

				if upgradeData.Icon ~= nil then
					components[purchaseButtonKey.."Icon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = iconOffsetX + itemLocationX + buttonOffsetX, Y = iconOffsetY + itemLocationY })
					SetAnimation({ DestinationId = components[purchaseButtonKey.."Icon"].Id, Name = upgradeData.Icon .. "_Large" })
					SetScale({ DestinationId = components[purchaseButtonKey.."Icon"].Id, Fraction = 0.85 })
					--mod start
					local traitCount = GetTraitCount(CurrentRun.Hero, itemData)
					if traitCount > 1 then
						components[purchaseButtonKey.."LevelBacking"] = CreateScreenComponent({ Name = "TraitTray_LevelBacking", Group = "Combat_Menu_Overlay"})
						Attach({ Id = components[purchaseButtonKey.."LevelBacking"].Id, DestinationId = components[purchaseButtonKey.."Icon"].Id, OffsetY = 80 })
						SetScale({ Id = components[purchaseButtonKey.."LevelBacking"].Id, Fraction = 1.3 })
						CreateTextBox({ Id = components[purchaseButtonKey.."LevelBacking"].Id, Text = "UI_TraitLevel", Font = "AlegreyaSansSCBold", Color = Color.White, ShadowBlur = 0, ShadowColor = {0,0,0,1},
						ShadowOffset={1, 2}, FontSize = 19, OffsetX = 0, OffsetY = 0 , Justification = "Center", LuaKey = "TempTextData", LuaValue = { Amount = traitCount } })
					end
					--mod end
				end
				components[purchaseButtonKey.."IconOverlay"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_Overlay", X = iconOffsetX + itemLocationX + buttonOffsetX, Y = iconOffsetY + itemLocationY })
				SetAnimation({ DestinationId = components[purchaseButtonKey.."IconOverlay"].Id, Name = "Frame_Sell_Overlay" })
				SetAlpha({ Id = components[purchaseButtonKey.."IconOverlay"].Id, Fraction = 0, Duration = 0 })
				SetScale({ Id = components[purchaseButtonKey.."IconOverlay"].Id, Fraction = 0.85 })

				components[purchaseButtonKey.."Frame"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = iconOffsetX + itemLocationX + buttonOffsetX, Y = iconOffsetY + itemLocationY })
				SetAnimation({ DestinationId = components[purchaseButtonKey.."Frame"].Id, Name = "Frame_Sell"})
				SetScale({ Id = components[purchaseButtonKey.."Frame"].Id, Fraction = 0.85 })

				-- Button data setup
				components[purchaseButtonKey].OnPressedFunctionName = "HandleSellChoiceSelection"
				components[purchaseButtonKey].UpgradeName = upgradeData.Name
				components[purchaseButtonKey].Index = itemIndex
				components[purchaseButtonKey].Rarity = upgradeData.Rarity
				components[purchaseButtonKey].IsDuoBoon = upgradeData.IsDuoBoon
				if HasHeroTraitValue( "BlockMoney" ) then
					components[purchaseButtonKey].Value = 0
				else
					components[purchaseButtonKey].Value = sellData.Value
				end
				components[components[purchaseButtonKey].Id] = purchaseButtonKey
				-- Creates upgrade slot text
				SetInteractProperty({ DestinationId = components[purchaseButtonKey].Id, Property = "TooltipOffsetX", Value = 665 })
				local selectionString = "UpgradeChoiceMenu_PermanentItem"
				local selectionStringColor = Color.Black

				local traitData = TraitData[itemData.Name]
				if traitData.Slot ~= nil then
					selectionString = "UpgradeChoiceMenu_"..traitData.Slot
				end

				local textOffset = 115 - buttonOffsetX
				local exchangeIconOffset = 0
				local lineSpacing = 8
				local traitNameOffset = LocalizationData.SellTraitScripts.UpgradeTitle.TraitNameOffsetX[GetLanguage({})] or 75
				local text = "Boon_Common"
				local overlayLayer = ""
				local color = Color.White
				if itemData.Rarity then
					text = "Boon_"..tostring(itemData.Rarity)
					color = Color["BoonPatch" .. itemData.Rarity ]
					if upgradeData.CustomRarityColor then
						color = upgradeData.CustomRarityColor
					end
				end
				if upgradeData.CustomRarityName then
					text = upgradeData.CustomRarityName
				end
				CreateTextBox(MergeTables(LocalizationData.SellTraitScripts.ShopButton,{
					Id = components[purchaseButtonKey].Id, Text = text,
					FontSize = 25,
					OffsetX = textOffset + 630, OffsetY = -60,
					Width = 720,
					Color = color,
					Font = "AlegreyaSansSCLight",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
					Justification = "Right",
				}))

				CreateTextBox(MergeTables(LocalizationData.SellTraitScripts.ShopButton,{
					Id = components[purchaseButtonKey].Id,
					Text = "SellTraitPrefix",
					FontSize = 20,
					OffsetX = textOffset + exchangeIconOffset, OffsetY = -65,
					Color = Color.CostUnaffordableLight,
					Font = "AlegreyaSansSCRegular",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
					Justification = "Left",
				}))

				CreateTextBox(MergeTables(LocalizationData.SellTraitScripts.ShopButton,{
					Id = components[purchaseButtonKey].Id,
					Text = upgradeTitle,
					FontSize = 25,
					OffsetX = textOffset + exchangeIconOffset + traitNameOffset, OffsetY = -65,
					Color = color,
					Font = "AlegreyaSansSCLight",
					ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
					Justification = "Left",
					LuaKey = "TooltipData", LuaValue = tooltipData,
				}))

				--mod start
				local warningColor = Color.Red
				local fontColor = Color.Gold
				local warningFontSize = 30
				local fontSize = 26

				if components[purchaseButtonKey].Value == 0 then
					fontColor = warningColor
					fontSize = warningFontSize
					components[purchaseButtonKey.."WarningIcon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_Overlay" })
					Attach({ Id = components[purchaseButtonKey.."WarningIcon"].Id, DestinationId = components[purchaseButtonKey].Id, OffsetX = 320 ,OffsetY = 60 })
					SetAnimation({ DestinationId = components[purchaseButtonKey.."WarningIcon"].Id, Name = "StatusIconWantsToFight" })
					SetScale({ DestinationId = components[purchaseButtonKey.."WarningIcon"].Id, Fraction = 0.85 })
				end

				CreateTextBox(MergeTables(LocalizationData.SellTraitScripts.ShopButton,{
					Id = components[purchaseButtonKey].Id, Text = "Sell_ItemCost", TextSymbolScale = 0.6, LuaKey = "TempTextData", LuaValue = { Amount = components[purchaseButtonKey].Value }, FontSize = 24,
					OffsetY = GetLocalizedValue(60, { { Code = "ja", Value = 75}, }),
					OffsetX = 430,
					Color = fontColor,
					Justification = "RIGHT",
					Font="AlegreyaSansSCBold",
					FontSize=fontSize,
					--mod end
					LangJaScaleModifier = 0.85,
					ShadowColor = {0,0,0,1},
					ShadowOffsetY=2,
					ShadowOffsetX=0,
					ShadowAlpha=1,
					ShadowBlur=0,
					OutlineColor={0,0,0,1},
					OutlineThickness=2,
				}))

				CreateTextBoxWithFormat(MergeTables(LocalizationData.SellTraitScripts.ShopButton,{
					Id = components[purchaseButtonKey].Id,
					Text = upgradeDescription,
					OffsetX = textOffset, OffsetY = -40,
					Width = GetLocalizedValue(675, { { Code = "ja", Value = 670 }, }),
					Justification = "Left",
					VerticalJustification = "Top",
					LineSpacingBottom = lineSpacing,
					UseDescription = true,
					LuaKey = "TooltipData", LuaValue = tooltipData,
					Format = "BaseFormat",
					VariableAutoFormat = "BoldFormatGraft",
					TextSymbolScale = 0.8,
				}))

				if firstOption then
					TeleportCursor({ OffsetX = itemLocationX + buttonOffsetX, OffsetY = itemLocationY, ForceUseCheck = true, })
					firstOption = false
				end
			end
			itemLocationY = itemLocationY + 220
		end


		if IsMetaUpgradeSelected("RerollPanelMetaUpgrade") then
			local increment = 0
			if CurrentRun.CurrentRoom.SpentRerolls then
				increment = CurrentRun.CurrentRoom.SpentRerolls[ScreenAnchors.SellTraitScreen.Name] or 0
			end
			local cost = RerollCosts.SellTrait + increment
			if IsEmpty( CurrentRun.CurrentRoom.SellValues ) then
				cost = -1
			end
			local color = Color.White
			if CurrentRun.NumRerolls < cost then
				color = Color.CostUnaffordable
			end

			local name = "RerollPanelMetaUpgrade_ShortTotal"
			local tooltip = "MetaUpgradeRerollHint"
			if cost < 0 then
				name = "RerollPanel_Blocked"
				tooltip = "MetaUpgradeRerollBlockedHint"
			end

			components["RerollPanel"] = CreateScreenComponent({ Name = "ShopRerollButton", Scale = 1.0, Group = "Combat_Menu" })
			Attach({ Id = components["RerollPanel"].Id, DestinationId = components.ShopBackground.Id, OffsetX = -200, OffsetY = 440 })
			components["RerollPanel"].OnPressedFunctionName = "AttemptPanelReroll"
			components["RerollPanel"].RerollFunctionName = "RerollSellTraitScreen"
			components["RerollPanel"].Cost = cost
			components["RerollPanel"].RerollColor = Color.DarkRed
			components["RerollPanel"].RerollId = ScreenAnchors.SellTraitScreen.Name
			CreateTextBox({ Id = components["RerollPanel"].Id, Text = name, OffsetX = 28, OffsetY = -5,
			ShadowColor = {0,0,0,1}, ShadowOffset={0,3}, OutlineThickness = 3, OutlineColor = {0,0,0,1},
			FontSize = 28, Color = color, Font = "AlegreyaSansSCExtraBold", LuaKey = "TempTextData", LuaValue = { Amount = cost }})
			SetInteractProperty({ DestinationId = components["RerollPanel"].Id, Property = "TooltipOffsetX", Value = 850 })
			CreateTextBox({ Id = components["RerollPanel"].Id, Text = tooltip, FontSize = 1, Color = Color.Transparent, Font = "AlegreyaSansSCExtraBold", LuaKey = "TempTextData", LuaValue = { Amount = cost }})
		end
	end
end

if PQOL.Config.Gameplay.OldChaosShield.Enabled then
	OnAnyLoad{function(triggerArgs)
		SetProjectileProperty({ WeaponName = "ChaosShieldThrow", DestinationId = CurrentRun.Hero.ObjectId, Property = "Speed", Value = 2600 })
		SetProjectileProperty({ WeaponName = "ChaosShieldThrow", DestinationId = CurrentRun.Hero.ObjectId, Property = "NumJumps", Value = 2 })
		SetWeaponProperty({ WeaponName = "ChaosShieldThrow", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileAngleOffset", Value = 45 })
	end}
end