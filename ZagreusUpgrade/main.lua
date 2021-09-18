
local ZagreusUpgradeData =
{
    Altar =
    {
        ZeusUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        PoseidonUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        AthenaUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        AphroditeUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        ArtemisUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        AresUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        DionysusUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        HermesUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        DemeterUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
        TrialUpgrade =
        {
            Level = 1,
            Rarity = "Incomplete"
        },
    },
    Boons =
    {
        ZeusUpgrade = {},
        PoseidonUpgrade = {},
        AthenaUpgrade = {},
        AphroditeUpgrade = {},
        ArtemisUpgrade = {},
        AresUpgrade = {},
        DionysusUpgrade = {},
        HermesUpgrade = {},
        DemeterUpgrade = {},
        TrialUpgrade = {},
    },
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
    Entrance =
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
    },
    Shout =
    {
        ZeusUpgrade = "/VO/ZagreusField_2234",
        PoseidonUpgrade = "/VO/ZagreusField_2236",
        AthenaUpgrade = "/VO/ZagreusField_2238",
        AphroditeUpgrade = "/VO/ZagreusField_2244",
        ArtemisUpgrade = "/VO/ZagreusField_2242",
        AresUpgrade = "/VO/ZagreusField_2240",
        DionysusUpgrade = "/VO/ZagreusField_2246",
        HermesUpgrade = "/VO/ZagreusField_1925",
        DemeterUpgrade = "/VO/ZagreusField_2997",
        TrialUpgrade = "/VO/ZagreusHome_0328",
    }
}

local mod = "ZagreusUpgrade"
ModUtil.RegisterMod(mod)
SaveIgnores[mod] = true

ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
    DebugPrint({Text = "@"..mod.." Loading all god packages!"})
    LoadPackages({Names = {
        "ZeusUpgrade",
        "PoseidonUpgrade",
        "AthenaUpgrade",
        "AphroditeUpgrade",
        "ArtemisUpgrade",
        "AresUpgrade",
        "DionysusUpgrade",
        "HermesUpgrade",
        "DemeterUpgrade",
        "Chaos"
    }})
    return baseFunc()
end)

