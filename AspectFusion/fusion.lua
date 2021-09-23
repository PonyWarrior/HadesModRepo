if AspectFusion.Config.Enabled then
ModUtil.BaseOverride("ShowWeaponUpgradeScreen", function (args)
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

    AspectFusion.WeaponUpgradeScreenLoadPage(screen)

    components.PageUp = CreateScreenComponent({ Name = "ButtonCodexUp", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
    Attach({ Id = components.PageUp.Id, DestinationId = components.ShopBackground.Id, OffsetX = -400 , OffsetY = -395 })
    components.PageUp.OnPressedFunctionName = "AspectFusion.WeaponUpgradeScreenPrevious"
    components.PageUp.ControlHotkey = "MenuUp"

    components.PageDown = CreateScreenComponent({ Name = "ButtonCodexDown", Scale = 0.8, Sound = "/SFX/Menu Sounds/GeneralWhooshMENU", Group = "Combat_Menu_TraitTray_Backing" })
    Attach({ Id = components.PageDown.Id, DestinationId = components.ShopBackground.Id, OffsetX = -400 , OffsetY = 465 })
    components.PageDown.OnPressedFunctionName = "AspectFusion.WeaponUpgradeScreenNext"
    components.PageDown.ControlHotkey = "MenuDown"

    components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu_TraitTray_Overlay" })
    Attach({ Id = components.CloseButton.Id, DestinationId = components.ShopBackground.Id, OffsetX = 0 , OffsetY = 515 })
    components.CloseButton.OnPressedFunctionName = "CloseWeaponUpgradeScreen"
    components.CloseButton.ControlHotkey = "Cancel"

    screen.KeepOpen = true
    screen.CanClose = true
    thread(HandleWASDInput, screen)
    HandleScreenInput(screen)
end)

ModUtil.BaseOverride("UpdateWeaponUpgradeButtons", function (weaponName, lastEquippedIndex)
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
end)

function AspectFusion.WeaponUpgradeScreenPrevious( screen, button )
	if not WeaponUpgradeData[screen.WeaponName][screen.StartingIndex - 4] then
		return
	end
	local components = ScreenAnchors.WeaponUpgradeScreen.Components
	screen.StartingIndex = screen.StartingIndex - 4
	AspectFusion.WeaponUpgradeScreenLoadPage(screen)
	AspectFusion.UpdateWeaponUpgradeScreenButtons(screen)
end

function AspectFusion.WeaponUpgradeScreenNext( screen, button )
	if not WeaponUpgradeData[screen.WeaponName][screen.StartingIndex + 4] then
		return
	end
	local components = ScreenAnchors.WeaponUpgradeScreen.Components
	screen.StartingIndex = screen.StartingIndex + 4
	AspectFusion.WeaponUpgradeScreenLoadPage(screen)
	AspectFusion.UpdateWeaponUpgradeScreenButtons(screen)
end

function AspectFusion.UpdateWeaponUpgradeScreenButtons(screen)
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

function AspectFusion.WeaponUpgradeScreenLoadPage(screen)
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

-- warning
ModUtil.Path.Wrap("CloseWeaponUpgradeScreen", function (baseFunc, screen)
    local weaponName = GetEquippedWeapon()
    local aspectName = GetWeaponUpgradeTrait(weaponName, GameState.LastWeaponUpgradeData[weaponName].Index)
    if aspectName ~= nil and aspectName == "UltraShieldTrait" then
			thread( InCombatText, CurrentRun.Hero.ObjectId, "You need to exit and re-enter the room for this aspect to work properly in the courtyard", 5.0, { SkipShadow = true } )
    end
    baseFunc(screen)
end)

-- Ultra sword
OnWeaponFired{ "SwordParry",
	function( triggerArgs )
		if HeroHasTrait("UltraSwordTrait") then
			AddLimitedWeaponBonus({ AsCrit = true, EffectName = "SwordPostParryCritical", Amount = 100, CritBonus = GetTotalHeroTraitValue("SwordPostParryCriticalAmount")})
		end
	end
}

-- Ultra Fists
ModUtil.Path.Wrap("CheckComboPowers", function (baseFunc, victim, attacker, triggerArgs, sourceWeaponData )
    baseFunc(victim, attacker, triggerArgs, sourceWeaponData)
    if sourceWeaponData == nil or sourceWeaponData.ComboPoints == nil or sourceWeaponData.ComboPoints <= 0 then
		return
	end

	if triggerArgs.EffectName ~= nil then
		-- Effects never generate combo points for now
		return
	end

	if victim.NoComboPoints then
		return
	end

    if not HeroHasTrait( "UltraFistTrait" ) then
		return
	end

	attacker.ComboCount = (attacker.ComboCount or 0) + sourceWeaponData.ComboPoints

	if attacker.ComboCount >= attacker.ComboThreshold and not attacker.ComboReady then
		attacker.ComboReady = true
		SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "NumProjectiles", Value = 2 + GetTotalHeroTraitValue("BonusSpecialHits") })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })
		if HeroHasTrait( "FistSpecialFireballTrait" ) then
			SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileInterval", Value = 0.08 })
		else
			SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		end
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "NumProjectiles", Value = 1 + GetTotalHeroTraitValue("BonusSpecialHits") })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })

		ComboReadyPresentation( attacker, triggerArgs )
	end
