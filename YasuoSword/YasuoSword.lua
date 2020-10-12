-- add 5th aspect
-- change the aspect menu
-- custom animations
-- custom boons
-- change all the calls

local baseShowWeaponUpgradeScreen = ShowWeaponUpgradeScreen
function ShowWeaponUpgradeScreen( args )
	local textOffsetX = -50
	OnScreenOpened( { Flag = "WeaponUpgradeScreen", PersistCombatUI = true } )
	FreezePlayerUnit("WeaponUpgradeScreen" )
	EnableShopGamepadCursor()
	local weaponName = args.WeaponName
	ScreenAnchors.WeaponUpgradeScreen = { Components = {}, Name = "WeaponUpgradeScreen", OpenedEquippedIndex = GetEquippedWeaponTraitIndex( weaponName ) }
	local screen = ScreenAnchors.WeaponUpgradeScreen
	screen.StartingIndex = 1
	screen.AspectCount = TableLength(WeaponUpgradeData[weaponName])
	screen.PageCount = math.ceil(screen.AspectCount/4)
	screen.WeaponName = weaponName
	screen.Components.Display = {}
	local components = screen.Components
	EnableShopGamepadCursor(screen.Name)

	components.ShopBackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
	components.ShopBackground = CreateScreenComponent({ Name = "WeaponSelectPanelBox", Group = "Combat_Menu_TraitTray_Backing", X = ScreenCenterX, Y = ScreenHeight/2 - 18})
	components.WeaponImage = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu_TraitTray", X = 335, Y = 435 })
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

	WeaponUpgradeScreenLoadPage(screen)

	components.PageUp = CreateScreenComponent({ Name = "ButtonCodexUp", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
	Attach({ Id = components.PageUp.Id, DestinationId = components.ShopBackground.Id, OffsetX = -400 , OffsetY = -395 })
	components.PageUp.OnPressedFunctionName = "WeaponUpgradeScreenPrevious"
	components.PageUp.ControlHotkey = "MenuUp"

	components.PageDown = CreateScreenComponent({ Name = "ButtonCodexDown", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
	Attach({ Id = components.PageDown.Id, DestinationId = components.ShopBackground.Id, OffsetX = -400 , OffsetY = 415 })
	components.PageDown.OnPressedFunctionName = "WeaponUpgradeScreenNext"
	components.PageDown.ControlHotkey = "MenuDown"

	components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu_TraitTray_Overlay" })
	Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0 , OffsetY = 515 })
	components.CloseButton.OnPressedFunctionName = "CloseWeaponUpgradeScreen"
	components.CloseButton.ControlHotkey = "Cancel"

	screen.KeepOpen = true
	screen.CanClose = true
	thread(HandleWASDInput, screen)
	HandleScreenInput(screen)
end

local baseUpdateWeaponUpgradeButtons = UpdateWeaponUpgradeButtons
function UpdateWeaponUpgradeButtons( weaponName, lastEquippedIndex )
	local components = ScreenAnchors.WeaponUpgradeScreen.Components
	for itemIndex, itemData in pairs( WeaponUpgradeData[weaponName] ) do
		if itemIndex > 4 then

		else
		local purchaseButtonKey = "PurchaseButton"..itemIndex

		if not IsUpgradeWeaponUpgradeDisabled( weaponName, itemIndex ) and not IsBuyWeaponUpgradeDisabled( weaponName, itemIndex ) then
			if not CanUpgradeWeaponUpgrade( weaponName, itemIndex ) then
				ModifyTextBox({ Id = components[purchaseButtonKey.."KeyCost"].Id, Text = "Blank" })
				SetColor({ Id = components[purchaseButtonKey.."KeyCost"].Id, Color = Color.DarkSlateGray })
				UseableOff({ Id = components[purchaseButtonKey .. "Upgrade"].Id })
			else
				ModifyTextBox({ Id = components[purchaseButtonKey.."KeyCost"].Id,
					Text = "MetaUpgrade_Locked_SuperKeys",
					LuaKey = "TempTextData",
					LuaValue = { Amount = GetNextWeaponUpgradeKeyCost( weaponName, itemIndex )}})
				if not HasResource("SuperLockKeys", GetNextWeaponUpgradeKeyCost( weaponName, itemIndex )) then
					ModifyTextBox({ Id = components[purchaseButtonKey.."KeyCost"].Id, ColorTarget = Color.CostUnaffordable, ColorDuration = 0.25 })
				end
			end
		end

		local traitData = {}
		if not IsBuyWeaponUpgradeDisabled( weaponName, itemIndex ) then
			if itemData.RequiredInvestmentTraitName then
				itemName = itemData.RequiredInvestmentTraitName
				if GetWeaponUpgradeLevel(weaponName, itemIndex) > 0  then
					traitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemName, Rarity = GetRarityKey(GetWeaponUpgradeLevel( weaponName, itemIndex ))})
					SetTraitTextData( traitData )
				end
			end
			if itemData.TraitName then
				traitData =  GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemData.TraitName, Rarity = GetRarityKey(GetWeaponUpgradeLevel( weaponName, itemIndex )) })
				SetTraitTextData( traitData )
			end

			if traitData.Name then
				ModifyTextBox({ Id = components[purchaseButtonKey].Id, UseDescription = true, Text = traitData.Name, LuaKey = "TooltipData", LuaValue = traitData, ExcludeText = "SeasonalItem" })
			end
		end

		if not CanUpgradeWeaponUpgrade( weaponName, itemIndex ) then
			if IsWeaponUpgradeMaxed( weaponName, itemIndex ) then
				ModifyTextBox({ Id = components[purchaseButtonKey.."Level"].Id, Text = "UI_TraitLevel_Max" })
			end
		elseif GetWeaponUpgradeLevel(weaponName, itemIndex ) > 0 then
			ModifyTextBox({ Id = components[purchaseButtonKey.."Level"].Id, Text = "UI_TraitLevel", LuaKey = "TempTextData", LuaValue = { Amount = GetWeaponUpgradeLevel(weaponName, itemIndex )} })
		end

		if IsWeaponUpgradeEquipped( weaponName, itemIndex ) then
			if itemIndex ~= lastEquippedIndex then

				SetAnimation({ Name = "EquippedIcon", DestinationId = components[purchaseButtonKey.."Subtitle"].Id })
				PlaySound({ Name = WeaponUpgradeData[weaponName][itemIndex].EquipSound or "/Leftovers/SFX/PerfectTiming" })
				thread( PlayVoiceLines, GlobalVoiceLines.SwitchedWeaponUpgradeVoiceLines, true )
			end
		else
			SetAnimation({ Name = "Blank", DestinationId = components[purchaseButtonKey.."Subtitle"].Id })
			ModifyTextBox({ Id = components[purchaseButtonKey.."Subtitle"].Id, Text = "Blank" })
		end
	end