OnControlPressed{ "Shout",
function(triggerArgs)
    --Debug area
    -- LoadAltarBoons()
    -- AddTraitToHero({TraitName = "ZeusShoutTrait"})
    -- BuildSuperMeter(CurrentRun, 100)
    -- CommenceSuperMove()
    -- UpdateSuperDamageBonus()
    -- thread( MarkObjectiveComplete, "EXMove" )
    -- RemoveTrait( CurrentRun.Hero, "ZeusShoutTrait" )

    -- AddTraitToHero({TraitName = "PoseidonShoutTrait"})
    -- BuildSuperMeter(CurrentRun, 100)
    -- CommenceSuperMove()
    -- UpdateSuperDamageBonus()
    -- thread( MarkObjectiveComplete, "EXMove" )
    -- RemoveTrait( CurrentRun.Hero, "PoseidonShoutTrait" )

    -- AddTraitToHero({TraitName = "AthenaShoutTrait"})
    -- BuildSuperMeter(CurrentRun, 100)
    -- CommenceSuperMove()
    -- UpdateSuperDamageBonus()
    -- thread( MarkObjectiveComplete, "EXMove" )
    -- RemoveTrait( CurrentRun.Hero, "AthenaShoutTrait" )

    -- AddTraitToHero({TraitName = "AphroditeShoutTrait"})
    -- BuildSuperMeter(CurrentRun, 100)
    -- CommenceSuperMove()
    -- UpdateSuperDamageBonus()
    -- thread( MarkObjectiveComplete, "EXMove" )
    -- RemoveTrait( CurrentRun.Hero, "AphroditeShoutTrait" )

    -- AddTraitToHero({TraitName = "ArtemisShoutTrait"})
    -- BuildSuperMeter(CurrentRun, 100)
    -- CommenceSuperMove()
    -- UpdateSuperDamageBonus()
    -- thread( MarkObjectiveComplete, "EXMove" )
    -- RemoveTrait( CurrentRun.Hero, "ArtemisShoutTrait" )

    -- AddTraitToHero({TraitName = "AresShoutTrait"})
    -- BuildSuperMeter(CurrentRun, 100)
    -- CommenceSuperMove()
    -- UpdateSuperDamageBonus()
    -- thread( MarkObjectiveComplete, "EXMove" )
    -- RemoveTrait( CurrentRun.Hero, "AresShoutTrait" )

    -- AddTraitToHero({TraitName = "DionysusShoutTrait"})
    -- BuildSuperMeter(CurrentRun, 100)
    -- CommenceSuperMove()
    -- UpdateSuperDamageBonus()
    -- thread( MarkObjectiveComplete, "EXMove" )
    -- RemoveTrait( CurrentRun.Hero, "DionysusShoutTrait" )

    -- AddTraitToHero({TraitName = "DemeterShoutTrait"})
    -- BuildSuperMeter(CurrentRun, 100)
    -- CommenceSuperMove()
    -- UpdateSuperDamageBonus()
    -- thread( MarkObjectiveComplete, "EXMove" )
    -- RemoveTrait( CurrentRun.Hero, "DemeterShoutTrait" )
    ValidateCheckpoint({ Valid = true })

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
        if ZagreusUpgrade.Data == nil or IsEmpty(ZagreusUpgrade.Data) then
            ZagreusUpgrade.InitializeModData()
        end
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

function ZagreusUpgrade.InitializeModData()
    ZagreusUpgrade.Data = ZagreusUpgradeData
end

function ShowAltarScreen()

  ScreenAnchors.AltarScreen = DeepCopyTable(AltarScreen)
  local screen = ScreenAnchors.AltarScreen
  screen.StartingIndex = 0
  screen.BoonsPerPage = 8
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
    PlaySound({ Name = Sounds.Entrance[index]})

    wait(1)
    Destroy({Ids = ToDestroy})

    components.BackButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
    SetColor({ Id = components.BackButton.Id, Color = Color.Turquoise})
    Attach({ Id = components.BackButton.Id, DestinationId = components.Background.Id, OffsetX = -100, OffsetY = ScreenCenterY - 40 })
    components.BackButton.OnPressedFunctionName = "CloseGodAltarPanel"
    components.BackButton.ToDestroy = true

    if godName ~= "TrialUpgrade" then
        components.PageButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Combat_Menu" })
        SetColor({ Id = components.PageButton.Id, Color = Color.Green})
        Attach({ Id = components.PageButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = ScreenCenterY - 40 })
        components.PageButton.OnPressedFunctionName = "ShowNextGodAltarPage"
        components.PageButton.God = godName
        components.PageButton.ToDestroy = true
    end

    CreateTextBox({ Id = components.Background.Id, Text = (LootData[godName].MenuTitle or ("UpgradeChoiceMenu_Title_"..godName)),
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
    local rowStartX = 660
    local rowStartY = ScreenCenterY - 280
    local rowoffset = 200
    local columnoffset = 775
    local numperrow = 2
    local buttonScaleX = 1.1
    local buttonScaleY = 1.25
    local patchScaleY = 1.0
    local patchOffsetX = 36
    local iconScale = 0.85
    local frameScale = 0.85
    local iconOffsetX = -285
    local iconOffsetY = 0
    local titleOffsetX = 0
    local titleOffsetY = -65
    local descriptionOffsetX = -185
    local descriptionOffsetY = -30
    local descriptionWidth = 580

    local tooltipData = {}
    local validTraits = BuildLegalAltarTraitList(godName)

    local startingIndex = screen.StartingIndex
    local boonsPerPage = screen.BoonsPerPage

    if godName == "TrialUpgrade" then
        rowStartX = 650
        rowStartY = ScreenCenterY - 320
        rowoffset = 140
        columnoffset = 700
        numperrow = 2
        buttonScaleY = 0.8
        buttonScaleX = 1.0
        patchScaleY = 0.6
        iconScale = 0.5
        frameScale = 0.5
        titleOffsetY = -35
        iconOffsetX = -250
        descriptionOffsetX = -150
        descriptionOffsetY = 0
        descriptionWidth = 475
        boonsPerPage = 99
    end

    local maxIndex = startingIndex + boonsPerPage

    for itemIndex, itemName in ipairs( validTraits) do

        if startingIndex < itemIndex and itemIndex <= maxIndex then

            local index = (itemIndex - startingIndex)
            local offsetX = rowStartX + columnoffset*((index-1) % numperrow)
            local offsetY = rowStartY + rowoffset*(math.floor((index-1)/numperrow))

            local purchaseButtonKey = "PurchaseButton"..itemIndex
            components[purchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "Combat_Menu", Scale = 0.8, X = offsetX, Y = offsetY })
            components[purchaseButtonKey].ToDestroy = true
            components[purchaseButtonKey].TempToDestroy = true
            SetScaleY({ Id = components[purchaseButtonKey].Id, Fraction = buttonScaleY })
            SetScaleX({ Id = components[purchaseButtonKey].Id, Fraction = buttonScaleX })

            local upgradeData = nil
            local upgradeTitle = GetTraitTooltipTitle( TraitData[itemName] )
            upgradeData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = itemName, Rarity = ZagreusUpgrade.Data.Altar[godName].Rarity })
            tooltipData = upgradeData
            SetTraitTextData( tooltipData )
            local upgradeDescription = GetTraitTooltip( tooltipData , { Default = upgradeData.Title })
            if HasDisplayName({ Text = upgradeDescription .."_Initial" }) then
                upgradeDescription = upgradeDescription .."_Initial"
            end
            local traitNum = GetTraitCount(CurrentRun.Hero, upgradeData)

            local color = Color["BoonPatch" .. upgradeData.Rarity ] or Color.Gray
            if ZagreusUpgrade.Data.Boons[godName][1] ~= nil and ZagreusUpgrade.Data.Boons[godName][1].Name == itemName then
                color = LootData[godName].LootColor or Color.Gray
            end

            components[purchaseButtonKey.."Patch"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = offsetX + iconOffsetX + patchOffsetX, Y = offsetY })
            components[purchaseButtonKey.."Patch"].ToDestroy = true
            components[purchaseButtonKey.."Patch"].TempToDestroy = true
            SetAnimation({ DestinationId = components[purchaseButtonKey.."Patch"].Id, Name = "BoonRarityPatch"})
            SetColor({ Id = components[purchaseButtonKey.."Patch"].Id, Color = color })
            SetScaleY({ Id = components[purchaseButtonKey.."Patch"].Id, Fraction = patchScaleY })

            components[purchaseButtonKey.."Icon"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = offsetX + iconOffsetX, Y = offsetY })
            components[purchaseButtonKey.."Icon"].ToDestroy = true
            components[purchaseButtonKey.."Icon"].TempToDestroy = true
            SetAnimation({ DestinationId = components[purchaseButtonKey.."Icon"].Id, Name = upgradeData.Icon .. "_Large" })
            SetScale({ Id = components[purchaseButtonKey.."Icon"].Id, Fraction = iconScale })

            components[purchaseButtonKey.."Frame"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = offsetX + iconOffsetX, Y = offsetY })
            components[purchaseButtonKey.."Frame"].ToDestroy = true
            components[purchaseButtonKey.."Frame"].TempToDestroy = true
            SetAnimation({ DestinationId = components[purchaseButtonKey.."Frame"].Id, Name = "Frame_Boon_Menu_".. (upgradeData.Frame or "Common")})
            SetScale({ Id = components[purchaseButtonKey.."Frame"].Id, Fraction = frameScale })

            local text = "Boon_"..tostring(upgradeData.Rarity)
            CreateTextBox({ Id = components[purchaseButtonKey].Id, Text = text,
                FontSize = 27,
                OffsetX = descriptionOffsetX + 475, OffsetY = titleOffsetY,
                Width = 720,
                Color = color,
                Font = "AlegreyaSansSCLight",
                ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                Justification = "Right"
            })

            -- if slot already taken by another god display a small icon
            if upgradeData.Slot and IsSlotTaken(upgradeData) then
                for god, boons in pairs(ZagreusUpgrade.Data.Boons) do
                    if boons[1] ~= nil and boons[1].Slot and boons[1].Slot == upgradeData.Slot then
                        if boons[1].Name ~= upgradeData.Name then
                            components[purchaseButtonKey.."IconSlotTaken"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = offsetX + iconOffsetX - 45, Y = offsetY + 45 })
                            components[purchaseButtonKey.."IconSlotTaken"].ToDestroy = true
                            components[purchaseButtonKey.."IconSlotTaken"].TempToDestroy = true
                            SetAnimation({ DestinationId = components[purchaseButtonKey.."IconSlotTaken"].Id, Name = boons[1].Icon .. "_Small" })

                            components[purchaseButtonKey.."FrameSlotTaken"] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu", X = offsetX + iconOffsetX - 45, Y = offsetY + 45 })
                            components[purchaseButtonKey.."FrameSlotTaken"].ToDestroy = true
                            components[purchaseButtonKey.."FrameSlotTaken"].TempToDestroy = true
                            SetAnimation({ DestinationId = components[purchaseButtonKey.."FrameSlotTaken"].Id, Name = "BoonIcon_Frame_".. (upgradeData.Frame or "Common")})
                            break
                        end
                    end
                end
            end

            CreateTextBox({ Id = components[purchaseButtonKey].Id,
                Text = upgradeTitle,
                FontSize = 27,
                OffsetX = descriptionOffsetX, OffsetY = titleOffsetY,
                Color = color,
                Font = "AlegreyaSansSCLight",
                ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
                Justification = "Left",
                LuaKey = "TooltipData", LuaValue = tooltipData,
            })

            CreateTextBoxWithFormat(MergeTables({ Id = components[purchaseButtonKey].Id,
                Text = upgradeDescription,
                OffsetX = descriptionOffsetX, OffsetY = descriptionOffsetY,
                Color = color,
                Width = descriptionWidth,
                Justification = "Left",
                VerticalJustification = "Top",
                LineSpacingBottom = 8,
                UseDescription = true,
                LuaKey = "TooltipData", LuaValue = tooltipData,
                Format = "BaseFormat",
                VariableAutoFormat = "BoldFormatGraft",
                TextSymbolScale = 0.8,
            }, LocalizationData.UpgradeChoice.BoonLootButton))

            components[purchaseButtonKey].OnPressedFunctionName = "HandleBoonAltarClick"
            components[purchaseButtonKey].TraitData = upgradeData
            components[purchaseButtonKey].God = godName
        end
    end

    if GetNextGodAltarRarity(godName) ~= nil then
        components.UpgradeButton = CreateScreenComponent({ Name = "ShrineUpgradeMenuConfirm", Scale = 1.1, Group = "Combat_Menu", X = 200, Y = ScreenCenterY + 500 })
        components.UpgradeButton.OnPressedFunctionName = "GodAltarUpgrade"
        components.UpgradeButton.God = godName
        components.UpgradeButton.ToDestroy = true
        components.UpgradeButton.TempToDestroy = true
        CreateTextBox({ Id = components.UpgradeButton.Id, Text = "Upgrade_God_Altar_Cost", FontSize = 22, Color = Color.White,
        LuaKey = "TempTextData", LuaValue = { NextRarity = GetNextGodAltarRarity(godName), Amount = GetNextGodAltarUpgradeCost(godName)},
        Font = "AlegreyaSansSCBold", ShadowBlur = 0, ShadowColor = {68,68,68,255}, ShadowOffset={0, 1},
        Justification = "Center", TextSymbolScale = 0.8, })
    end
