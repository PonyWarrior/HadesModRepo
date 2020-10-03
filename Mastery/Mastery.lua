
local ExpTable = {
  [0] = 0,
  [1] = 3000,
  [2] = 7500,
  [3] = 18750,
  [4] = 46875,
  [5] = 117187,
  [6] = 292968,
  [7] = 732421,
  [8] = 1831052,
}

local LevelTable = {
  SwordWeapon =
  {
  [0] = "Newbie",
  [1] = "Back Alley Bandit",
  [2] = "Sword Polisher",
  [3] = "Squire",
  [4] = "Knight",
  [5] = "Swordsman",
  [6] = "Blademaster",
  [7] = "Sword Saint",
  [8] = "Sword God",
  },
  SpearWeapon =
  {
  [0] = "Newbie",
  [1] = "Street Sweeper",
  [2] = "Pole Keeper",
  [3] = "Squire",
  [4] = "Knight",
  [5] = "Spearman",
  [6] = "Spearmaster",
  [7] = "Spear Saint",
  [8] = "Spear God",
  },
  ShieldWeapon =
  {
  [0] = "Newbie",
  [1] = "Cannon Fodder",
  [2] = "Plank Scrapper",
  [3] = "Squire",
  [4] = "Knight",
  [5] = "Shieldman",
  [6] = "Shieldmaster",
  [7] = "Shield Saint",
  [8] = "Shield God",
  },
  BowWeapon =
  {
  [0] = "Newbie",
  [1] = "Stick Thrower",
  [2] = "Tree Killer",
  [3] = "Wayfarer",
  [4] = "Hunter",
  [5] = "Bowman",
  [6] = "Sharpshooter",
  [7] = "Bow Saint",
  [8] = "Bow God",
  },
  FistWeapon =
  {
  [0] = "Newbie",
  [1] = "Drunkard",
  [2] = "School Bully",
  [3] = "Boxer Apprentice",
  [4] = "Amateur Boxer",
  [5] = "Pro Boxer",
  [6] = "National Champion",
  [7] = "World Champion",
  [8] = "God Fist",
  },
  GunWeapon =
  {
  [0] = "Newbie",
  [1] = "Random Joe",
  [2] = "Sunday Shooter",
  [3] = "Recruit",
  [4] = "Soldier",
  [5] = "Veteran",
  [6] = "Marine",
  [7] = "Gun Saint",
  [8] = "Gun God",
  },
}

local LevelColorTable = {
  [0] = Color.Gray,
  [1] = Color.White,
  [2] = Color.LightGreen,
  [3] = Color.Green,
  [4] = Color.Yellow,
  [5] = Color.OrangeRed,
  [6] = Color.Turquoise,
  [7] = Color.BlueViolet,
  [8] = Color.LocationTextGold,
}

local EnabledConfigMaps = {
  "DeathAreaBedroom", "DeathAreaBedroomHades", "DeathAreaOffice", "RoomPreRun", "RoomOpening",
}

local Mastery = { }
local loaded = false
local tempExp = 0
MasteryScreen = { Components = {} }

OnAnyLoad{function(triggerArgs)
  if GameState.Mastery == nil then
    MasteryInit()
  end
  if not loaded then
    loaded = true
    Mastery = GameState.Mastery
  end
end}

OnControlPressed{"Shout",
  function(triggerArgs)
    if Contains(EnabledConfigMaps, CurrentRun.CurrentRoom.Name) then
      OpenMasteryPanel()
      return
    end
end}