end
end

function WeaponUpgradeScreenPrevious( screen, button )
	if not WeaponUpgradeData[screen.WeaponName][screen.StartingIndex - 4] then
		return
	end
	local components = ScreenAnchors.WeaponUpgradeScreen.Components
	screen.StartingIndex = screen.StartingIndex - 4
	WeaponUpgradeScreenLoadPage(screen)
	UpdateWeaponUpgradeScreenButtons(screen)
end

function WeaponUpgradeScreenNext( screen, button )
	if not WeaponUpgradeData[screen.WeaponName][screen.StartingIndex + 4] then
		return
	end
	local components = ScreenAnchors.WeaponUpgradeScreen.Components
	screen.StartingIndex = screen.StartingIndex + 4
	WeaponUpgradeScreenLoadPage(screen)
	UpdateWeaponUpgradeScreenButtons(screen)
end

function UpdateWeaponUpgradeScreenButtons(screen)
	local components = ScreenAnchors.WeaponUpgradeScreen.Components
	if WeaponUpgradeData[screen.WeaponName][screen.StartingIndex + 4] then
		SetAlpha({ Id = components.PageDown.Id, Fraction = 1, Duration = 0 })
		UseableOn({ Id = components.PageDown.Id })
	else
		SetAlpha({ Id = components.PageDown.Id, Fraction = 0, Duration = 0 })
		UseableOff({ Id = components.PageDown.Id })
	end
	if WeaponUpgradeData[screen.WeaponName][screen.StartingIndex - 4] then
		SetAlpha({ Id = components.PageUp.Id, Fraction = 1, Duration = 0 })
		UseableOn({ Id = components.PageUp.Id })
	else
		SetAlpha({ Id = components.PageUp.Id, Fraction = 0, Duration = 0 })
		UseableOff({ Id = components.PageUp.Id })
	end