end)

-- Ultra Shield
ModUtil.Path.Wrap("ShieldFireClear", function (baseFunc, triggerArgs, args)
    baseFunc(triggerArgs, args)
    if HeroHasTrait("UltraShieldTrait") and CurrentRun.CurrentRoom.LoadedAmmo and CurrentRun.CurrentRoom.LoadedAmmo > 0 and triggerArgs.name == "ShieldWeaponRush" and CurrentRun.Hero.StoredAmmo and CurrentRun.CurrentRoom.LoadedAmmo then
		local numAmmo = CurrentRun.CurrentRoom.LoadedAmmo
		if HeroHasTrait("ShieldLoadAmmo_ZeusRangedTrait" ) then
			local targetId = SpawnObstacle({ Name = "InvisibleTarget", Group = "Scripting", LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY })
			for i = 1, numAmmo do
				thread(FireWeaponWithinRange, { SourceId = targetId, Range = 350, SeekTarget = true, WeaponName = "ZeusShieldLoadAmmoStrike", InitialDelay = 0.1 * i, Delay = 0.25, Count = 1, BonusChance = GetTotalHeroTraitValue("BonusBolts") })
			end
			thread( DestroyOnDelay, { targetId }, 3 )
		end
		
		thread( UnloadAmmoThread, { Count = numAmmo , Attacker = CurrentRun.Hero, Angle = GetAngle({Id = CurrentRun.Hero.ObjectId}), LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY, Interval = args.Interval })
		
		while numAmmo  > 0 do
			for i, ammoData in pairs( CurrentRun.Hero.StoredAmmo ) do
				if ammoData.WeaponName == "SelfLoadAmmoApplicator" then
					local ammoAnchors = ScreenAnchors.SelfStoredAmmo
					if ammoAnchors ~= nil and ammoAnchors[#ammoAnchors] ~= nil then
						Destroy({ Id = ammoAnchors[#ammoAnchors] })
						ammoAnchors[#ammoAnchors] = nil
					end
					CurrentRun.Hero.StoredAmmo[i] = nil
					break
				end
			end
			numAmmo  = numAmmo  - 1
		end
		CurrentRun.Hero.StoredAmmo = CollapseTable( CurrentRun.Hero.StoredAmmo )

		thread(MarkObjectiveComplete, "BeowulfTackle")
		ShieldFireClearPresentation( triggerArgs )
	end
end)

OnWeaponFired{ "ShieldWeaponRush",
	function(triggerArgs)
		-- SetPlayerPhasing("ShieldWeaponRush")
		if HeroHasTrait("UltraShieldTrait") then
			FireWeaponFromUnit({ Weapon = "ShieldThrowProjectileBonusApplicator", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
		end
		if HeroHasTrait("UltraShieldTrait") then

			local parentTrait = nil
			for i, traitData in pairs( CurrentRun.Hero.Traits ) do
				if traitData.Name == "UltraShieldTrait" then
					parentTrait = traitData
					break
				end
			end
			SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = "Scale", Value = 1 })
			SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = "ExtentScale", Value = 1 })

			local parentAnimData = parentTrait.AnimDefinitions.Default
			for traitName, animData in pairs( parentTrait.AnimDefinitions ) do
				if traitName == "Default" or HeroHasTrait(traitName) then
					parentAnimData = animData
				end
			end
			if parentAnimData and parentAnimData.Unloaded then
				for changeKey, changeValue in pairs( parentAnimData.Unloaded ) do
					SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = changeKey, Value = changeValue })
				end
			end
		end
	end
}

ModUtil.Path.Wrap("SelfLoadAmmo", function (baseFunc)
    baseFunc()
	if not CurrentRun.CurrentRoom.LoadedAmmo or not HeroHasTrait( "UltraShieldTrait" ) then
		return
	end

	PlaySound({ Name = "/Leftovers/SFX/HarpDash", Id = CurrentRun.Hero.ObjectId })
	thread( PlayVoiceLines, HeroVoiceLines.LoadingAmmoVoiceLines, true )

	if ScreenAnchors.AmmoIndicatorUI then
		local offsetX = 380
		local offsetY = -50
		ScreenAnchors.SelfStoredAmmo =  ScreenAnchors.SelfStoredAmmo or {}
		offsetX = offsetX + ( #ScreenAnchors.SelfStoredAmmo * 22 )
		local screenId = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", DestinationId = ScreenAnchors.HealthBack, X = 10 + offsetX, Y = ScreenHeight - 50 + offsetY })
		SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = screenId })
		table.insert( ScreenAnchors.SelfStoredAmmo, screenId )
		SetAnimation({ Name = "SelfStoredAmmoIcon", DestinationId = screenId })
	end

	CurrentRun.CurrentRoom.LoadedAmmo = CurrentRun.CurrentRoom.LoadedAmmo + 1
	CurrentRun.Hero.StoredAmmo = CurrentRun.Hero.StoredAmmo or {}

	local storedAmmoData =
	{
		Count = 1,
		ForceMin = 300,
		ForceMax = 500,
		AttackerId = CurrentRun.Hero.ObjectId,
		WeaponName = "SelfLoadAmmoApplicator",
		Id = _worldTime
	}
	table.insert( CurrentRun.Hero.StoredAmmo, storedAmmoData )
	thread( UpdateAmmoUI )

	-- Changes to extents
	local parentTrait = nil
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		if traitData.Name == "UltraShieldTrait" then
			parentTrait = traitData
			break
		end
	end

	if parentTrait then
		local loadedRushScale = parentTrait.BaseLoadedRushScale
		local loadedRushRarityMultiplier = ( GetRarityValue(parentTrait.Rarity) * parentTrait.LoadedRushRarityMultiplier )
		SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = "Scale", Value =  1 + ( loadedRushScale - 1 ) * loadedRushRarityMultiplier })
		SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = "ExtentScale", Value = 1 + ( loadedRushScale - 1 ) * loadedRushRarityMultiplier })


		local parentAnimData = parentTrait.AnimDefinitions.Default
		for traitName, animData in pairs( parentTrait.AnimDefinitions ) do
			if traitName == "Default" or HeroHasTrait(traitName) then
				parentAnimData = animData
			end
		end
		if parentAnimData and parentAnimData.Loaded then
			for changeKey, changeValue in pairs( parentAnimData.Loaded ) do
				SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = changeKey, Value = changeValue })
			end
		end
	end
