ModUtil.RegisterMod("ChallengeMod")

ChallengeSelection = { Components = {} }
ChallengeDetails = { Components = {} }

local HellModePactOptions =
{
  {
    Name = "EnemyDamageShrineUpgrade",
    Level = 5,
  },
  {
    Name = "HealingReductionShrineUpgrade",
    Level = 4,
  },
  {
    Name = "EnemyCountShrineUpgrade",
    Level = 3,
  },
  {
    Name = "EnemyHealthShrineUpgrade",
    Level = 2,
  },
  {
    Name = "NoInvulnerabilityShrineUpgrade",
    Level = 1,
  },
}

OnAnyLoad{"RoomPreRun", function(triggerArgs)
    if GameState.BuildData == nil then
      InitializeBuildData()
    end
    local selector = DeepCopyTable( ObstacleData.SecretDoor )
    selector.ObjectId = SpawnObstacle({ Name = "ShrinePointDoor", Group = "FX_Terrain", DestinationId = CurrentRun.Hero.ObjectId, AttachedTable = selector, OffsetX = -1250, OffsetY = -1150 })
    SetupObstacle( selector )
    AddToGroup({Id = selector.ObjectId, Name = "ChallengeSelector"})
end}

OnUsed{"ChallengeSelector", function(triggerArgs)
    OpenChallengeSelectionScreen()
end}

