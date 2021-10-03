if AspectFusion.Config.Enabled then
local mod = "AspectFusion"
local package = "AspectFusion"
ModUtil.Path.Wrap( "SetupMap", function(baseFunc)
    DebugPrint({Text = "@"..mod.." Trying to load package "..package..".pkg"})
    LoadPackages({Name = package})
    return baseFunc()
end)

AspectFusion.Data =
{
    SoulThresholds =
    {
        {
            Threshold = 20,
            EnablePull = true,
            PullCount = 1,
            PullRange = 400
        },
        {
            Threshold = 40,
            PullCount = 1,
            PullRange = 100,
        },
        {
            Threshold = 50,
            IncreaseHeroMaxHealth = true
        },
        {
            Threshold = 60,
            PullCount = 1,
            PullRange = 100,
        },
        {
            Threshold = 80,
            EnableExplosion = true,
            ExplosionDamage = 50,
            ExplosionRadius = 200,
        },
        {
            Threshold = 100,
            IncreaseHeroMaxHealth = true
        },
        {
            Threshold = 120,
            ExplosionDamage = 25,
            ExplosionRadius = 100,
        },
        {
            Threshold = 150,
            IncreaseHeroMaxHealth = true
        },
        {
            Threshold = 160,
            ExplosionDamage = 25,
            ExplosionRadius = 100,
        },
        {
            Threshold = 200,
            ExplosionDamage = 25,
            IncreaseHeroMaxHealth = true
        },
        {
            Threshold = 240,
            ExplosionDamage = 25,
        },
        {
            Threshold = 250,
            IncreaseHeroMaxHealth = true
        },
    }
}

local FusionData = AspectFusion.Data

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

    if ScreenAnchors.ComboUI == nil then
        thread(AspectFusion.ShowComboUI)
    end

	attacker.ComboCount = (attacker.ComboCount or 0) + sourceWeaponData.ComboPoints

	if attacker.ComboCount >= attacker.ComboThreshold and not attacker.ComboReady then
		attacker.ComboReady = true
        attacker.UltraComboReady = true
		SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "NumProjectiles", Value = 2 + GetTotalHeroTraitValue("BonusSpecialHits") })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "NumProjectiles", Value = 1 + GetTotalHeroTraitValue("BonusSpecialHits") })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })

		ComboReadyPresentation( attacker, triggerArgs )
	end
	thread( AspectFusion.UpdateComboUI )

end)

ModUtil.Path.Wrap("CheckComboPowerReset", function (baseFunc, attacker, weaponData, args)
	if weaponData ~= nil and attacker.UltraComboReady then
        thread(AspectFusion.DeactiveUltraCombo)
    end
    baseFunc(attacker, weaponData, args)
    thread(AspectFusion.UpdateComboUI)
end)

function AspectFusion.ShowComboUI()
    if not CurrentRun.Hero.Weapons.FistWeapon then
		return
	end
    if ScreenAnchors.ComboUI ~= nil then
		return
	end
	ScreenAnchors.ComboUI = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", X = GunUI.StartX, Y = GunUI.StartY })

	local offsetX = 20
	CreateTextBox(MergeTables({ Id = ScreenAnchors.ComboUI, OffsetX = 0, OffsetY = -2,
			Font = "AlegreyaSansSCBold", FontSize = 24, ShadowRed = 0.1, ShadowBlue = 0.1, ShadowGreen = 0.1,
			OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 1,
			ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left",},
			LocalizationData.UIScripts.GunUI ))
	thread( AspectFusion.UpdateComboUI )

	FadeObstacleIn({ Id = ScreenAnchors.ComboUI, Duration = CombatUI.FadeInDuration, IncludeText = true, Distance = CombatUI.FadeDistance.Ammo, Direction = 0 })

end

function AspectFusion.UpdateComboUI()
	local comboData =
	{
		Current = CurrentRun.Hero.ComboCount,
		Maximum = 12
	}

	if comboData.Current == nil then
		return
	end
    comboData.Current = Clamp(comboData.Current, 0, comboData.Maximum)

    local text = comboData.Current.."/"..comboData.Maximum

	PulseText({ ScreenAnchorReference = "ComboUI", ScaleTarget = 1.04, ScaleDuration = 0.05, HoldDuration = 0.05, PulseBias = 0.02 })
	if comboData.Current < 12 then
		ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = text, Color = Color.White, ColorDuration = 0.04 })
	else
		ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = text, Color = Color.LightBlue, ColorDuration = 0.04 })
	end

	ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = text, FadeTarget = 1 })
	-- ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = "UI_GunText", OffsetY = -2, LuaKey = "TempTextData", LuaValue = comboData, AutoSetDataProperties = false, })
	ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = text, OffsetY = -2 })