end, AspectFusion)

OnWeaponFailedToFire{ function( triggerArgs )
		local attacker = triggerArgs.TriggeredByTable
		local weaponData = GetWeaponData( attacker, triggerArgs.name )

		if weaponData == nil then
			return
		end

		if weaponData.RecallWeaponsOnFailToFire then
            for _, recallWeaponName in pairs (weaponData.RecallWeaponsOnFailToFire) do
			    RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = recallWeaponName, Method = "RecallProjectiles" })
            end
		end

	end}
end

-- ultra bow

ModUtil.Path.Wrap("DamageEnemy", function (baseFunc, victim, triggerArgs )
    baseFunc(victim, triggerArgs )
    local sourceWeaponData = triggerArgs.AttackerWeaponData
	local attacker = triggerArgs.AttackerTable
    if sourceWeaponData ~= nil and HeroHasTrait("UltraBowTrait") and not triggerArgs.PureDamage and not IsEmpty(ActiveEnemies) and ( not victim.SkipModifiers or victim.BondAlwaysApplies) then
		local shareData = GetHeroTraitValues("BondDamageShareData")[1]
		local enemyIds = GetAllKeys( ActiveEnemies )
		for index, id in pairs(enemyIds) do
			local enemy = ActiveEnemies[id]
			if enemy and not enemy.IsDead and IsEmpty( enemy.InvulnerableFlags ) and IsEmpty ( enemy.PersistentInvulnerableFlags )
				and enemy.ActiveEffects and enemy.ActiveEffects.MarkBondTarget and Contains(shareData.WeaponNames, sourceWeaponData.Name ) and not triggerArgs.EffectName then
				local damageAmount = triggerArgs.DamageAmount * shareData.Multiplier
				if HeroData.DefaultHero.HeroAlliedUnits[ enemy.Name ] and shareData.AlliedDamageMultiplier then
					damageAmount = damageAmount * shareData.AlliedDamageMultiplier
				end
				Damage( enemy, { EffectName = "DamageShare", DamageAmount = damageAmount, Silent = false, PureDamage = true } )
			end
		end
	end
end)

