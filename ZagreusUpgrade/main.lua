
ZagreusUpgradeData =
{
    Boons = {},
}

local AltarScreen = { Components = {} }


local ValidGods =
{
    "ZeusUpgrade",
    "PoseidonUpgrade",
    "AthenaUpgrade",
    "AphroditeUpgrade",
    "ArtemisUpgrade",
    "AresUpgrade",
    "DionysusUpgrade",
    "HermesUpgrade",
    "DemeterUpgrade",
    "TrialUpgrade",
}

local Portraits =
{
    "Codex_Portrait_Zeus",
    "Codex_Portrait_Poseidon",
    "Codex_Portrait_Athena",
    "Codex_Portrait_Aphrodite",
    "Codex_Portrait_Artemis",
    "Codex_Portrait_Ares",
    "Codex_Portrait_Dionysus",
    "Codex_Portrait_Hermes",
    "Codex_Portrait_Demeter",
    "Codex_Portrait_Chaos",
}

local Sounds =
{
    "/SFX/ZeusBoonThunder",
    "/SFX/PoseidonBoonWaveCrash",
    "/SFX/AthenaBoonHolyShield",
    "/SFX/AphroditeBoonLoveChimes",
    "/SFX/ArtemisBoonArrow",
    "/SFX/AresBoonBattle",
    "/SFX/DionysusBoonWineLaugh",
    "/SFX/HermesBoonWhoosh",
    "/SFX/DemeterBoonFrost",
    "/Leftovers/Menu Sounds/SkillUpgradeConfirm",
}

OnControlPressed{ "Shout",
function(triggerArgs)

for i=1, TableLength(ValidGods) do
    if GetGiftLevel(ValidGods[i]) == GetMaxGiftLevel(ValidGods[i]) then
        local traitName = nil
        if ValidGods[i] == "TrialUpgrade" then
            traitName = GetRandomValue(LootData[ValidGods[i]].PermanentTraits)
        else
            traitName = GetRandomValue(LootData[ValidGods[i]].Traits)
        end
       if traitName ~= nil then
        AddTraitToHero({ TraitName = traitName})
       end
    end
end

end}

table.insert(DeathLoopData.DeathAreaBedroom.UnthreadedEvents,
{
    FunctionName = "SpawnAltar"
})

function SpawnAltar()
    local unlocked = false
    for i=1, TableLength(ValidGods) do
        if GetGiftLevel(ValidGods[i]) == GetMaxGiftLevel(ValidGods[i]) then
            unlocked = true
            break
        end
    end
    if unlocked then
        CurrentRun.CurrentRoom.BlockKeepsakeMenu = true
        local altar = DeepCopyTable( ObstacleData.GiftRack )
        altar.ObjectId = SpawnObstacle({ Name = "GiftRack", Group = "FX_Terrain", DestinationId = CurrentRun.Hero.ObjectId, AttachedTable = altar, OffsetX = 500, OffsetY = 0 })
		SetScale({ Id = altar.ObjectId, Fraction = 0.2 })
        SetupObstacle( altar )
        AddToGroup({Id = altar.ObjectId, Name = "Altar"})
    end
end

OnUsed{ "Altar", function()
    ShowAltarScreen()
end}

 
function ShowAltarScreen()
  ScreenAnchors.AltarScreen = DeepCopyTable(AltarScreen)
  local screen = ScreenAnchors.AltarScreen
  local components = screen.Components
  local title = ""
  local subtitle = ""
  screen.Name = "AltarScreen"
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_Menu" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = Color.Black })
  --Title
  CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
  OffsetX = 100, OffsetY = -390, Color = Color.White, Font = "SpectralSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --SubTitle
  CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
  OffsetX = 100, OffsetY = -345, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, X = ScreenCenterX, OffsetY = ScreenCenterY - 40 })
  components.CloseButton.OnPressedFunctionName = "CloseAltarScreen"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display
  CreateAltarButtons(screen)
  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
end
 
function CloseAltarScreen(screen, button)
  DisableShopGamepadCursor()
  SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
  SetConfigOption({ Name = "UseOcclusion", Value = true })
  CloseScreen(GetAllIds(screen.Components), 0.1)
  PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
  ScreenAnchors.AltarScreen = nil
  UnfreezePlayerUnit()
  screen.KeepOpen = false
  OnScreenClosed({ Flag = screen.Name })
