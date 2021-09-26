if Climb.Config.Enabled then

ClimbScreen = { Components = {}}
SaveIgnores["ClimbScreen"] = true

function Climb.ShowScreen(door)
    if ScreenAnchors.Climb ~= nil then
        return
    end
	ScreenAnchors.Climb = DeepCopyTable(ClimbScreen)
	local screen = ScreenAnchors.Climb
	local components = screen.Components
	screen.Title = "Will you climb once more or give up?"
	screen.Name = "ClimbScreen"
    screen.Door = door
	OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	FreezePlayerUnit()
	EnableShopGamepadCursor()
	-- PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
	--Background
	components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "ClimbScreen" })
	components.TitleAnchor = CreateScreenComponent({ Name = "BlankObstacle", Group = "ClimbScreen" })
	components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "ClimbScreen" })

    AdjustFrame({ Color = Color.TransparentRed, Duration = 0.0, Fraction = 0 })
	SetScale({ Id = components.BackgroundDim.Id, Fraction = 10 })
	SetColor({ Id = components.BackgroundDim.Id, Color = Color.Black })
	SetAlpha({ Id = components.BackgroundDim.Id, Fraction = 1.0, Duration = 0 })
	--Title
	CreateTextBox({ Id = components.TitleAnchor.Id, Text = screen.Title, FontSize = 38,
	OffsetX = 0, OffsetY = -400, Color = Color.White, Font = "SpectralSCLight",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
	--Display
    components.ContinueButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ClimbScreen", Scale = 0.3, })
    components.ContinueButton.OnPressedFunctionName = "Climb.ButtonClick"
    components.ContinueButton.DoClimb = true
    Attach({ Id = components.ContinueButton.Id, DestinationId = components.Background.Id, OffsetX = -300, OffsetY = 300 })
    CreateTextBox({ Id = components.ContinueButton.Id, Text = "Climb",
        FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
    })
    components.QuitButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "ClimbScreen", Scale = 0.3, })
    components.QuitButton.OnPressedFunctionName = "Climb.ButtonClick"
    components.QuitButton.DoClimb = false
    Attach({ Id = components.QuitButton.Id, DestinationId = components.Background.Id, OffsetX = 300, OffsetY = 300 })
    CreateTextBox({ Id = components.QuitButton.Id, Text = "Give up",
        FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
    })
	--End
	screen.KeepOpen = true
	thread(HandleWASDInput, screen)
	HandleScreenInput(screen)
end

function Climb.CloseScreen(screen)
    DisableShopGamepadCursor()
    SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
    SetConfigOption({ Name = "UseOcclusion", Value = true })
    CloseScreen(GetAllIds(screen.Components), 0.1)
    PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
    ScreenAnchors.Climb = nil
    UnfreezePlayerUnit()
    screen.KeepOpen = false
    OnScreenClosed({ Flag = screen.Name })
end

function Climb.ButtonClick(screen, button)
    if button.DoClimb then
        Climb.CloseScreen(screen)
        Climb.StartNewRunLap()
    else
        local door = screen.Door
        Climb.CloseScreen(screen)
        CheckRunEndPresentation(CurrentRun, door)
    end
end

ModUtil.Path.Wrap("AttemptUseDoor", function (baseFunc, door)

    if not door.ReadyToUse or not CheckRoomExitsReady( CurrentRun.CurrentRoom ) or CheckSpecialDoorRequirement( door ) ~= nil then
		thread( CannotUseDoorPresentation, door )
		return
	end

    -- mod start
    if CurrentRun.CurrentRoom.Name == "D_Boss01" then
        Climb.ShowScreen(door)
        return
    end
    -- mod end
    baseFunc(door)
end)

