
local loaded = false
OnAnyLoad{function(triggerArgs)
    if not loaded then
      table.insert(BoonInfoScreenData.Ordering, "WeaponUpgrade")
  		BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"] = {}
  		if BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] then
  			BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"] = GetAllKeys( BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] )
  			table.sort( BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"], BoonInfoSort )
  			BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] = nil
  		end
      loaded = true
    end
end}

function CreateTraitRequirements( traitName )
	local screen = ScreenAnchors.BoonInfoScreen
	Destroy({Ids = screen.TraitRequirements })
	screen.TraitRequirements = {}

	local traitData = TraitData[traitName]
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