end

function CloseGodAltarPanel(screen, button)
    screen.StartingIndex = 0
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

function HandleBoonAltarClick(screen, button)

    local traitData = button.TraitData
    local godName = button.God

    -- unselect currently selected boon
    if ZagreusUpgrade.Data.Boons[godName][1] ~= nil and ZagreusUpgrade.Data.Boons[godName][1].Name == traitData.Name then
        ZagreusUpgrade.Data.Boons[godName] = {}
    else
    -- select new boon
        if traitData.Slot and IsSlotTaken(traitData) then
            -- remove boons in the same slot
            for i, boons in pairs(ZagreusUpgrade.Data.Boons) do
                if boons[1] ~= nil and boons[1].Slot and boons[1].Slot == traitData.Slot then
                    ZagreusUpgrade.Data.Boons[i] = {}
                end
            end
        end
        ZagreusUpgrade.Data.Boons[godName] = {}
        ZagreusUpgrade.Data.Boons[godName][1] = traitData
    end

    DestroyTempButtons(screen)
    CreateGodAltarButtons(screen, godName)
end

function IsSlotTaken(traitData)
    local occupiedSlots = {}

    for i, boons in pairs(ZagreusUpgrade.Data.Boons) do
        if boons[1] ~= nil and boons[1].Name ~= traitData.Name then
            if boons[1].Slot then
                occupiedSlots[boons[1].Slot] = true
            end
        end
    end

    for i, trait in pairs(CurrentRun.Hero.Traits) do
        if trait.Slot then
            occupiedSlots[trait.Slot] = true
        end
    end

    if occupiedSlots[traitData.Slot] then
        DebugPrint({Text="slot occupied!"})
        return true
    else
        return false
    end