end

function CreateAltarButtons(screen)
    local components = screen.Components
    local rowStartX = 105
    local rowStartY = ScreenCenterY
    local incrementX = 190
    local incrementY = 0

    for i, godName in pairs (ValidGods) do
        local key = "God"..i
        local buttonKey = "Button"..i
        local fraction = 0.1
        components[buttonKey] = CreateScreenComponent({ Name = "BoonSlot1", X = rowStartX, Y = rowStartY - 500, Scale = 1.0, Group = "Combat_Menu" })
        components[buttonKey].Image = key
        components[buttonKey].God = godName
        components[buttonKey].Index = i
        SetScaleX({ Id = components[buttonKey].Id, Fraction = 0.22})
        SetScaleY({ Id = components[buttonKey].Id, Fraction = 2.8})
        components[key] = CreateScreenComponent({ Name = "BlankObstacle", X = rowStartX, Y = rowStartY - 500, Scale = 1.2, Group = "Combat_Menu" })
        if GetGiftLevel(ValidGods[i]) == GetMaxGiftLevel(ValidGods[i]) then
            SetThingProperty({ Property = "Ambient", Value = 0.0, DestinationId = components[key].Id })
            components[buttonKey].OnPressedFunctionName = "OpenGodAltarPanel"
            fraction = 1.0
        end
        SetAlpha({ Ids = { components[key].Id, components[buttonKey].Id }, Fraction = 0 })
        SetAlpha({ Ids = { components[key].Id, components[buttonKey].Id }, Fraction = fraction, Duration = 0.9 })
        SetAnimation({ DestinationId = components[key].Id, Name = Portraits[i] })
        Move({ Ids = { components[key].Id, components[buttonKey].Id }, OffsetX = rowStartX, OffsetY = 500, Duration = 0.9 })
        
        components[buttonKey].ToDestroy = true
        components[key].ToDestroy = true
        wait(0.1)
        -- PlaySound({ Name = Sounds[i]})
        rowStartX = rowStartX + incrementX
    end

end

function OpenGodAltarPanel(screen, button)
    local components = screen.Components
    local godName = button.God
    local index = button.Index
    local ToDestroy = {}
    for i, component in pairs (components) do
        if component ~= components[button.Image] and component.ToDestroy then
            table.insert(ToDestroy, component.Id)
        end
    end
    Destroy({ Id = button.Id })
    SetAlpha({ Ids = ToDestroy, Fraction = 0, Duration = 1.0 })
    SetScale({ Ids = { components[button.Image].Id }, Fraction = 1.5, Duration = 1.0})
    Move({ Ids = { components[button.Image].Id }, OffsetX = 150, OffsetY = ScreenCenterY, Duration = 1 })
    PlaySound({ Name = Sounds[index]})

    wait(1)
    Destroy({Ids = ToDestroy})

    components.BackButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
    SetColor({ Id = components.BackButton.Id, Color = Color.Turquoise})
    Attach({ Id = components.BackButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = ScreenCenterY - 40 })
    components.BackButton.OnPressedFunctionName = "CloseGodAltarPanel"
    components.BackButton.ToDestroy = true

    CreateTextBox({ Id = components.Background.Id, Text = LootData[godName].MenuTitle or "UpgradeChoiceMenu_Title_"..godName,
    FontSize = 32,
    OffsetX = 0, OffsetY = -465,
    Color = Color.White,
    Font = "SpectralSCLightTitling",
    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 3},
    OutlineThickness = 3,
    Justification = "Center"})

    local flavorText = GetRandomValue( LootData[godName].FlavorTextIds )
    CreateTextBox(MergeTables({ Id = components.Background.Id, Text = flavorText,
            FontSize = 16,
            OffsetY = -410, Width = 1040,
            Color = {0.698, 0.702, 0.514, 1.0},
            Font = "AlegreyaSansSCRegular",
            ShadowBlur = 0, ShadowColor = {0,0,0,0}, ShadowOffset={0, 3},
            Justification = "Center" }, LocalizationData.UpgradeChoice.FlavorText))

    CreateGodAltarButtons(screen, godName)