end

function WeaponUpgradeScreenLoadPage(screen)
	local weaponName = screen.WeaponName
	local components = screen.Components
	local textOffsetX = -50
	local ids = {}
	for i, component in pairs(screen.Components) do
		if component.Destroy then
			table.insert(ids, component.Id)
		end
	end
	Destroy({ Ids = ids})
	local offsetIndex = 1
	for i = screen.StartingIndex, screen.StartingIndex + 4 - 1 do
		local itemIndex = i
		local itemData = WeaponUpgradeData[weaponName][itemIndex]
		if itemData ~= nil then
			local purchaseButtonKey = "PurchaseButton"..itemIndex
			local animationName = "BoonSlot1_WeaponSelect"
			if IsBuyWeaponUpgradeDisabled( weaponName, itemIndex ) and IsUpgradeWeaponUpgradeDisabled( weaponName, itemIndex ) then
				animationName = "BoonSlot4_WeaponSelect"
			end
			components[purchaseButtonKey] = CreateScreenComponent({ Name = animationName, Group = "Combat_Menu_TraitTray", X = ScreenCenterX + 40, Y = 20 + offsetIndex * 220})
			components[purchaseButtonKey].Destroy = true
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
			components[purchaseButtonKey.."Icon"].Destroy = true
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
			components[purchaseButtonKey.."Frame"].Destroy = true
			Attach({ Id = components[purchaseButtonKey.."Frame"].Id, DestinationId = components[purchaseButtonKey.."Icon"].Id, OffsetX = 0, OffsetY = 0 })
			SetAnimation({ DestinationId = components[purchaseButtonKey.."Frame"].Id, Name = "Frame_Boon_Menu_Enchantment" })
			SetScale({ Id = components[purchaseButtonKey.."Frame"].Id, Fraction = 1.0 })

			components[purchaseButtonKey].OnPressedFunctionName = "HandleWeaponUpgradeSelection"
			components[purchaseButtonKey].UpgradeButtonKey = purchaseButtonKey .. "Upgrade"
			components[purchaseButtonKey].WeaponName = weaponName
			components[purchaseButtonKey].Data = itemData
			components[purchaseButtonKey].Index = itemIndex

			components[purchaseButtonKey.."Subtitle"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
			components[purchaseButtonKey.."Subtitle"].Destroy = true
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
			components[purchaseButtonKey .. "Title"].Destroy = true
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
			components[purchaseButtonKey .. "Level"].Destroy = true
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
			components[lockIconKey].Destroy = true
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
				components[purchaseButtonKey .. "Upgrade" ].Destroy = true
				Attach({ Id = components[purchaseButtonKey .. "Upgrade"].Id, DestinationId = components[purchaseButtonKey].Id, OffsetX = 440, OffsetY = -5})
				components[purchaseButtonKey.. "Upgrade"].OnPressedFunctionName = "HandleUpgradeWeaponUpgradeSelection"
				components[purchaseButtonKey.. "Upgrade"].WeaponName = weaponName
				components[purchaseButtonKey.. "Upgrade"].Data = itemData
				components[purchaseButtonKey.. "Upgrade"].Index = itemIndex
				components[purchaseButtonKey.. "Upgrade"].Name = itemName
				components[purchaseButtonKey.."KeyCost"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu_TraitTray" })
				Attach({ Id = components[purchaseButtonKey.."KeyCost"].Id, DestinationId = components[purchaseButtonKey.."Upgrade"].Id, OffsetX = 0, OffsetY = 0 })
				components[purchaseButtonKey.."KeyCost"].Destroy = true
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
		offsetIndex = offsetIndex + 1
	end
end

OnWeaponFired{ "SwordParry",
	function( triggerArgs )
		if HeroHasTrait("SwordYasuoTrait") then
			FireWeaponFromUnit({ Weapon = "YasuoSwordStackApplicator", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
		end
	end
}

OnControlPressed{"Shout",
  function(triggerArgs)
    while IsControlDown({ Name = "Shout" }) do
      if IsControlDown({ Name = "Confirm" }) then

        return
      end
      wait(0.1)
    end
end}

function YasuoSwordStackApply(triggerArgs)
	if HasEffect({ Id = CurrentRun.Hero.ObjectId, EffectName = "YasuoSwordTornadoBuff" }) then
		return
	end
  WeaponData.SwordWeapon.YasuoStack = WeaponData.SwordWeapon.YasuoStack + 1
  if WeaponData.SwordWeapon.YasuoStack >= 2 then
		WeaponData.SwordWeapon.YasuoStack = 0
    FireWeaponFromUnit({ Weapon = "YasuoSwordTornadoBuffApplicator", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
  end
end

function YasuoSwordStackClear(triggerArgs)
  WeaponData.SwordWeapon.YasuoStack = 0
end

function YasuoSwordTornadoBuffApply(triggerArgs)
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "ChargeTime",
	Value = 0.5,
	ChangeType = "Absolute", ExcludeLinked = true, })
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "ChargeStartAnimation",
	Value = "ZagreusSwordArthurAttack3_Charge",
	ChangeType = "Absolute", ExcludeLinked = true, })
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "ChargeFx",
	Value = "ChargeAttack-Arthur",
	ChangeType = "Absolute", ExcludeLinked = true, })
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "FireGraphic",
	Value = "ZagreusSwordArthurAttack3_Fire",
	ChangeType = "Absolute", ExcludeLinked = true, })
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "FireFx",
	Value = "SwordSwipeAFlipped-Arthur",
	ChangeType = "Absolute", ExcludeLinked = true, })
	AddOnFireWeapons( CurrentRun.Hero, "SwordParry" , { LegalOnFireWeapons = {"SwordParry" }, AddOnFireWeapons = { "SwordThrustWave" }} )
	AddLimitedWeaponBonus({ AsMultiplier = true, EffectName = triggerArgs.EffectName, Amount = 1, DamageBonus = 0, WeaponNames = { "SwordParry" } } )
	WeaponData.SwordWeapon.YasuoStack = 0