end

function AspectFusion.HideComboUI()
	if ScreenAnchors.ComboUI == nil then
		return
	end

	local id = ScreenAnchors.ComboUI
	HideObstacle({ Id = id, IncludeText = true, Distance = CombatUI.FadeDistance.Ammo, Angle = 180, Duration = CombatUI.FadeDuration, SmoothStep = true })

	ScreenAnchors.ComboUI = nil

	wait( CombatUI.FadeDuration , RoomThreadName)
	Destroy({ Id = id })
	ModifyTextBox({ Id = id, FadeTarget = 0, FadeDuration = 0, AutoSetDataProperties = false, })
end

ModUtil.Path.Wrap("ShowCombatUI", function (baseFunc, flag)
    baseFunc(flag)
    if CurrentDeathAreaRoom == nil or not CurrentDeathAreaRoom.ShowResourceUIOnly then
		AspectFusion.ShowComboUI()
	end
end)

ModUtil.Path.Wrap("HideCombatUI", function (baseFunc, flag, args)
    baseFunc(flag, args)
	thread(AspectFusion.HideComboUI)
end)

ModUtil.Path.Wrap("EquipPlayerWeaponPresentation", function (baseFunc, weaponData, args)
    baseFunc(weaponData, args)
    if weaponData.ComboPoints ~= nil then
        thread(AspectFusion.ShowComboUI)
    else
	    thread(AspectFusion.HideComboUI)
    end
end)

function AspectFusion.DeactiveUltraCombo()
    wait(0.1)
    CurrentRun.Hero.UltraComboReady = false
end

ModUtil.Path.Wrap("SetupHeroObject", function (baseFunc, currentRun, applyLuaUpgrades )
    baseFunc(currentRun, applyLuaUpgrades )
    CurrentRun.Hero.UltraComboReady = false
end)

ModUtil.Path.Wrap("UpdateRuptureEffectStacks", function (baseFunc, args)
    if CurrentRun.Hero.UltraComboReady then
        -- CurrentRun.Hero.UltraComboReady = false
        local unitId = args.triggeredById
        local unit = args.TriggeredByTable
        local startIconScale = 1.3

        if not EnemyHealthDisplayAnchors[unitId] then
            CreateHealthBar( unit )
            UpdateHealthBar( unit, 0, { Force = true })
        end
    
        if not EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ] then
    
            local backingId = nil
            local scale = 1
            if unit.BarXScale then
                scale = unit.BarXScale
            end
            if unit and unit.UseBossHealthBar then
                backingId = CreateScreenObstacle({ Name = "UltraRuptureSmall", Group = "Combat_Menu", DestinationId = EnemyHealthDisplayAnchors[unitId] })
                startIconScale = 1.3
                CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 17, OffsetY = 0,
                    Font = "AlegreyaSansSCExtraBold",
                    Justification = "Left",
                    ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
                    OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
                })
            else
                backingId = SpawnObstacle({ Name = "UltraRuptureSmall", Group = "Combat_UI_World", DestinationId = unitId, TriggerOnSpawn = false })
                CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 12, OffsetY = 0,
                    Font = "AlegreyaSansSCExtraBold",
                    Justification = "Left",
                    ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
                    OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
                })
            end
            EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ] = backingId
        end
        
        local scaleTarget = 1.0
        SetScale({ Id = EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ], Fraction = startIconScale })
    
        PositionEffectStacks( unitId )
    else
        baseFunc(args)
    end
end)

ModUtil.Path.Wrap("OnRuptureDashHit", function (baseFunc, args)
    if HeroHasTrait("UltraFistTrait") and CurrentRun.Hero.UltraComboReady then
        -- CurrentRun.Hero.UltraComboReady = false
        local victim = args.TriggeredByTable
        if victim.TriggersOnDamageEffects and victim ~= CurrentRun.Hero then
            if not victim.ActiveEffects or not victim.ActiveEffects.UltraMarkRuptureTarget  then
                ApplyEffectFromWeapon({ WeaponName = "UltraMarkRuptureApplicator", EffectName = "UltraMarkRuptureTarget", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId })
            end
        end
    else
        baseFunc(args)
    end
end)