end

function CreateGodAltarButtons(screen, godName)
    local components = screen.Components
    local rowStartX = 650
    local rowStartY = ScreenCenterY - 280
    local incrementX = 300

	local tooltipData = {}

    for itemIndex, itemName in ipairs( LootData[godName].Traits ) do
        local rowoffset = 200
        local columnoffset = 700
        local numperrow = 2
        local offsetX = rowStartX + columnoffset*((itemIndex-1) % numperrow)
        local offsetY = rowStartY + rowoffset*(math.floor((itemIndex-1)/numperrow))

        local purchaseButtonKey = "PurchaseButton"..itemIndex
        components[purchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "Combat_Menu", Scale = 0.8, X = offsetX, Y = offsetY })
        components[purchaseButtonKey].ToDestroy = true
        SetScaleY({ Id = components[purchaseButtonKey].Id, Fraction = 1.25 })
        
		local upgradeData = nil
		local upgradeTitle = GetTraitTooltipTitle( TraitData[itemName] )
        upgradeData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemName, Rarity = "Common" })
        tooltipData = upgradeData
        SetTraitTextData( tooltipData )
        local upgradeDescription = GetTraitTooltip( tooltipData , { Default = upgradeData.Title })
        local traitNum = GetTraitCount(CurrentRun.Hero, upgradeData)

        components[purchaseButtonKey.."Icon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = offsetX - 250, Y = offsetY })
        components[purchaseButtonKey.."Icon"].ToDestroy = true
        SetAnimation({ DestinationId = components[purchaseButtonKey.."Icon"].Id, Name = upgradeData.Icon .. "_Large" })
        SetScale({ Id = components[purchaseButtonKey.."Icon"].Id, Fraction = 0.85 })

        components[purchaseButtonKey.."Frame"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = offsetX - 250, Y = offsetY })
        components[purchaseButtonKey.."Frame"].ToDestroy = true
        SetAnimation({ DestinationId = components[purchaseButtonKey.."Frame"].Id, Name = "Frame_Boon_Menu_Common"})
        SetScale({ Id = components[purchaseButtonKey.."Frame"].Id, Fraction = 0.85 })

        local icon = "Boon_Common"
		CreateTextBox({ Id = components[purchaseButtonKey].Id, Text = icon,
			FontSize = 27,
			OffsetX = -150, OffsetY = -60,
			Width = 720,
			Color = Color.White,
			Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Right"
		})

		CreateTextBox({ Id = components[purchaseButtonKey].Id,
			Text = upgradeTitle,
			FontSize = 27,
			OffsetX = -150, OffsetY = -65,
			Color = Color.White,
			Font = "AlegreyaSansSCLight",
			ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
			Justification = "Left",
			LuaKey = "TooltipData", LuaValue = tooltipData,
        })
        
		CreateTextBoxWithFormat(MergeTables({ Id = components[purchaseButtonKey].Id,
			Text = upgradeDescription,
			OffsetX = -150, OffsetY = -30,
			Width = 475,
			Justification = "Left",
			VerticalJustification = "Top",
			LineSpacingBottom = 8,
			UseDescription = true,
			LuaKey = "TooltipData", LuaValue = tooltipData,
			Format = "BaseFormat",
			VariableAutoFormat = "BoldFormatGraft",
			TextSymbolScale = 0.8,
		}, LocalizationData.UpgradeChoice.BoonLootButton))

    end
end

function CloseGodAltarPanel(screen, button)
    local components = screen.Components
    local ToDestroy = {}
    for i, component in pairs (components) do
        if component.ToDestroy then
            table.insert(ToDestroy, component.Id)
        end
    end
    SetAlpha({ Ids = ToDestroy, Fraction = 0, Duration = 0.9 })
	ModifyTextBox({ Ids = ToDestroy, FadeTarget = 0.0, FadeDuration = 0.5 })
	ModifyTextBox({ Id = components.Background.Id, FadeTarget = 0.0, FadeDuration = 0.5 })
    CreateAltarButtons(screen)
    Destroy({Ids = ToDestroy})
	DestroyTextBox({ Ids = { ToDestroy, components.Background.Id } })
end