end

function YasuoSwordTornadoBuffClear(triggerArgs)
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "ChargeTime",
	Value = 0.3,
	ChangeType = "Absolute", ExcludeLinked = true, })
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "ChargeStartAnimation",
	Value = "ZagreusSwordArthurAttack1_Charge",
	ChangeType = "Absolute", ExcludeLinked = true, })
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "ChargeFx",
	Value = nil,
	ChangeType = "Absolute", ExcludeLinked = true, })
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "FireGraphic",
	Value = "ZagreusSwordArthurAttack1_Fire",
	ChangeType = "Absolute", ExcludeLinked = true, })
	SetWeaponProperty({ WeaponName = "SwordParry", DestinationId = CurrentRun.Hero.ObjectId,
	Property = "FireFx",
	Value = "SwordSwipeC-Arthur",
	ChangeType = "Absolute", ExcludeLinked = true, })
	RemoveOnFireWeapons( CurrentRun.Hero, { LegalOnFireWeapons = {"SwordParry" }, AddOnFireWeapons = { "SwordThrustWave" }} )
	WeaponData.SwordWeapon.YasuoStack = 0
end

local loaded = false
OnAnyLoad{function(triggerArgs)
  if not loaded then
    loaded = true
		local YasuoData = {
			ZeusWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Zeus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Zeus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Zeus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Zeus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Zeus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Zeus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Zeus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			PoseidonWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Poseidon",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Poseidon-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Poseidon",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Poseidon-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Poseidon-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Poseidon",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Poseidon-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			AthenaWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Athena",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Athena-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Athena",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Athena-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Athena-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Athena",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Athena-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			AphroditeWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Aphrodite",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Aphrodite-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Aphrodite",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Aphrodite-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Aphrodite-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Aphrodite",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Aphrodite-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			ArtemisWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Artemis",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Artemis-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Artemis",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Artemis-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Artemis-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Artemis",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Artemis-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			AresWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Ares",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Ares-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Ares",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Ares-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Ares-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Ares",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Ares-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			DionysusWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Dionysus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Dionysus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Dionysus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Dionysus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Dionysus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Dionysus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Dionysus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			DemeterWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Demeter",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Demeter-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Demeter",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Demeter-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Demeter-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Demeter",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Demeter-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
		}
		for _, traitData in pairs(TraitData) do
			if YasuoData[traitData.Name] ~= nil then
				for _, property in pairs(YasuoData[traitData.Name]) do
					table.insert(traitData.PropertyChanges, property)
				end
			end
		end
    EffectData.YasuoSwordStack = {
      OnApplyFunctionName = "YasuoSwordStackApply",
      OnClearFunctionName = "YasuoSwordStackClear",
    }
    EffectData.YasuoSwordTornadoBuff = {
      OnApplyFunctionName = "YasuoSwordTornadoBuffApply",
      OnClearFunctionName = "YasuoSwordTornadoBuffClear",
    }
    WeaponData.SwordWeapon.YasuoStack = 0
    TraitData.SwordYasuoTrait =
    {
      Name = "SwordYasuoTrait",
      Icon = "WeaponEnchantment_Sword05",
      InheritFrom = { "WeaponEnchantmentTrait" },
      RequiredWeapon = "SwordWeapon",
      CustomTrayText = "SwordYasuoTrait_Tray",
      PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt03ParryReturnToIdle",
      PostWeaponUpgradeScreenAngle = 300,
      PreEquipWeapons = { "YasuoSwordStackApplicator", "SwordThrustWave", "YasuoSwordTornadoBuffApplicator" },
      RarityLevels =
      {
        Common =
        {
          MinMultiplier = 1.00,
          MaxMultiplier = 1.00,
        },
        Rare =
        {
					MinMultiplier = 2.00,
          MaxMultiplier = 2.00,
        },
        Epic =
        {
					MinMultiplier = 3.00,
          MaxMultiplier = 3.00,
        },
        Heroic =
        {
					MinMultiplier = 4.00,
          MaxMultiplier = 4.00,
        },
        Legendary =
        {
					MinMultiplier = 5.00,
          MaxMultiplier = 5.00,
        },
      },
      WeaponBinks =
      {
        "ZagreusSwordArthurIdle_Bink",
        "ZagreusSwordArthurRun_Bink",
        "ZagreusSwordArthurRunStop_Bink",
        "ZagreusSwordArthurAttack1_Bink",
        "ZagreusSwordArthurAttack2_Bink",
        "ZagreusSwordArthurAttack3_Bink",
        "ZagreusSwordArthurAttackParry_Bink",
      },
      WeaponDataOverride =
      {
        SwordWeapon =
        {
          WeaponBinks =
          {
            "ZagreusSwordArthurIdle_Bink",
            "ZagreusSwordArthurRun_Bink",
            "ZagreusSwordArthurRunStop_Bink",
            "ZagreusSwordArthurAttack1_Bink",
            "ZagreusSwordArthurAttack2_Bink",
            "ZagreusSwordArthurAttack3_Bink",
            "ZagreusSwordArthurAttackParry_Bink",
          },

          HitSimSlowCooldown = 0.3,
          HitSimSlowParameters =
          {
            { ScreenPreWait = 0.04, Fraction = 0.03, LerpTime = 0.0 },
            { ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
            { ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },

            --{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
            --{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
            --{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
          },
        },

        SwordWeapon2 =
        {
          HitSimSlowCooldown = 0.3,
          HitSimSlowParameters =
          {
            { ScreenPreWait = 0.02, Fraction = 0.05, LerpTime = 0.0 },
            { ScreenPreWait = 0.03, Fraction = 0.20, LerpTime = 0.06 },
            { ScreenPreWait = 0.03, Fraction = 1.00, LerpTime = 0.07 },

            --{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
            --{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
            --{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
          },
          Sounds =
          {
            FireSounds =
            {
              { Name = "/VO/ZagreusEmotes/EmoteAttacking_Sword" },
              { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
            },
            ChargeSounds =
            {
              { Name = "/VO/ZagreusEmotes/EmoteCharging" },
            },
            ImpactSounds =
            {
              Invulnerable = "/SFX/SwordWallHitClank",
              Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
              Bone = "/SFX/MetalBoneSmash",
              Brick = "/SFX/MetalStoneClang",
              Stone = "/SFX/MetalStoneClang",
              Organic = "/SFX/StabSplatterSmall",
              StoneObstacle = "/SFX/SwordWallHitClank",
              BrickObstacle = "/SFX/SwordWallHitClank",
              MetalObstacle = "/SFX/SwordWallHitClank",
              BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            },
          },

        },

        SwordWeapon3 =
        {
          HitSimSlowCooldown = 0.3,
          HitSimSlowParameters =
          {
            { ScreenPreWait = 0.04, Fraction = 0.01, LerpTime = 0.0 },
            { ScreenPreWait = 0.02, Fraction = 0.15, LerpTime = 0.06 },
            { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.07 },

            --{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
            --{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
            --{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
          },
          Sounds =
          {
            FireSounds =
            {
              { Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
              { Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" }
            },
            ChargeSounds =
            {
              { Name = "/VO/ZagreusEmotes/EmoteHeavyCharging" },
              {
                Name = "/Leftovers/SFX/AuraCharge" ,
                StoppedBy = { "TriggerRelease" }
              },
            },
            ImpactSounds =
            {
              Invulnerable = "/SFX/SwordWallHitClank",
              Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
              Bone = "/SFX/MetalBoneSmash",
              Brick = "/SFX/MetalStoneClang",
              Stone = "/SFX/MetalStoneClang",
              Organic = "/SFX/StabSplatterSmall",
              StoneObstacle = "/SFX/SwordWallHitClank",
              BrickObstacle = "/SFX/SwordWallHitClank",
              MetalObstacle = "/SFX/SwordWallHitClank",
              BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            },
          },
        },
        SwordWeaponDash =
        {
          HitSimSlowCooldown = 0.2,
          Sounds =
          {
            FireSounds =
            {
              { Name = "/VO/ZagreusEmotes/EmoteSpearThrow" },
              { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
            },
            ImpactSounds =
            {
              Invulnerable = "/SFX/SwordWallHitClank",
              Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
              Bone = "/SFX/MetalBoneSmash",
              Brick = "/SFX/MetalStoneClang",
              Stone = "/SFX/MetalStoneClang",
              Organic = "/SFX/StabSplatterSmall",
              StoneObstacle = "/SFX/SwordWallHitClank",
              BrickObstacle = "/SFX/SwordWallHitClank",
              MetalObstacle = "/SFX/SwordWallHitClank",
              BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            },
          },
        },
        SwordParry =
        {
          HitSimSlowCooldown = 0.2,
          Sounds =
          {
            FireSounds =
            {
              { Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
            },
            ChargeSounds =
            {
              { Name = "/VO/ZagreusEmotes/EmoteCharging" },
              { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
            },
            ImpactSounds =
            {
              Invulnerable = "/SFX/SwordWallHitClank",
              Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
              Bone = "/SFX/MetalBoneSmash",
              Brick = "/SFX/MetalStoneClang",
              Stone = "/SFX/MetalStoneClang",
              Organic = "/SFX/StabSplatterSmall",
              StoneObstacle = "/SFX/SwordWallHitClank",
              BrickObstacle = "/SFX/SwordWallHitClank",
              MetalObstacle = "/SFX/SwordWallHitClank",
              BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            },
          },
        },
      },
      PropertyChanges =
      {

        -- Main Attack Changes / Excalibur
        -- {
        --   WeaponNames = { "SwordWeaponDash", "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
        --   WeaponProperty = "FullyAutomatic",
        --   ChangeValue = true,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },

        -- SwordWeaponDash
        -- {
        --   WeaponNames = { "SwordWeaponDash" },
        --   WeaponProperty = "ChargeTime",
        --   ChangeValue = 0.20,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
				-- Sword Dash
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "CancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack1_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack1_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeC-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          ProjectileProperty = "DamageLow",
          ChangeValue = 30,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          ProjectileProperty = "DamageHigh",
          ChangeValue = 30,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        -- Attack 1
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack3_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack3_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeAFlipped-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur2",
          ExcludeLinked = true,
        },
				{
					WeaponNames = { "SwordWeapon" },
					ProjectileProperty = "DamageLow",
					ChangeValue = 25,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponNames = { "SwordWeapon" },
					ProjectileProperty = "DamageHigh",
					ChangeValue = 25,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
        {
          WeaponNames = { "SwordWeapon" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        -- Attack 2
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack2_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack2_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeA-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur2",
          ExcludeLinked = true,
        },
				{
					WeaponNames = { "SwordWeapon2" },
					ProjectileProperty = "DamageLow",
					ChangeValue = 25,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponNames = { "SwordWeapon2" },
					ProjectileProperty = "DamageHigh",
					ChangeValue = 25,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        -- Attack 3
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack3_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack3_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeAFlipped-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur3",
          ExcludeLinked = true,
        },
				{
					WeaponNames = { "SwordWeapon3" },
					ProjectileProperty = "DamageLow",
					ChangeValue = 35,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponNames = { "SwordWeapon3" },
					ProjectileProperty = "DamageHigh",
					ChangeValue = 35,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },


        -- Sword Parry

        -- {
        --   WeaponNames = { "SwordParry" },
        --   WeaponProperty = "ChargeStartAnimation",
        --   ChangeValue = "ZagreusSwordAlt03ParryCharge",
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        --
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordAlt03ParryFire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        --
        -- {
        --   WeaponName = "SwordParry",
        --   ProjectileProperty = "DetonateGraphic",
        --   ChangeValue = "RadialNovaSwordParry-Arthur",
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },

        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack1_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack1_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeC-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur1",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },

        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "ChargeTime",
          ChangeValue = 0.3,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "Projectile",
          ChangeValue = "SpearWeapon",
          ChangeType = "Absolute",
        },

        {
          WeaponNames = { "SwordParry" },
          ProjectileProperty = "DamageLow",
          ChangeValue = 50,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          ProjectileProperty = "DamageHigh",
          ChangeValue = 50,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },

				{
					WeaponName = "SwordParry",
					WeaponProperty = "Cooldown",
					ChangeValue = 3.0,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},

        -- Tornado
        {
            WeaponNames = { "SwordThrustWave" },
            WeaponProperty = "Projectile",
            ChangeValue = "YasuoSwordTornado",
            ChangeType = "Absolute",
        },
				{
					WeaponNames = { "SwordThrustWave" },
					ProjectileProperty = "DamageLow",
					ChangeValue = 0,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponNames = { "SwordThrustWave" },
					ProjectileProperty = "DamageLow",
					BaseValue = 1,
					ChangeType = "Add",
					ExcludeLinked = true,
					ExtractValue =
					{
						ExtractAs = "TooltipDamage",
					}
				},
				{
					WeaponNames = { "SwordThrustWave" },
					ProjectileProperty = "DamageHigh",
					DeriveValueFrom = "DamageLow",
				},
				{
					UnitProperty = "CritAddition",
					BaseValue = 0.02,
					ChangeType = "Add",
					ExtractValue =
					{
						ExtractAs = "TooltipCritBonus",
						Format = "Percent",
					},
				},
      },
    }
    WeaponUpgradeData.SwordWeapon[5] = {
      Costs = { 0, 0, 0, 0, 0 },
      MaxUpgradeLevel = 5,
      TraitName = "SwordYasuoTrait",
      EquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOff",
      UnequippedKitAnimation = "WeaponSwordAlt03FloatingIdle",
      BonusUnequippedKitAnimation = "WeaponSwordAlt03FloatingIdleBonus",
      BonusEquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOffBonus",
      Image = "WeaponEnchantment_Sword05"
    }
  end
end}