-- function OpenMasteryPanel()
--   ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
--   local screen = ScreenAnchors.MasteryScreen
--   local components = screen.Components
--   local title = "Weapon Mastery"
--   local subtitle = "Your mastery over each weapon"
--   screen.Name = "MasteryPanel"
--   screen.RowStartX = -550
--   screen.RowStartY = -150
--   OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
--   SetConfigOption({ Name = "UseOcclusion", Value = false })
--   FreezePlayerUnit()
--   EnableShopGamepadCursor()
--   PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
--   --Background
--   components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Mastery_Backing" })
--   components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
--   SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
--   SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
--   components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "Mastery_Backing", X = 830, Y = 400})
--   components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "Mastery_Backing", X = 490, Y = 464 })
--   components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "Mastery_Backing", X = 1710, Y = 423 })
--   SetScaleY({Id = components.LeftPart.Id, Fraction = 1.3})
--   SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.3})
--   SetScaleX({Id = components.MiddlePart.Id, Fraction = 10})
--   SetScaleY({Id = components.RightPart.Id, Fraction = 1.3})
--   --Title
--   CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
--   OffsetX = 100, OffsetY = -370, Color = Color.White, Font = "SpectralSCLight",
--   ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
--   --SubTitle
--   CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
--   OffsetX = 100, OffsetY = -340, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
--   ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
--   --Close button
--   components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Mastery" })
--   Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = ScreenCenterY - 70 })
--   components.CloseButton.OnPressedFunctionName = "CloseMasteryPanel"
--   components.CloseButton.ControlHotkey = "Cancel"
--   --Display
--   local index = 1
--   for i, weapon in pairs(Mastery) do
--     weapon.Level = math.random(0, 8)
--     weapon.Exp = math.random(0, GetNextLevelExp(weapon.Name))
--     local weaponKey = "WeaponKey"..index
--     local backingKey = "BackingKey"..index
--     local buttonKey = "ButtonKey"..index
--     local textoffsetX = 50
--     local rowoffset = 330
--     local columnoffset = 440
--     local numperrow = 3
--     local offsetX = screen.RowStartX + columnoffset*((index-1) % numperrow)
--     local offsetY = screen.RowStartY + rowoffset*(math.floor((index-1)/numperrow))
--     local wptitle = GetLevelTitle(weapon.Name)
--     local color = LevelColorTable[weapon.Level]
--     local lvl = "Level : "..weapon.Level
--     local frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
--     components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
--     components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
--     components[buttonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "Mastery_Backing", Scale = 0.37, })
--     components[buttonKey].OnPressedFunctionName = "OpenDetailedMasteryPanel"
--     components[buttonKey].Data = weapon
--     Attach({ Id = components[weaponKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
--     Attach({ Id = components[buttonKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX + 200, OffsetY = offsetY + 25 })
--     Attach({ Id = components[backingKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
--     SetScaleY({Id = components[buttonKey].Id, Fraction = 0.5})
--     SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
--     SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = true, Color = color })
--     --weapon
--     CreateTextBox({ Id = components[weaponKey].Id, Text = weapon.Name, FontSize = 18,
--     OffsetX = textoffsetX, OffsetY = -115, Color = color, Font = "SpectralSCBold",
--     ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
--     --level
--     CreateTextBox({ Id = components[weaponKey].Id, Text = lvl, FontSize = 18,
--     OffsetX = textoffsetX, OffsetY = -85, Color = color, Font = "SpectralSCBold",
--     ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
--     --leveltitle
--     CreateTextBox({ Id = components[weaponKey].Id, Text = wptitle, FontSize = 18,
--     OffsetX = textoffsetX, OffsetY = -55, Color = color, Font = "SpectralSCBold",
--     ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
--     --button
--     CreateTextBox({ Id = components[buttonKey].Id, Text = "Details", FontSize = 16,
--     OffsetX = 0, OffsetY = 0, Color = Color.White, Font = "SpectralSCLight",
--     ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
--
--     index = index + 1
--   end
--   --End
--   screen.KeepOpen = true
--   HandleScreenInput(screen)
-- end

function OpenMasteryPanel()
  ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
  local screen = ScreenAnchors.MasteryScreen
  local components = screen.Components
  local title = "Weapon Mastery"
  local subtitle = "Your mastery over each weapon"
  screen.Name = "MasteryPanel"
  screen.RowStartX = (ScreenCenterX - 1560) - 120
  screen.RowStartY = 490
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Mastery_Backing" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = Color.Black })
  components.BoxRank1 = CreateScreenComponent({ Name = "EndPanelBox", Group = "Mastery_Backing", X = ScreenCenterX, Y = ScreenCenterY - 40, Scale = 0.7 })
  components.BoxRank2 = CreateScreenComponent({ Name = "EndPanelBox", Group = "Mastery_Backing", X = ScreenCenterX - 520, Y = ScreenCenterY + 20, Scale = 0.7 })
  components.BoxRank3 = CreateScreenComponent({ Name = "EndPanelBox", Group = "Mastery_Backing", X = ScreenCenterX + 520, Y = ScreenCenterY + 20, Scale = 0.7 })
  components.TitleBackground = CreateScreenComponent({ Name = "VictoryBG", Group = "Mastery_Backing", X = ScreenCenterX, Y = ScreenCenterY - 430 })
  SetAlpha({ Id = components.TitleBackground.Id, Fraction = 1 })
  SetThingProperty({ Property = "Ambient", Value = 0.0, DestinationId = components.TitleBackground.Id })
  --Title
  CreateTextBox({ Id = components.TitleBackground.Id, Text = title, FontSize = 42,
  OffsetX = 0, OffsetY = 0, Color = Color.LocationTextGold, Font = "SpectralSCLightTitling",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.9, Group = "Mastery" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = -850, OffsetY = ScreenCenterY - 50 })
  components.CloseButton.OnPressedFunctionName = "CloseMasteryPanel"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display
  local index = 1
  for i, weapon in pairs(Mastery) do
    weapon.Level = math.random(0, 8)
    weapon.Exp = math.random(0, GetNextLevelExp(weapon.Name))
  end
  for i, weapon in pairs(Mastery) do
    local rank = GetWeaponRank(weapon)
    if rank > 3 then
      local weaponKey = "WeaponKey"..index
      local backingKey = "BackingKey"..index
      local buttonKey = "ButtonKey"..index
      local textoffsetX = 50
      local rowoffset = 330
      local columnoffset = 518
      local numperrow = 3
      local offsetX = screen.RowStartX + columnoffset*((index-1) % numperrow)
      local offsetY = screen.RowStartY + rowoffset*(math.floor((index-1)/numperrow))
      local wptitle = GetLevelTitle(weapon.Name)
      local color = LevelColorTable[weapon.Level]
      local lvl = "Level : "..weapon.Level
      local frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
      components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
      components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
      components[buttonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "Mastery_Backing", Scale = 0.37, })
      components[buttonKey].OnPressedFunctionName = "OpenDetailedMasteryPanel"
      components[buttonKey].Data = weapon
      Attach({ Id = components[weaponKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
      Attach({ Id = components[buttonKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX + 200, OffsetY = offsetY + 25 })
      Attach({ Id = components[backingKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
      SetScaleY({Id = components[buttonKey].Id, Fraction = 0.5})
      SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
      SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      --weapon
      CreateTextBox({ Id = components[weaponKey].Id, Text = weapon.Name, FontSize = 18,
      OffsetX = textoffsetX, OffsetY = -115, Color = color, Font = "SpectralSCBold",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
      --level
      CreateTextBox({ Id = components[weaponKey].Id, Text = lvl, FontSize = 18,
      OffsetX = textoffsetX, OffsetY = -85, Color = color, Font = "SpectralSCBold",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
      --leveltitle
      CreateTextBox({ Id = components[weaponKey].Id, Text = wptitle, FontSize = 18,
      OffsetX = textoffsetX, OffsetY = -55, Color = color, Font = "SpectralSCBold",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
      --button
      CreateTextBox({ Id = components[buttonKey].Id, Text = "Details", FontSize = 16,
      OffsetX = 0, OffsetY = 0, Color = Color.White, Font = "SpectralSCLight",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })

      index = index + 1
    else
      local weaponKey = "RankedWeaponKey"..rank
      local backingKey = "RankedBackingKey"..rank
      local buttonKey = "RankedButtonKey"..rank
      local titleOffsetX = 200
      local textoffsetX = 50
      local wptitle = GetLevelTitle(weapon.Name)
      local color = LevelColorTable[weapon.Level]
      local lvl = "Level : "..weapon.Level
      local frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
      local offsetX = -200
      local offsetY = -100
      components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
      components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
      components[buttonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "Mastery_Backing", Scale = 0.37, })
      components[buttonKey].OnPressedFunctionName = "OpenDetailedMasteryPanel"
      components[buttonKey].Data = weapon
      --I have the power of god and hardcode on my side
      if rank == 1 then
        Attach({ Id = components[weaponKey].Id, DestinationId = components.BoxRank1.Id, OffsetX = offsetX, OffsetY = offsetY })
        Attach({ Id = components[buttonKey].Id, DestinationId = components.BoxRank1.Id, OffsetX = offsetX + 200, OffsetY = offsetY + 340 })
        Attach({ Id = components[backingKey].Id, DestinationId = components.BoxRank1.Id, OffsetX = offsetX, OffsetY = offsetY })
      elseif rank == 2 then
        Attach({ Id = components[weaponKey].Id, DestinationId = components.BoxRank2.Id, OffsetX = offsetX, OffsetY = offsetY })
        Attach({ Id = components[buttonKey].Id, DestinationId = components.BoxRank2.Id, OffsetX = offsetX + 200, OffsetY = offsetY + 340 })
        Attach({ Id = components[backingKey].Id, DestinationId = components.BoxRank2.Id, OffsetX = offsetX, OffsetY = offsetY })
      elseif rank == 3 then
        Attach({ Id = components[weaponKey].Id, DestinationId = components.BoxRank3.Id, OffsetX = offsetX, OffsetY = offsetY })
        Attach({ Id = components[buttonKey].Id, DestinationId = components.BoxRank3.Id, OffsetX = offsetX + 200, OffsetY = offsetY + 340 })
        Attach({ Id = components[backingKey].Id, DestinationId = components.BoxRank3.Id, OffsetX = offsetX, OffsetY = offsetY })
      end
      SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
      if weapon.Level > 5 then
        if weapon.Level == 8 then
          frameTarget = 1
        end
        local specialKey = "Special"..rank
        local specialKey2 = "Special2"..rank
        local specialKey3 = "Special3"..rank
        components[specialKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
        components[specialKey2] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
        components[specialKey3] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
        Attach({ Id = components[specialKey].Id, DestinationId = components[weaponKey].Id, })
        Attach({ Id = components[specialKey2].Id, DestinationId = components[weaponKey].Id, })
        Attach({ Id = components[specialKey3].Id, DestinationId = components[weaponKey].Id, })
        SetAnimation({ Name = "TrophySparkleEmitter", DestinationId = components[specialKey].Id, Color = color, OffsetX = 150 })
        --SetAnimation({ Name = "WrathBarFullFx", DestinationId = components[specialKey2].Id, Color = color })
        --SetAnimation({ Name = "WrathBarFullFx", DestinationId = components[specialKey].Id, Color = color })
        --ProjectileShieldMirageLight
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      else
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      end
      --weapon
      CreateTextBox({ Id = components[weaponKey].Id, Text = weapon.Name, FontSize = 24,
      OffsetX = titleOffsetX, OffsetY = -155, Color = color, Font = "SpectralSCBold",
      OutlineThickness = 2, OutlineColor = Color.Black,
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
      --level
      CreateTextBox({ Id = components[weaponKey].Id, Text = lvl, FontSize = 18,
      OffsetX = textoffsetX, OffsetY = -85, Color = color, Font = "SpectralSCBold",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
      --leveltitle
      CreateTextBox({ Id = components[weaponKey].Id, Text = wptitle, FontSize = 18,
      OffsetX = textoffsetX, OffsetY = -55, Color = color, Font = "SpectralSCBold",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
      --button
      CreateTextBox({ Id = components[buttonKey].Id, Text = "Details", FontSize = 20,
      OffsetX = 0, OffsetY = 0, Color = Color.LocationTextGold, Font = "SpectralSCLight",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
    end
  end
  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
end

function CloseMasteryPanel(screen, button)
  DisableShopGamepadCursor()
  SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
  SetConfigOption({ Name = "UseOcclusion", Value = true })
  CloseScreen(GetAllIds(screen.Components), 0.1)
  PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
  ScreenAnchors.MasteryScreen = nil
  UnfreezePlayerUnit()
  screen.KeepOpen = false
  OnScreenClosed({ Flag = screen.Name })
end

function OpenDetailedMasteryPanel(screen, button)
  local weapon = button.Data
  CloseMasteryPanel(screen, button)
  ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
  local screen = ScreenAnchors.MasteryScreen
  local components = screen.Components
  local title = weapon.Name
  local subtitle = ""
  screen.Name = "DetailedMasteryPanel"
  screen.RowStartX = -550
  screen.RowStartY = -150
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "Mastery_Backing" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
  -- components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "Mastery_Backing", X = 830, Y = 400})
  -- components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "Mastery_Backing", X = 490, Y = 464 })
  -- components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "Mastery_Backing", X = 1710, Y = 423 })
  -- SetScaleY({Id = components.LeftPart.Id, Fraction = 1.3})
  -- SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.3})
  -- SetScaleX({Id = components.MiddlePart.Id, Fraction = 10})
  -- SetScaleY({Id = components.RightPart.Id, Fraction = 1.3})
  components.ShopBackground = CreateScreenComponent({ Name = "EndPanelBox", Group = "Mastery_Backing", X = ScreenCenterX, Y = ScreenCenterY - 30 })
  --Title
  CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
  OffsetX = 0, OffsetY = -410, Color = Color.White, Font = "SpectralSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --SubTitle
  CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
  OffsetX = 0, OffsetY = -380, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Mastery" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 0, OffsetY = ScreenCenterY - 70 })
  components.CloseButton.OnPressedFunctionName = "CloseMasteryPanel"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display

  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
end

function MasteryInit()
  GameState.Mastery = {
    SwordWeapon = {
      Level = 0,
      Exp = 0,
      Name = "SwordWeapon",
    },
    SpearWeapon = {
      Level = 0,
      Exp = 0,
      Name = "SpearWeapon",
    },
    ShieldWeapon = {
      Level = 0,
      Exp = 0,
      Name = "ShieldWeapon",
    },
    BowWeapon = {
      Level = 0,
      Exp = 0,
      Name = "BowWeapon",
    },
    FistWeapon = {
      Level = 0,
      Exp = 0,
      Name = "FistWeapon",
    },
    GunWeapon = {
      Level = 0,
      Exp = 0,
      Name = "GunWeapon",
    },
  }
end

function GetLevelTitle(weapon)
  local table = LevelTable[weapon]
  local lvl = Mastery[weapon].Level
  return table[lvl]
end

function GetExpMultiplier()
  local heat = GetTotalSpentShrinePoints()
  local heatMultiplier = 1

  if heat == 0 or heat == nil then
  elseif heat <= 10 then
    heatMultiplier = 0.2
  elseif heat <= 20 then
    heatMultiplier = 0.5
  elseif heat > 30 then
    heatMultiplier = 1
  end

  local multiplier = 1 + (heat * heatMultiplier)
  return multiplier
end

function GetWeaponRank(weapon)
  local rank = 1
  for i, otherWeapon in pairs (Mastery) do
    if otherWeapon ~= weapon then
      if otherWeapon.Level > weapon.Level then
        rank = rank + 1
      elseif otherWeapon.Level == weapon.Level then
        if otherWeapon.Exp > weapon.Exp then
          rank = rank + 1
        elseif otherWeapon.Exp == weapon.Exp then
          --should only happen after mod install
          weapon.Exp = weapon.Exp + 1
          rank = rank + 1
        end
      end
    end
  end
  return rank
end

function GetNextLevelExp(weapon)
  local nextlvl = Mastery[weapon].Level + 1
  if nextlvl > 8 then
    -- max lvl
    return Mastery[weapon].Exp + 1
  end
  return ExpTable[nextlvl]
end

function GetNextLevelTitle()
  local wp = GetEquippedWeapon()
  local nextlvl = Mastery[wp].Level + 1
  if nextlvl > 8 then
    -- max lvl
    return 0
  end
  return LevelTable[wp][nextlvl]
end

local baseKill = Kill
function Kill(victim, triggerArgs)
  if triggerArgs.AttackerId == CurrentRun.Hero.ObjectId and victim.Name ~= "TrainingMelee" then
    local wp = GetEquippedWeapon()
    local multiplier = GetTotalSpentShrinePoints() + 1
    Mastery[wp].Exp = Mastery[wp].Exp + (1*multiplier)
    ModUtil.Hades.PrintStack("Mastery experience : "..Mastery[wp].Exp)
  end
  baseKill(victim, triggerArgs)
end