function OpenChallengeSelectionScreen()
  ScreenAnchors.ChallengeSelection = DeepCopyTable(ChallengeSelection)
  local screen = ScreenAnchors.ChallengeSelection
  local components = screen.Components
  local title = "Challenge Selector"
  local subtitle = "Death comes in many flavors"
  screen.Name = "ChallengeSelection"
  screen.RowStartX = -600
  screen.RowStartY = -270
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "ChallengeSelection" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "ChallengeSelection" })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
  components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "ChallengeSelection", X = 575, Y = 350})
  components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "ChallengeSelection", X = 225, Y = 419 })
  components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "ChallengeSelection", X = 1735, Y = 374 })
  SetScaleY({Id = components.LeftPart.Id, Fraction = 1.4})
  SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.4})
  SetScaleX({Id = components.MiddlePart.Id, Fraction = 12})
  SetScaleY({Id = components.RightPart.Id, Fraction = 1.4})
  --Title
  CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
  OffsetX = -20, OffsetY = -390, Color = Color.White, Font = "SpectralSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --SubTitle
  CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
  OffsetX = -20, OffsetY = -345, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "ChallengeSelection" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = -20, OffsetY = ScreenCenterY - 120 })
  components.CloseButton.OnPressedFunctionName = "CloseChallengeSelection"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display
  local index = 1
  for key, challenge in pairs (ChallengeData) do
    if challenge.IsHardMode then
      -- don't display hard modes on this screen
    else
      local challengeKey = "ChallengeKey"..key
      local rowoffset = 100
      local columnoffset = 300
      local numperrow = 4
      local offsetX = screen.RowStartX + columnoffset*((index-1) % numperrow)
      local offsetY = screen.RowStartY + rowoffset*(math.floor((index-1)/numperrow))
      index = index + 1

      components[challengeKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "ChallengeSelection", Scale = 0.3, })
      components[challengeKey].OnPressedFunctionName = "OpenChallengeDetailsScreen"
      components[challengeKey].Challenge = challenge
      Attach({ Id = components[challengeKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
      CreateTextBox({ Id = components[challengeKey].Id, Text = challenge.Name,
          FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
          ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
      })
    end
  end
  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
end

function OpenChallengeDetailsScreen(dummy, button)
  ScreenAnchors.ChallengeSelection = DeepCopyTable(ChallengeSelection)
  local screen = ScreenAnchors.ChallengeSelection
  local components = screen.Components
  local title = "Challenge Details"
  local subtitle = "Challenge Name"
  local challenge = button.Challenge
  local hardmode = nil
  if challenge.HasHardMode then
    hardmode = ChallengeData[challenge.HardMode]
  end
  screen.Name = "ChallengeDetails"
  screen.RowStartX = -600
  screen.RowStartY = -270
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "ChallengeDetails" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "ChallengeDetails" })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
  components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "ChallengeDetails", X = 925, Y = 350})
  components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "ChallengeDetails", X = 575, Y = 419 })
  components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "ChallengeDetails", X = 1325, Y = 374 })
  SetScaleY({Id = components.LeftPart.Id, Fraction = 1.4})
  SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.4})
  SetScaleX({Id = components.MiddlePart.Id, Fraction = 6})
  SetScaleY({Id = components.RightPart.Id, Fraction = 1.4})
  --Title
  CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
  OffsetX = -20, OffsetY = -390, Color = Color.White, Font = "SpectralSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --SubTitle
  CreateTextBox({ Id = components.Background.Id, Text = "Made by : "..challenge.Author, FontSize = 19,
  OffsetX = -20, OffsetY = -345, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "ChallengeDetails" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = -20, OffsetY = ScreenCenterY - 120 })
  components.CloseButton.OnPressedFunctionName = "CloseChallengeDetails"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display
    --Normal Mode
    CreateTextBox({ Id = components.Background.Id, Text = "Normal Mode", FontSize = 24,
    OffsetX = -20, OffsetY = -250, Color = Color.White, Font = "SpectralSCLight",
    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
    --Description
    CreateTextBox({ Id = components.Background.Id, Text = challenge.Description, FontSize = 19,
    Width = 840, OffsetX = -20, OffsetY = -150, Color = Color.White, Font = "AlegreyaSansRegular",
    ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
    --Normal Start Button
    local normalButtonKey = "NormalStartButton"
    components[normalButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "ChallengeDetails", Scale = 0.3, })
    components[normalButtonKey].OnPressedFunctionName = "HandleChallenge"
    components[normalButtonKey].Challenge = challenge
    Attach({ Id = components[normalButtonKey].Id, DestinationId = components.Background.Id, OffsetX = -250, OffsetY = ScreenCenterY -120 })
    CreateTextBox({ Id = components[normalButtonKey].Id, Text = "Start in Normal Mode",
        FontSize = 21, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
    })

    if challenge.HasHardMode then
      --Hard Mode
      CreateTextBox({ Id = components.Background.Id, Text = "Hard Mode", FontSize = 24,
      OffsetX = -20, OffsetY = 50, Color = Color.Red, Font = "SpectralSCLight",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
      --Hard Mode Description
      CreateTextBox({ Id = components.Background.Id, Text = hardmode.Description, FontSize = 19,
      Width = 840, OffsetX = -20, OffsetY = 150, Color = Color.White, Font = "AlegreyaSansRegular",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
      --Hard Start Button
      local hardButtonKey = "HardStartButton"
      components[hardButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "ChallengeDetails", Scale = 0.3, })
      components[hardButtonKey].OnPressedFunctionName = "HandleChallenge"
      components[hardButtonKey].Challenge = hardmode
      Attach({ Id = components[hardButtonKey].Id, DestinationId = components.Background.Id, OffsetX = 200, OffsetY = ScreenCenterY -120 })
      CreateTextBox({ Id = components[hardButtonKey].Id, Text = "Start in Hard Mode",
      FontSize = 21, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.Red, Font = "AlegreyaSansSCLight",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
    })
    end
  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
end

function CloseChallengeSelection(screen, button)
  DisableShopGamepadCursor()
  SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
  SetConfigOption({ Name = "UseOcclusion", Value = true })
  CloseScreen(GetAllIds(screen.Components), 0.1)
  PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
  ScreenAnchors.ChallengeSelection = nil
  UnfreezePlayerUnit()
  screen.KeepOpen = false
  OnScreenClosed({ Flag = screen.Name })
end

function CloseChallengeDetails(screen, button)
  DisableShopGamepadCursor()
  SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
  SetConfigOption({ Name = "UseOcclusion", Value = true })
  CloseScreen(GetAllIds(screen.Components), 0.1)
  PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
  ScreenAnchors.ChallengeDetails = nil
  UnfreezePlayerUnit()
  screen.KeepOpen = false
  OnScreenClosed({ Flag = screen.Name })
end

local RoomDataBackup
local RoomSetDataBackup

function HandleChallenge(screen, button)
  local challenge = button.Challenge
  if challenge.RestoreRoomData then
	GameState.RestoreRoomData = true
	RoomDataBackup = DeepCopyTable(RoomData)
	RoomSetDataBackup = DeepCopyTable(RoomSetData)
  end
  if challenge.SetupFunction ~= nil then
    _G[challenge.SetupFunction]()
  end

  if challenge.HellMode then
    --Switching the hell mode flag on doesnt automatically add the pact options so I do it manually instead
    if challenge.ForcedPactOptions == nil then
      challenge.ForcedPactOptions = HellModePactOptions
    else
      for i, option in pairs (HellModePactOptions) do
        table.insert(option, challenge.ForcedPactOptions)
      end
    end
  end

  if challenge.ForcedPactOptions ~= nil then
    for i, option in pairs (challenge.ForcedPactOptions) do
      for k, upgradeName in pairs( ShrineUpgradeOrder ) do
        if upgradeName == option.Name then
          local upgradeData = MetaUpgradeData[upgradeName]
          if GameState.MetaUpgrades[upgradeName] < option.Level then
            while GameState.MetaUpgrades[upgradeName] < option.Level do
              IncrementTableValue( GameState.MetaUpgrades, upgradeName )
              ApplyMetaUpgrade( upgradeData, true, GameState.MetaUpgrades[upgradeName] <= 0, true )
            end
          elseif GameState.MetaUpgrades[upgradeName] > option.Level then
            while GameState.MetaUpgrades[upgradeName] > option.Level do
              DecrementTableValue( GameState.MetaUpgrades, upgradeName )
              ApplyMetaUpgrade( upgradeData, true, GameState.MetaUpgrades[upgradeName] <= 0, true )
            end
          end
        end
      end
    end
  end

  if challenge.PlayerModifiers ~= nil then
    for i, modifier in pairs (challenge.PlayerModifiers) do
      if modifier.TargetProperty == "MaxHealth" then
        if modifier.IsMultiplier then
          HeroData.DefaultHero.MaxHealthMultiplier = modifier.Value
        elseif modifier.IsAbsolute then
          HeroData.DefaultHero.MaxHealth = modifier.Value
        elseif modifier.IsFlat then
          HeroData.DefaultHero.MaxHealth = HeroData.DefaultHero.MaxHealth + modifier.Value
        end
      end
    end
  end

  StartOver()
  ChallengeMod.CleanUpUI()
end

function ChallengeMod.CleanUpUI()
	UnblockCombatUI("Overlook")
	EnableCombatControls()
	PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 1.5, FromCurrentLocation = true })
	FocusCamera({ Fraction = 1.0, Duration = 1.5, ZoomType = "Ease" })
	SetSoundCueValue({ Id = MusicId, Names = { "LowPass" }, Value = 0.0, Duration = 0.5 })
	SetSoundCueValue({ Id = MusicId, Names = { "Keys" }, Value = 1.0, Duration = 1.5 })
	SetVolume({ Id = MusicId, Value = 1, Duration = 1.5 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	ClearCameraFocusOverride()
	ShowCombatUI()
	ModifyTextBox({ Id = ScreenAnchors.OverlookText, FadeTarget = 0, FadeDuration = 0.2 })
	killTaggedThreads( "OverlookThread" )
end

ModUtil.Path.Wrap("StartDeathLoopPresentation", function (baseFunc, currentRun)
	if GameState.RestoreRoomData and RoomDataBackup ~= nil and RoomSetDataBackup ~= nil then
		DebugPrint({Text="@ChallengeMod: Restoring Room Data"})
		RoomData = RoomDataBackup
		RoomSetData = RoomSetDataBackup
		GameState.RestoreRoomData = nil
	end
	return baseFunc(currentRun)
end)