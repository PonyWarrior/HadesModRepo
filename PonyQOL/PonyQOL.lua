
--Add Hammer boon list
--Display incompatibility in boon list
--Add pom icon to 'pom-able' boons
table.insert(BoonInfoScreenData.Ordering, "WeaponUpgrade")
BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"] = {}
if BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] then
	BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"] = GetAllKeys( BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] )
	table.sort( BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"], BoonInfoSort )
	BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] = nil
end

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
    if GetTraitNameCount(CurrentRun.Hero, button.TraitData.Name) == 1 and IsGameStateEligible(CurrentRun, TraitData[button.TraitData.Name]) and IsGodTrait(button.TraitData.Name) then
      local pom = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray"  })
      Attach({ Id = pom, DestinationId = icon.Id, OffsetX = 0, OffsetY = 40 })
      SetAnimation({ Name = "StackUpgradePreview", DestinationId = pom, Group = "Combat_Menu_TraitTray" })
      SetScale({ Id = pom, Fraction = 0.4})
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