ModUtil.Path.Wrap("LoadAmmo", function (baseFunc)
    baseFunc()
    if not CurrentRun.CurrentRoom.LoadedAmmo or not HeroHasTrait( "UltraBowTrait" ) then
		return
	end

	CurrentRun.CurrentRoom.ValidVolleys = CurrentRun.CurrentRoom.ValidVolleys or {}
	local currentBowVolley = GetWeaponProperty({ Id = CurrentRun.Hero.ObjectId, WeaponName = "BowWeapon", Property = "Volley" }) or 0
	local currentBowDashVolley = GetWeaponProperty({ Id = CurrentRun.Hero.ObjectId, WeaponName = "BowWeaponDash", Property = "Volley" }) or 0
	local nextLoadedAmmoVolley = 0

	for i, value in pairs( CurrentRun.CurrentRoom.ValidVolleys ) do
		if value.BowWeapon == currentBowVolley + 1 and value.BowWeaponDash == currentBowDashVolley + 1 then
			nextLoadedAmmoVolley = nextLoadedAmmoVolley + 1
		end
	end

	PlaySound({ Name = "/Leftovers/SFX/HarpDash", Id = CurrentRun.Hero.ObjectId })
	thread( PlayVoiceLines, HeroVoiceLines.LoadingAmmoVoiceLines, true )
		if ScreenAnchors.AmmoIndicatorUI then
		local offsetX = 380
		local offsetY = -50
		ScreenAnchors.SelfStoredAmmo =  ScreenAnchors.SelfStoredAmmo or {}
		offsetX = offsetX + ( #ScreenAnchors.SelfStoredAmmo * 22 )
		local screenId = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", DestinationId = ScreenAnchors.HealthBack, X = 10 + offsetX, Y = ScreenHeight - 50 + offsetY })
		SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = screenId })
		table.insert( ScreenAnchors.SelfStoredAmmo, screenId )
		SetAnimation({ Name = "SelfStoredAmmoIcon", DestinationId = screenId })
	end

	local storedAmmoData =
	{
		Count = 1,
		ForceMin = 300,
		ForceMax = 500,
		AttackerId = CurrentRun.Hero.ObjectId,
		WeaponName = "SelfLoadAmmoApplicator",
		Id = _worldTime
	}
	CurrentRun.Hero.StoredAmmo = CurrentRun.Hero.StoredAmmo or {}
	table.insert( CurrentRun.Hero.StoredAmmo, storedAmmoData )
	thread( UpdateAmmoUI )


	if nextLoadedAmmoVolley < CurrentRun.CurrentRoom.MaxLoadedAmmo then
		IncrementTableValue( CurrentRun.CurrentRoom, "LoadedAmmo" )
		table.insert( CurrentRun.CurrentRoom.ValidVolleys,
		{
			BowWeapon = currentBowVolley + 1,
			BowWeaponDash = currentBowDashVolley + 1,
		})
		thread( UpdateAmmoUI )
	else
		thread( InCombatText, CurrentRun.Hero.ObjectId, "CombatText_MaxLoaded" )
		RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "RangedWeapon", Method = "AddAmmo", Parameters = { 1 } })
	end
end)