end

function DestroyTempButtons(screen)
    local components = screen.Components
    local TempToDestroy = {}
    for i, component in pairs (components) do
        if component.TempToDestroy then
            table.insert(TempToDestroy, component.Id)
        end
    end
    Destroy({Ids = TempToDestroy})
	DestroyTextBox({ Ids = TempToDestroy })
end

function BuildLegalAltarTraitList(godName)

    local traits = {}
    local blackList =
    {
        -- empty
    }

    if LootData[godName].WeaponUpgrades ~= nil then
        for itemIndex, itemName in ipairs( LootData[godName].WeaponUpgrades) do
            if not blackList[itemName] and TraitData[itemName].RarityLevels ~= nil and not TraitData[itemName].RarityLevels.Legendary then
                table.insert(traits, itemName)
            end
        end
    end
    for itemIndex, itemName in ipairs( LootData[godName].Traits or LootData[godName].PermanentTraits ) do
        if not blackList[itemName] and TraitData[itemName].RarityLevels ~= nil and not TraitData[itemName].RarityLevels.Legendary then
            table.insert(traits, itemName)
        end
    end

    return traits
end

function LoadAltarBoons()
    if CurrentDeathAreaRoom ~= nil then
        return
    end
    wait(5)
    for god, boons in pairs(ZagreusUpgrade.Data.Boons) do
        if boons ~= nil then
            if boons[1] ~= nil and not HeroHasTrait(boons[1].Name) and not IsSlotTaken(boons[1]) then
			    thread( InCombatText, CurrentRun.Hero.ObjectId, "Altar_Loaded", 1, { ShadowScale = 1.05, LuaKey = "TempTextData", LuaValue = { God = god }, TextColor = LootData[god].LootColor } )
                PlaySound({ Name = LootData[god].EventEndSound})
                -- PlaySound({ Name = Sounds.Shout[god]})
                AddTraitToHero({ TraitData = boons[1] })
                wait(1)
            end
        end
    end