function Climb.StartNewRunLap()
    AddInputBlock({ Name = "StartOver" })

	ResetUI()

	CurrentRun.DamageRecord = {}
	CurrentRun.HealthRecord = {}
	CurrentRun.ConsumableRecord = {}
	CurrentRun.ActualHealthRecord = {}
	CurrentRun.BlockTimerFlags = {}
	CurrentRun.WeaponsFiredRecord = {}
	CurrentRun.RoomHistory = {}
	UpdateRunHistoryCache( CurrentRun )
	CheckRunStartFlags( CurrentRun )
	BuildMetaupgradeCache()
	CurrentRun.RoomCreations = {}
	CurrentRun.NPCInteractions = {}
	CurrentRun.AnimationState = {}
	CurrentRun.EventState = {}
	CurrentRun.ActivationRecord = {}
	CurrentRun.SpeechRecord = {}
	CurrentRun.TextLinesRecord = {}
	CurrentRun.TriggerRecord = {}
	CurrentRun.UseRecord = {}
	CurrentRun.GiftRecord = {}
	CurrentRun.HintRecord = {}
	CurrentRun.EnemyUpgrades = {}
	CurrentRun.BlockedEncounters = {}
	CurrentRun.InvulnerableFlags = {}
	CurrentRun.PhasingFlags = {}
	CurrentRun.Money = CalculateStartingMoney()
	CurrentRun.MoneySpent = 0
	CurrentRun.MoneyRecord = {}
	CurrentRun.ActiveObjectives = {}
	CurrentRun.RunDepthCache = 1
	CurrentRun.BiomeDepthCache = 1
	CurrentRun.GameplayTime = 0
	CurrentRun.BiomeTime = 0
	CurrentRun.ActiveBiomeTimer = GetNumMetaUpgrades("BiomeSpeedShrineUpgrade") > 0
	CurrentRun.NumRerolls = GetNumMetaUpgrades( "RerollMetaUpgrade" ) + GetNumMetaUpgrades("RerollPanelMetaUpgrade")
	CurrentRun.ThanatosSpawns = 0
	CurrentRun.SupportAINames = {}
	CurrentRun.Hero.TargetMetaRewardsAdjustSpeed = 10.0
	CurrentRun.ClosedDoors = {}
	CurrentRun.CompletedStyxWings = 0
	CurrentRun.TargetShrinePointThreshold = GetCurrentRunClearedShrinePointThreshold( GetEquippedWeapon() )
	CurrentRun.BannedEliteAttributes = {}
    -- Reset caches
    CurrentRun.RoomCountCache = {}
	CurrentRun.BiomeRoomCountCache = {}
	CurrentRun.EncountersOccurredCache = {}
	CurrentRun.EncountersOccurredBiomeCache = {}
	CurrentRun.EncountersCompletedCache = {}
	CurrentRun.EncountersDepthCache = {}
    if ConfigOptionCache.EasyMode then
		CurrentRun.EasyModeLevel = GameState.EasyModeLevel
	end
    -- Reset last stands
    CurrentRun.Hero.LastStands = {}
	InitHeroLastStands( CurrentRun.Hero )

	InitializeRewardStores( CurrentRun )
	SelectBannedEliteAttributes( CurrentRun )

    CurrentRun.CurrentRoom = ChooseStartingRoom( CurrentRun, "Tartarus" )

    StopSound({ Id = AmbientMusicId, Duration = 1.0 })
	AmbientMusicId = nil
	AmbientTrackName = nil
	ResetObjectives()
	killTaggedThreads( RoomThreadName )

	SetConfigOption({ Name = "FlipMapThings", Value = false })

	AddTimerBlock( CurrentRun, "StartOver" )
	SetPersephoneAwayAtRunStart()
	StartNewRunPresentation( CurrentRun )
	RemoveInputBlock({ Name = "StartOver" })
	RemoveTimerBlock( CurrentRun, "StartOver" )
	killTaggedThreads( RoomThreadName )

	AddInputBlock({ Name = "MapLoad" })

	LoadMap({ Name = CurrentRun.CurrentRoom.Name, ResetBinks = true, ResetWeaponBinks = true })
end
end