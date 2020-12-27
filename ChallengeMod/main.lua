ChallengeSelection = { Components = {} }

OnAnyLoad{"RoomPreRun", function(triggerArgs) 
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
  local subtitle = "Choose your death"
  screen.Name = "ChallengeSelection"
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
  OffsetX = 0, OffsetY = -390, Color = Color.White, Font = "SpectralSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --SubTitle
  CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
  OffsetX = 0, OffsetY = -345, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "ChallengeSelection" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 0, OffsetY = ScreenCenterY - 120 })
  components.CloseButton.OnPressedFunctionName = "CloseChallengeSelection"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display
  components.Challenge1 = CreateScreenComponent({ Name = "BoonSlot1", Group = "ChallengeSelection", Scale = 0.3, })
  components.Challenge1.OnPressedFunctionName = "StartChallenge1"
  Attach({ Id = components.Challenge1.Id, DestinationId = components.Background.Id, OffsetX = -600, OffsetY = -270 })
  CreateTextBox({ Id = components.Challenge1.Id, Text = "Challenge1",
      FontSize = 22, OffsetX = 0, OffsetY = 0, Width = 720, Color = lColor, Font = "AlegreyaSansSCLight",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2}, Justification = "Center"
  })
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

function StartChallenge1()
    RoomSetData.Tartarus.RoomOpening.NextRoomSet = {"Asphodel"}
    StartOver()
end