end


OnAnyLoad{function()
    -- AddResource("SuperLockKeys", 1000, "Item")

    -- ZagreusUpgradeData = ZagreusUpgradeData
    LoadAltarBoons()
end}

for i, trait in pairs (TraitData) do
    if trait.RarityLevels ~= nil and trait.RarityLevels.Legendary == nil then
        TraitData[i].RarityLevels.Incomplete =
        {
            Multiplier = 0.75,
        }
    end
end

function ShowNextGodAltarPage(screen, button)
    if screen.StartingIndex == 0 then
        screen.StartingIndex = 8
    else
        screen.StartingIndex = 0
    end
    DestroyTempButtons(screen)
    CreateGodAltarButtons(screen, button.God)
end

function GetNextGodAltarRarity(godName)
    local altar = ZagreusUpgrade.Data.Altar[godName]
    if altar.Rarity == "Incomplete" then
        return "Common"
    elseif altar.Rarity == "Common" then
        return "Rare"
    elseif altar.Rarity == "Rare" then
        return "Epic"
    elseif altar.Rarity == "Epic" and godName ~= "TrialUpgrade" then
        return "Heroic"
    else
        return nil
    end
end

function GetNextGodAltarUpgradeCost(godName)
    local altar = ZagreusUpgrade.Data.Altar[godName]
    return altar.Level * 5
end

function GodAltarUpgrade(screen, button)
    local altar = ZagreusUpgrade.Data.Altar[button.God]
    local cost = GetNextGodAltarUpgradeCost(button.God)
    local rarity = GetNextGodAltarRarity(button.God)

    if HasResource("SuperLockKeys", cost) and rarity ~= nil then
        altar.Rarity = rarity
        altar.Level = altar.Level + 1
        SpendResource("SuperLockKeys", cost, "Item")
        DestroyTempButtons(screen)
        CreateGodAltarButtons(screen, button.God)
    end
end