ModUtil.Path.Wrap("OnRuptureWeaponHit", function (baseFunc, args)
    if HeroHasTrait("UltraFistTrait") and CurrentRun.Hero.UltraComboReady then
        -- CurrentRun.Hero.UltraComboReady = false
        local victim = args.TriggeredByTable
        if victim.TriggersOnDamageEffects and victim ~= CurrentRun.Hero then
            if not victim.ActiveEffects or not victim.ActiveEffects.UltraMarkRuptureTarget  then
                ApplyEffectFromWeapon({ WeaponName = "UltraMarkRuptureApplicator", EffectName = "UltraMarkRuptureTarget", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId })
            end
        end
    else
        baseFunc(args)
    end
end)

ModUtil.Path.Override("EnemyHandleInvisibleAttack", function(enemy, weaponAIData, currentRun, args)
    args = args or {}
	if enemy.IsInvisible and not weaponAIData.KeepInvisibility then
		if enemy.CurrentPhase ~= nil and enemy.CurrentPhase >= 2 and enemy.Phase2VFX ~= nil then
  			CreateAnimation({ Name = enemy.Phase2VFX, DestinationId = enemy.ObjectId })
		end
  	
		SetLifeProperty({ DestinationId = enemy.ObjectId, Property = "InvulnerableFx", Value = "Invincibubble_Hades" })
		enemy.IsInvisible = false
		CreateHealthBar( enemy )
		UpdateHealthBar( enemy, 0, { Force = true })

		if enemy.ActiveEffects and enemy.ActiveEffects.MarkRuptureTarget then
			UpdateRuptureEffectStacks({ TriggeredByTable = enemy, triggeredById = enemy.ObjectId })
		end
        --mod start
        if enemy.ActiveEffects and enemy.ActiveEffects.UltraMarkRuptureTarget then
			UpdateRuptureEffectStacks({ TriggeredByTable = enemy, triggeredById = enemy.ObjectId })
		end
        --mod end
		if enemy.InvisibilityEndSound ~= nil then
			PlaySound({ Name = enemy.InvisibilityEndSound })
		end
		SetUnitVulnerable( enemy )
		SetAlpha({ Id = enemy.ObjectId, Fraction = 1.0, Duration = weaponAIData.InvisibilityFadeInDuration })
		SetColor({ Id = enemy.ObjectId, Color = { 255, 255, 255, 255 }, Duration = weaponAIData.InvisibilityFadeInDuration })
		if args.CreateAnimation then
			CreateAnimation({ Name = args.CreateAnimation, DestinationId = enemy.ObjectId })
		end
		if args.Animation then
			CreateAnimation({ Name = args.Animation, DestinationId = enemy.ObjectId })
		end
		SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "CollideWithUnits", Value = true })
		SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "ImmuneToStun", Value = enemy.PreInvisibilityImmuneToStun })
		SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsProjectiles", Value = true })
		enemy.SkipInvulnerableOnHitPresentation = false
		wait( CalcEnemyWait( enemy, weaponAIData.InvisibilityFadeInDuration ), enemy.AIThreadName )
	end
end)

ModUtil.Path.Wrap("CheckFistDetonation", function (baseFunc, victim, functionArgs, triggerArgs)
    if ( not victim.ActiveEffects or not victim.ActiveEffects.UltraMarkRuptureTarget ) and triggerArgs.SourceWeapon == "FistWeaponSpecialDash" and CurrentRun.Hero.UltraComboReady then
        thread(AspectFusion.ApplyUltraMark, triggerArgs)
        victim.UltraMarked = true
        local delay = 0.1
		MapState.QueuedDetonations = MapState.QueuedDetonations  or {}
		while MapState.QueuedDetonations[_worldTime + delay ] and delay < 2 do
			delay = delay + 0.1
		end
		local key = _worldTime + delay
		MapState.QueuedDetonations[_worldTime + delay] = victim
		wait( delay, RoomThreadName )
		FireWeaponFromUnit({ Weapon = "UltraFistDetonationWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true, AutoEquip = true })
		MapState.QueuedDetonations[key] = nil
		victim.LastRuptureTime = _worldTime
    elseif ( not victim.ActiveEffects or not victim.ActiveEffects.UltraMarkRuptureTarget ) and not victim.UltraMarked then
        baseFunc(victim, functionArgs, triggerArgs)
	end
end)

function AspectFusion.ApplyUltraMark(triggerArgs)
    UpdateRuptureEffectStacks( triggerArgs )
    wait(4)
    AspectFusion.ClearUltraMark(triggerArgs)
end

function AspectFusion.ClearUltraMark(triggerArgs)
    local victim = triggerArgs.TriggeredByTable
	StopAnimation({ Name = "PoseidonAresProjectileGlow", DestinationId = victim.ObjectId })
    victim.UltraMarked = false
	ClearRuptureEffectStacks( triggerArgs )
end

ModUtil.Path.Wrap("CheckVacuumNearbyEnemy", function (baseFunc, weaponData, args)
    if HeroHasTrait("UltraFistTrait") then
        local nearestEnemyTargetIds = GetClosestIds({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = args.Range, MaximumCount = 99 })
        for _, targetId in ipairs(nearestEnemyTargetIds) do
            if targetId ~= 0 and ActiveEnemies[targetId] ~= nil and not ActiveEnemies[targetId].IsDead then
                local distanceBuffer = args.DistanceBuffer
                if CurrentRun.Hero.VacuumRush then
                    distanceBuffer = args.RushDistanceBuffer
                end
                ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, CurrentRun.Hero.ObjectId, -1 * distanceBuffer ), Angle = GetAngleBetween({ Id = targetId, DestinationId = CurrentRun.Hero.ObjectId }) })
                FireWeaponFromUnit({ Weapon = "FistSpecialVacuum", Id = CurrentRun.Hero.ObjectId, DestinationId = targetId })
                FistVacuumPullPresentation( targetId, args )
            end
        end
    else
        baseFunc(weaponData, args)
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

