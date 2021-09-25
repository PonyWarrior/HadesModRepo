if Continue.Config.Enabled then

ContinueScreen = { Components = {}}
SaveIgnores["ContinueScreen"] = true

function Continue.ShowContinueScreen()
    DebugPrint({Text="@@Showing screen"})
    if ScreenAnchors.Continue ~= nil then
        return
    end

    ScreenAnchors.Continue = DeepCopyTable(ContinueScreen)
    local screen = ScreenAnchors.Continue
    local components = screen.Components
    screen.Title = "Continue?"
    screen.Name = "ContinueScreen"
    OnScreenOpened({ Flag = screen.Name })
    SetConfigOption({ Name = "UseOcclusion", Value = false })
    EnableShopGamepadCursor()
    -- PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
    --Background
    components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_UI" })
    components.TitleAnchor = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_UI" })
    components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Combat_UI" })
    SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
    SetColor({ Id = components.BackgroundDim.Id, Color = { 0, 0, 0, 255 } })
    --Title
    CreateTextBox({ Id = components.TitleAnchor.Id, Text = screen.Title, FontSize = 38,
    OffsetX = 0, OffsetY = -400, Color = Color.White, Font = "SpectralSCLight",
    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
    --Display
    components.ContinueButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "Combat_UI", Scale = 0.3, })
    components.ContinueButton.OnPressedFunctionName = "Continue.ButtonClick"
    components.ContinueButton.Retry = true
    Attach({ Id = components.ContinueButton.Id, DestinationId = components.Background.Id, OffsetX = -300, OffsetY = 300 })
    CreateTextBox({ Id = components.ContinueButton.Id, Text = "Continue",
        FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
    })
    components.QuitButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "Combat_UI", Scale = 0.3, })
    components.QuitButton.OnPressedFunctionName = "Continue.ButtonClick"
    components.QuitButton.Retry = false
    Attach({ Id = components.QuitButton.Id, DestinationId = components.Background.Id, OffsetX = 300, OffsetY = 300 })
    CreateTextBox({ Id = components.QuitButton.Id, Text = "Quit",
        FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
    })
    --End
    screen.KeepOpen = true
    thread(HandleWASDInput, screen)
    HandleScreenInput(screen)
end

function Continue.CloseScreen(screen)
    DisableShopGamepadCursor()
    SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
    SetConfigOption({ Name = "UseOcclusion", Value = true })
    CloseScreen(GetAllIds(screen.Components), 0.1)
    ScreenAnchors.Continue = nil
    screen.KeepOpen = false
    OnScreenClosed({ Flag = screen.Name })
end

function Continue.ButtonClick(screen, button)
    Continue.Retry = button.Retry
    Continue.CloseScreen(screen)
    notify("Continue")
end

ModUtil.Path.Wrap("DeathPresentation", function (baseFunc, currentRun, killer, killingUnitWeapon)
    baseFunc(currentRun, killer, killingUnitWeapon)
    -- Remove death animation leftover
	SetThingProperty({ Property = "Graphic", Value = "HeroEnd", DestinationId = CurrentRun.Hero.ObjectId })
end)

ModUtil.Path.Wrap("StartRoom", function (baseFunc, currentRun, currentRoom)
    -- grab values for reset
    Continue.BiomeTime = currentRun.BiomeTime
    Continue.Health = currentRun.Hero.Health
    Continue.GameplayTime = currentRun.GameplayTime
    baseFunc(currentRun, currentRoom)
end)

ModUtil.Path.Override("HandleDeath", function (currentRun, killer, killingUnitWeapon)
    if GetConfigOptionValue({ Name = "EditingMode" }) then
		SetAnimation({ Name = "ZagreusDeadStartBlood", DestinationId = currentRun.Hero.ObjectId })
		return
	end

	SendSaveFileEmail({ })

	AddTimerBlock( currentRun, "HandleDeath" )
	if ScreenAnchors.TraitTrayScreen ~= nil then
		CloseAdvancedTooltipScreen()
	end
	ClearHealthShroud()
	CurrentRun.Hero.HandlingDeath = true
	CurrentRun.Hero.IsDead = true
	CurrentRun.ActiveBiomeTimer = false
	if ConfigOptionCache.EasyMode and not currentRun.Cleared then
		GameState.EasyModeLevel = GameState.EasyModeLevel + 1
	end
	if not CurrentRun.Cleared then -- Already recorded if cleared
		RecordRunStats()
	end

	InvalidateCheckpoint()

	ZeroSuperMeter()
	FinishTargetMarker( killer )

	local deathPresentationName = currentRun.DeathPresentationFunctionName or "DeathPresentation"
	local deathPresentationFunction = _G[deathPresentationName]
	deathPresentationFunction( currentRun, killer, killingUnitWeapon )

    --mod start
    thread(Continue.ShowContinueScreen)
    waitUntil("Continue")

    local currentRoom = currentRun.CurrentRoom.Name
	local deathMap = "DeathArea"

    if Continue.Retry then
        DebugPrint({Text="@@Continue"})
        local continue = DeepCopyTable(Continue)
        CurrentRun.Hero.HandlingDeath = false
        CurrentRun.Hero.IsDead = false
        CurrentRun.Hero.Health = Continue.Health
        CurrentRun.ActiveBiomeTimer = GetNumMetaUpgrades("BiomeSpeedShrineUpgrade") > 0
        CurrentRun.BlockTimerFlags = {}
        CreateRoom(currentRun.CurrentRoom)
	    LoadMap({ Name = currentRoom, ResetBinks = true, ResetWeaponBinks = true })
        CurrentRun.BiomeTime = continue.BiomeTime
        -- CurrentRun.GameplayTime = continue.GameplayTime
        return
    else
        DebugPrint({Text="@@Quit"})
        map = deathMap
    end

    --mod end

	AddInputBlock({ Name = "MapLoad" })

	currentRun.CurrentRoom.EndingHealth = currentRun.Hero.Health
	currentRun.EndingMoney = currentRun.Money
	table.insert( currentRun.RoomHistory, currentRun.CurrentRoom )
	UpdateRunHistoryCache( currentRun, currentRun.CurrentRoom )

	currentRun.Money = 0
	currentRun.NumRerolls = GetNumMetaUpgrades( "RerollMetaUpgrade" ) + GetNumMetaUpgrades("RerollPanelMetaUpgrade")

	ResetObjectives()
	ActiveScreens = {}

	CurrentRun.Hero.HandlingDeath = false
	CurrentRun.Hero.Health = CurrentRun.Hero.MaxHealth


	GameState.LocationName = "Location_Home"
	RandomSetNextInitSeed()
	SaveCheckpoint({ StartNextMap = deathMap, DevSaveName = CreateDevSaveName( currentRun, { StartNextMap = deathMap } ) })
	ClearUpgrades()

	SetConfigOption({ Name = "FlipMapThings", Value = false })

	local runNumber = (GetCompletedRuns()+1)
	local runDepth = GetRunDepth( currentRun )

	LoadMap({ Name = deathMap, ResetBinks = true, ResetWeaponBinks = true })
end)
end