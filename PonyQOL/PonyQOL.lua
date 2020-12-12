
--Make Lucifer beam base destroy projectiles
for i, property in pairs (TraitData.GunLoadedGrenadeTrait.PropertyChanges) do
	if property.ProjectileProperty == "ProjectileDefenseRadius" then
		table.remove(TraitData.GunLoadedGrenadeTrait.PropertyChanges, i)
	end
end

--Add Hammer boon list
--Add weapon boon lists
--Display incompatibility in boon list
--Add pom icon to 'pom-able' boons
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
	CreateTextBox({ Id = components.InfographButton.Id, Text = "Show Infograph",
		FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.BoonPatchHeroic, Font = "AlegreyaSansSCLight",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"})

	components.DuoInfographButton = CreateScreenComponent({ Name = "ButtonDefault", Scale = 1.0, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
	Attach({ Id = components.DuoInfographButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 750 , OffsetY = -200 })
	components.DuoInfographButton.OnPressedFunctionName = "ShowDuoInfograph"
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

function ShowInfograph(screen, button)
	local components = screen.Components
	components.Infograph = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1, Group = "Infograph" })
	Attach({ Id = components.Infograph.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0 , OffsetY = 0 })
	components.Infograph.OnPressedFunctionName = "CloseInfograph"
	components.Infograph.ControlHotkey = "Confirm"
	SetAnimation({ Name = "QuestLogIn", DestinationId = components.Infograph.Id })
end

function CloseInfograph(screen, button)
	Destroy({Id = button.Id})
end

function ShowDuoInfograph(screen, button)
	local components = screen.Components
	components.DuoInfograph = CreateScreenComponent({ Name = "BlankObstacle", Scale = 1, Group = "Infograph" })
	Attach({ Id = components.DuoInfograph.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0 , OffsetY = 0 })
	components.DuoInfograph.OnPressedFunctionName = "CloseInfograph"
	components.DuoInfograph.ControlHotkey = "Confirm"
	SetAnimation({ Name = "QuestLogIn", DestinationId = components.DuoInfograph.Id })
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
		CloseMarketScreen(screen, button)
		OpenMarketScreen()
	elseif marketSwapType == "Decrease" then
		for itemIndex, item in ipairs( CurrentRun.MarketItems ) do
			if item.Priority then
				item.CostAmount = item.CostAmount / 10
				item.BuyAmount = item.BuyAmount / 10
			end
		end
		marketSwapType = "Increase"
		CloseMarketScreen(screen, button)
		OpenMarketScreen()
	end
end

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
	for k, upgradeName in pairs( ShrineUpgradeOrder ) do
		local upgradeData = MetaUpgradeData[upgradeName]
		if GameState.MetaUpgrades[upgradeName] ~= nil and GameState.MetaUpgrades[upgradeName] > 0 then
			while GameState.MetaUpgrades[upgradeName] > 0 do
				DecrementTableValue( GameState.MetaUpgrades, upgradeName )
				ApplyMetaUpgrade( upgradeData, true, GameState.MetaUpgrades[upgradeName] <= 0, true )
			end
		end
	end
	CloseShrineUpgradeScreen(screen, button)
	OpenShrineUpgradeMenu()
end

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

--Add Commendations tab to codex
-- local Commendations =
-- {
-- 	Order = {}
-- }
-- for _, msg in pairs(GameData.RunClearMessageData) do
-- 	if msg ~= GameData.RunClearMessageData.DefaultMessage then
-- 		table.insert(Commendations.Order, ModUtil.ToString(msg))
-- 	end
-- end
-- table.insert(CodexOrdering.Order, "Commendations")
-- table.insert(CodexOrdering, Commendations)
-- DebugPrint({Text = "test"})
-- Commendations =
-- {
-- 	TitleText = "Codex_ChthonicGodsChapter",
-- 	Entries = GameData.RunClearMessageData,
-- }
-- Commendations.Entries.DefaultMessage = nil
-- Codex.Commendations = Commendations
-- for i, entry in pairs(Codex.Commendations.Entries) do
-- 	entry = {}
-- end