-- ultra bow

function AspectFusion.ArrowRain(markId)
    while CurrentRun.CurrentRoom.LastMarkedTargetId == markId do
        local offsetX = RandomFloat( -200, 200 )
        local offsetY = RandomFloat( -200, 200 )
        local targetId =  SpawnObstacle({ Name = "BlankObstacle", DestinationId = markId, OffsetX = offsetX, OffsetY = offsetY })
        FireWeaponFromUnit({ Weapon = "UltraBowRain", Id = CurrentRun.Hero.ObjectId, DestinationId = targetId, FireFromTarget = true, AutoEquip = true })
        local rubbleWait = RandomFloat( 0.16, 0.32 )
        wait( rubbleWait )
    end
end

ModUtil.Path.Wrap("MarkTargetApply", function (baseFunc, triggerArgs)
    if HeroHasTrait("UltraBowTrait") and not triggerArgs.Reapplied then
            if CurrentRun.CurrentRoom.LastMarkedTargetId ~= nil then
                ClearEffect({ Id = CurrentRun.CurrentRoom.LastMarkedTargetId, Name = "MarkTarget" })
                BlockEffect({ Id = CurrentRun.CurrentRoom.LastMarkedTargetId, Name = "MarkTarget", Duration = 0.1 })
            end
            CurrentRun.CurrentRoom.LastMarkedTargetId = triggerArgs.triggeredById
            SetWeaponProperty({ WeaponName = "BowSplitShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "OverrideFireRequestTarget", Value = triggerArgs.triggeredById, DataValue = false})
            --fff
            SetProjectileProperty({ WeaponName = "BowSplitShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "UseStartLocation", Value = false })
            -- thread(AspectFusion.ArrowRain, triggerArgs.triggeredById)
    elseif not triggerArgs.Reapplied then
    DebugPrint({Text="fuck"})

        baseFunc(triggerArgs)
    end
end)

ModUtil.Path.Wrap("MarkTargetClear", function (baseFunc, triggerArgs)
    if HeroHasTrait("UltraBowTrait") then
        SetWeaponProperty({ WeaponName = "BowSplitShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "OverrideFireRequestTarget", Value = -1, DataValue = false})
        SetProjectileProperty({ WeaponName = "BowSplitShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "UseStartLocation", Value = true })
        -- CurrentRun.CurrentRoom.LastMarkedTargetId = nil
    else
        baseFunc(triggerArgs)
    end
end)

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

-- ultra gun
ModUtil.Path.Wrap("DashManeuver", function (baseFunc, duration)
    if CurrentRun.Hero.RallyHealth.RallyActive and CurrentRun.Hero.RallyHealth.RallyHealOnDash and not CurrentRun.Hero.IsDead then
		if CurrentRun.Hero.RallyHealth.Store > 0 then
			rallyHeal = round( CurrentRun.Hero.RallyHealth.Store )
			CurrentRun.Hero.RallyHealth.Store = CurrentRun.Hero.RallyHealth.Store - rallyHeal
			Heal( CurrentRun.Hero, { HealAmount = rallyHeal, SourceName = "RallyHeal", Silent = false } )
			RallyHealPresentation()
			thread( UpdateHealthUI )
		end
	end

	if HeroHasTrait("UltraGunTrait") then
		return
	end
    baseFunc(duration)
end)

ModUtil.Path.Wrap("ManualReload", function (baseFunc, attacker)
    if HeroHasTrait("UltraGunTrait") then
        if not IsInputAllowed({}) then
            return
        end
    
        if attacker.ActiveEffects then
            for effectName in pairs(attacker.ActiveEffects) do
                if EffectData[effectName] and EffectData[effectName].BlockReload then
                    return
                end
            end
        end
    
        if CurrentDeathAreaRoom == nil and CurrentRun and CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.DisableWeaponsExceptDash then
            return
        end
    
        for weaponName, v in pairs( attacker.Weapons ) do
            local weaponData = GetWeaponData( attacker, weaponName)
            if weaponData ~= nil and weaponData.ActiveReloadTime ~= nil then
                if attacker.Reloading then
                    ReloadFailedMidReloadPresentation( attacker, weaponData )
                    return
                end
    
                thread( MarkObjectiveComplete, "GunWeaponManualReload" )
                ReloadGun( attacker, weaponData )
    
                thread( MarkObjectiveComplete, "ManualReload" )
                ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, WeaponName = "ManualReloadEffectApplicator", EffectName = "ManualReloadBonus" })
                return
            end
        end
    else
        baseFunc(attacker)
    end
end)

ModUtil.Path.Wrap("ManualReloadBonusApply", function (baseFunc, triggerArgs)
    if HeroHasTrait("UltraGunTrait") then
        AddOnFireWeapons( CurrentRun.Hero, "GunWeapon" , { LegalOnFireWeapons = {"GunWeapon"}, AddOnFireWeapons = { "UltraSniperGunWeapon" }} )
    else
        baseFunc(triggerArgs)
    end
end)

OnWeaponFired{ "UltraSniperGunWeapon",
	function( triggerArgs )
        -- hacky but it does the job
        RemoveOnFireWeapons( CurrentRun.Hero, { LegalOnFireWeapons = {"GunWeapon"}, AddOnFireWeapons = { "UltraSniperGunWeapon" }} )
        AddOnFireWeapons( CurrentRun.Hero, "GunWeapon" , { LegalOnFireWeapons = {"GunWeapon"}, AddOnFireWeapons = { "UltraGunWeapon" }} )
	end
}

ModUtil.Path.Wrap("ShowGunUI", function (baseFunc, gunData)
    baseFunc(gunData)
    if HeroHasTrait( "UltraGunTrait" ) then
		SetAnimation({ Name = "GunLaserIndicatorIcon", DestinationId = ScreenAnchors.GunUI})
    end
end)

ModUtil.Path.Wrap("UpdateGunUI", function (baseFunc, triggerArgs)
    baseFunc(triggerArgs)
    if HeroHasTrait( "UltraGunTrait" ) then
		SetAnimation({ Name = "GunLaserIndicatorIcon", DestinationId = ScreenAnchors.GunUI})
    end
end)

ModUtil.Path.Wrap("ReloadPresentationComplete", function (baseFunc, attacker, weaponData, state )
    if HeroHasTrait("UltraGunTrait") then
        Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 6, MinFraction = 0, MaxFraction = 1, Color = Color.White, Duration = 0.15, ExpireAfterCycle = false })
        StopSound({ Id = state.ReloadSoundId, Duration = 0.2 })
        PlaySound({ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlashLucifer", Id = CurrentRun.Hero.ObjectId })
        PlaySound({ Name = "/SFX/Menu Sounds/ObjectiveActivateShk2", Id = state.GunReloadDisplayId })
        CreateAnimation({ Name="GunReloadIndicatorComplete", DestinationId = state.GunReloadDisplayId, GroupName="Combat_UI" })
        Destroy({ Id = state.GunReloadDisplayId })
        thread( PlayVoiceLines, HeroVoiceLines.GunWeaponReloadCompleteVoiceLines, true )
    else
        baseFunc(attacker, weaponData, state )
    end
end)

-- ultra spear
ModUtil.Path.Wrap("MarkTargetSpinApply", function (baseFunc, triggerArgs)
    baseFunc(triggerArgs)
    if HeroHasTrait("UltraSpearTrait") then
        triggerArgs.TriggeredByTable.MarkedForDeath = true
    end
end)

ModUtil.Path.Wrap("MarkTargetSpinClear", function (baseFunc, triggerArgs)
    baseFunc(triggerArgs)
    if HeroHasTrait("UltraSpearTrait") then
        thread(AspectFusion.RemoveMark, triggerArgs)
    end
end)

function AspectFusion.RemoveMark(triggerArgs)
    wait(1)
    if triggerArgs.TriggeredByTable ~= nil then
       triggerArgs.TriggeredByTable.MarkedForDeath = false
    end
end

ModUtil.Path.Wrap("Kill", function (baseFunc, victim, triggerArgs )
    if victim.IsDead or CurrentRun.Hero.HandlingDeath then
		return
	end

    local killingWeaponName
    if triggerArgs == nil then
        killingWeaponName = ""
    else
        killingWeaponName = triggerArgs.SourceWeapon
    end

    -- Pot spawning
    if victim.MarkedForDeath or killingWeaponName == "SpearWeaponSpin" or killingWeaponName == "SpearWeaponSpin2" or killingWeaponName == "SpearWeaponSpin3" then
        if victim.Name ~= "ZagreusTombstone" then
        -- if CurrentRun.Hero.LastPotSpawn == nil then
        --     CurrentRun.Hero.LastPotSpawn = 0
        -- end
        -- if (_worldTime - CurrentRun.Hero.LastPotSpawn) > AspectFusion.Config.FinalFormVaratha.PotSpawnCooldown then
        --     CurrentRun.Hero.LastPotSpawn = _worldTime
            local newUnit = DeepCopyTable( EnemyData.ZagreusTombstone )
            newUnit.ObjectId = SpawnUnit({ Name = newUnit.Name, Group = "Standing", DestinationId = victim.ObjectId, DoActivatePresentation = false })
            SetColor({ Id = newUnit.ObjectId, Color = Color.Red})
            SetupEnemyObject( newUnit, CurrentRun)
        end
        -- end
    end

    baseFunc(victim, triggerArgs )

    -- Pot kill
    if victim.Name ~= nil and victim.Name == "ZagreusTombstone" then
        thread(AspectFusion.SoulPotKill, victim, triggerArgs)
        CurrentRun.Hero.SoulCount = CurrentRun.Hero.SoulCount + 1
        AspectFusion.SoulPotLevelUp()
        thread(AspectFusion.UpdateSoulUI)
    end
end)

function AspectFusion.DestroyAllPots()
	for k, enemy in pairs( ActiveEnemies ) do
		if enemy.Name == "ZagreusTombstone" then
            enemy.DestroyOnly = true
			thread( Kill, enemy )
		end
	end
end

ModUtil.Path.Wrap("CheckForAllEnemiesDead", function(baseFunc, eventSource, args)
    baseFunc(eventSource, args)
    -- Clean all pots at the end of an encounter
    AspectFusion.DestroyAllPots()
end)

OnControlPressed{"Reload", function (triggerArgs)
    if HeroHasTrait("UltraSpearTrait") then
        local newUnit = DeepCopyTable( EnemyData.ZagreusTombstone )
        newUnit.ObjectId = SpawnUnit({ Name = newUnit.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, DoActivatePresentation = false,
        OffsetX = 100, OffsetY = 100 })
        SetColor({ Id = newUnit.ObjectId, Color = Color.Red})
        SetupEnemyObject( newUnit, CurrentRun)
    end
end}

function AspectFusion.SoulPotLevelUp()
    if CurrentRun.Hero.SoulCount == nil then
        return
    end
    local levelData

    if CurrentRun.Hero.SoulCount >= AspectFusion.GetNextPotThreshold() then
        local temp = AspectFusion.GetNextPotThreshold()
        for _, thresholdData in pairs (AspectFusion.Data.SoulThresholds) do
            if thresholdData.Threshold == temp then
                levelData = thresholdData
                break
            end
        end
    end

    if levelData ~= nil then
        local pot = CurrentRun.Hero.SoulPot
        pot.CurrentThreshold = pot.NextThreshold
        pot.NextThreshold = AspectFusion.GetNextPotThreshold()

        if levelData.EnablePull then
            pot.EnablePull = true
        end
        if levelData.PullCount then
            pot.PullCount = pot.PullCount + levelData.PullCount
        end
        if levelData.PullRange then
            pot.PullRange = pot.PullRange + levelData.PullRange
        end
        if levelData.EnableExplosion then
            pot.EnableExplosion = true
        end
        if levelData.ExplosionDamage then
            pot.ExplosionDamage = pot.ExplosionDamage + levelData.ExplosionDamage
        end
        if levelData.ExplosionRadius then
            pot.ExplosionRadius = pot.ExplosionRadius + levelData.ExplosionRadius
        end
        if levelData.IncreaseHeroMaxHealth then
            AddTraitToHero({TraitName = "UltraSpearHealthBonus"})
            thread(UpdateHealthUI)
        end

    end

end

function AspectFusion.InitSoulPot()
    CurrentRun.Hero.SoulPot =
    {
        EnablePull = false,
        PullCount = 0,
        PullRange = 0,
        EnableExplosion = false,
        ExplosionDamage = 0,
        ExplosionRadius = 0,
        CurrentThreshold = 0,
    }
    CurrentRun.Hero.SoulPot.NextThreshold = AspectFusion.GetNextPotThreshold()
end

function AspectFusion.GetNextPotThreshold()
    if CurrentRun.Hero.SoulPot == nil then
        return
    end

    local threshold = CurrentRun.Hero.SoulPot.CurrentThreshold or 0
    local temp = 9999

    for i, thresholdData in pairs (AspectFusion.Data.SoulThresholds) do
        DebugPrint({Text=thresholdData.Threshold})
        if thresholdData.Threshold > threshold and thresholdData.Threshold < temp then
            temp = thresholdData.Threshold
        end
    end
    return temp
end

function AspectFusion.SoulPotKill(victim, triggerArgs)
    if victim.DestroyOnly then
        return
    end

    if CurrentRun.Hero.SoulPot == nil then
        AspectFusion.InitSoulPot()
    end

    local debug = false
	local victimName = victim.Name
	local killer = triggerArgs.AttackerTable
	local destroyerId = triggerArgs.AttackerId
	local killingWeaponName = triggerArgs.SourceWeapon
	local currentRoom = CurrentRun.CurrentRoom
    local pot = CurrentRun.Hero.SoulPot

    if killer == CurrentRun.Hero then
        if pot.EnablePull then
            local nearestEnemyTargetIds = GetClosestIds({ Id = victim.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = pot.PullRange, MaximumCount = pot.PullCount })
            for _, targetId in ipairs(nearestEnemyTargetIds) do
                if targetId ~= 0 and ActiveEnemies[targetId] ~= nil and not ActiveEnemies[targetId].IsDead then
                    local distanceBuffer = 0
                    ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, victim.ObjectId, -1 * distanceBuffer ), Angle = GetAngleBetween({ Id = targetId, DestinationId = victim.ObjectId }) })
                  end
            end
        end
        if pot.EnableExplosion then
            wait(0.2)
			SetProjectileProperty({ WeaponName = "GunBombWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageLow", Value = pot.ExplosionDamage })
			SetProjectileProperty({ WeaponName = "GunBombWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageHigh", Value = pot.ExplosionDamage })
			SetProjectileProperty({ WeaponName = "GunBombWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageRadius", Value = pot.ExplosionRadius })
	        FireWeaponFromUnit({ Weapon = "GunBombWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
        end
    end

    -- for reference, temporary
    if killer == CurrentRun.Hero and killingWeaponName ~= nil and debug then
	    -- FireWeaponFromUnit({ Weapon = "GunBombWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
        -- if HasEffect({Id = attacker.ObjectId, EffectName = "SpearRushBonus"}) then
        --     DebugPrint({Text="yolo"})
        -- end

        if killingWeaponName == "SpearWeaponThrow" then
	        FireWeaponFromUnit({ Weapon = "GunBombWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
            
        elseif killingWeaponName == "SpearWeaponSpin" or killingWeaponName == "SpearWeaponSpin2" or killingWeaponName == "SpearWeaponSpin3" then
	        FireWeaponFromUnit({ Weapon = killingWeaponName, Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })

        elseif killingWeaponName == "RangedWeapon" then
			-- ReloadRangedAmmo(0)
	        -- FireWeaponFromUnit({ Weapon = killingWeaponName, Id = victim.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })

            local consumableId = SpawnObstacle({ Name = "AmmoPack", DestinationId = victim.ObjectId, Group = "Standing" })
            local consumable = CreateConsumableItem( consumableId, "AmmoPack" )
            consumable.AddAmmo = 1
            local delay = GetTotalHeroTraitValue("AmmoDropUseDelay")
            if delay > 0 then
                SetInteractProperty({ DestinationId = consumableId, Property = "Cooldown", Value = delay })
                thread( DoUseDelay, consumableId, delay )
            end
    
            for i, data in pairs(GetHeroTraitValues("AmmoFieldWeapon")) do
                thread( FireAmmoWeapon, consumableId, data )
            end
            thread( EscalateMagnetism, consumable )
        elseif killingWeaponName == "SpearWeapon" then
        local nearestEnemyTargetIds = GetClosestIds({ Id = victim.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = 600, MaximumCount = 3 })
        for _, targetId in ipairs(nearestEnemyTargetIds) do
            if targetId ~= 0 and ActiveEnemies[targetId] ~= nil and not ActiveEnemies[targetId].IsDead then
                local distanceBuffer = 0

                ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, victim.ObjectId, -1 * distanceBuffer ), Angle = GetAngleBetween({ Id = targetId, DestinationId = victim.ObjectId }) })
              end
        end
        end

    end
end

function AspectFusion.ShowSoulUI()
    if not CurrentRun.Hero.Weapons.SpearWeapon then
        AspectFusion.HideSoulUI()
		return
	end
    if ScreenAnchors.SoulUI ~= nil then
		return
	end

    if CurrentRun.Hero.SoulCount == nil then
        CurrentRun.Hero.SoulCount = 0
    end
    if CurrentRun.Hero.SoulPot == nil then
        AspectFusion.InitSoulPot()
    end

	ScreenAnchors.SoulUI = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", X = GunUI.StartX, Y = GunUI.StartY })

	local offsetX = 20
	CreateTextBox(MergeTables({ Id = ScreenAnchors.SoulUI, OffsetX = 0, OffsetY = -2,
			Font = "AlegreyaSansSCBold", FontSize = 24, ShadowRed = 0.1, ShadowBlue = 0.1, ShadowGreen = 0.1,
			OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 1,
			ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left",},
			LocalizationData.UIScripts.GunUI ))
	thread( AspectFusion.UpdateSoulUI )

	FadeObstacleIn({ Id = ScreenAnchors.SoulUI, Duration = CombatUI.FadeInDuration, IncludeText = true, Distance = CombatUI.FadeDistance.Ammo, Direction = 0 })

end

function AspectFusion.UpdateSoulUI()
	local soulData =
	{
		Current = CurrentRun.Hero.SoulCount,
		Maximum = 1000--CurrentRun.Hero.SoulPot.NextThreshold
	}

	if soulData.Current == nil then
		return
	end
    soulData.Current = Clamp(soulData.Current, 0, soulData.Maximum)

    local text = soulData.Current--.."/"..soulData.Maximum

    local textColorA = { 17, 125, 0, 255 }
	local textColorB = Color.White
	local FontColor = Color.Lerp(textColorA, textColorB, (soulData.Maximum - soulData.Current) / soulData.Maximum)
	if soulData.Current >= soulData.Maximum then
		FontColor = textColorA
	end

	PulseText({ ScreenAnchorReference = "SoulUI", ScaleTarget = 1.04, ScaleDuration = 0.05, HoldDuration = 0.05, PulseBias = 0.02 })
	ModifyTextBox({ Id = ScreenAnchors.SoulUI, Text = text, Color = FontColor, ColorDuration = 0.04 })

	ModifyTextBox({ Id = ScreenAnchors.SoulUI, Text = text, FadeTarget = 1 })
	-- ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = "UI_GunText", OffsetY = -2, LuaKey = "TempTextData", LuaValue = comboData, AutoSetDataProperties = false, })
	ModifyTextBox({ Id = ScreenAnchors.SoulUI, Text = text, OffsetY = -2 })
end

function AspectFusion.HideSoulUI()
	if ScreenAnchors.SoulUI == nil then
		return
	end

	local id = ScreenAnchors.SoulUI
	HideObstacle({ Id = id, IncludeText = true, Distance = CombatUI.FadeDistance.Ammo, Angle = 180, Duration = CombatUI.FadeDuration, SmoothStep = true })

	ScreenAnchors.SoulUI = nil

	wait( CombatUI.FadeDuration , RoomThreadName)
	Destroy({ Id = id })
	ModifyTextBox({ Id = id, FadeTarget = 0, FadeDuration = 0, AutoSetDataProperties = false, })
end

ModUtil.Path.Wrap("ShowCombatUI", function (baseFunc, flag)
    baseFunc(flag)
    if CurrentDeathAreaRoom == nil or not CurrentDeathAreaRoom.ShowResourceUIOnly then
		AspectFusion.ShowSoulUI()
	end
end)

ModUtil.Path.Wrap("HideCombatUI", function (baseFunc, flag, args)
    baseFunc(flag, args)
	thread(AspectFusion.HideSoulUI)
end)

ModUtil.Path.Wrap("EquipPlayerWeaponPresentation", function (baseFunc, weaponData, args)
    baseFunc(weaponData, args)
    thread(AspectFusion.ShowSoulUI)
end)

end