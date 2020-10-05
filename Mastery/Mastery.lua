
local ExpTable = {
  [0] = 0,
  [1] = 15000,
  [2] = 37500,
  [3] = 93750,
  [4] = 234375,
  [5] = 585935,
  [6] = 1463490,
  [7] = 3662105,
  [8] = 9155260,
}

-- local ExpTable = {
--   [0] = 0,
--   [1] = 3000,
--   [2] = 7500,
--   [3] = 18750,
--   [4] = 46875,
--   [5] = 117187,
--   [6] = 292968,
--   [7] = 732421,
--   [8] = 1831052,
-- }

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
  "DeathAreaBedroom", "DeathAreaBedroomHades", "DeathAreaOffice", "RoomPreRun",
}

local Mastery = { }
local loaded = false
tempExp = 0
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
    while IsControlDown({ Name = "Shout" }) do
      if IsControlDown({ Name = "Confirm" }) and Contains(EnabledConfigMaps, CurrentDeathAreaRoom.Name) then
        SetColor({ Id = CurrentRun.Hero.ObjectId, Color = Color.MediumPurple})
        CreateAnimation({ Name = "CharonAura", DestinationId = CurrentRun.Hero.ObjectId, Color = Color.VioletPurple})
        CreateAnimation({ Name = "WeaponBonusGlow", DestinationId = CurrentRun.Hero.ObjectId, Color = Color.VioletPurple})
        CreateAnimation({ Name = "ThanatosIdle", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = 50, OffsetY = -50})
        --ProjectileShieldMirageLight RiverWater  GhostParticles  TorchFlame  SmokeRising InspectPointLoopFx  ElysiumBallistaLoop
        --RailgunLineSpear  SecretDoor_RevealedFx Shielded  HadesFlameAura  PoseidonAresProjectileLoop  PoseidonEncounterStartBuffFloor
        --LightningBoltEnemy  ArtemisCritSparkles FuryBeamEmitter BoonOrbFront  WeaponTitanBlood  CharonAura
        --OpenMasteryPanel()
        return
      end
      wait(0.1)
    end
end}

function OpenMasteryPanel()
  ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
  local screen = ScreenAnchors.MasteryScreen
  local components = screen.Components
  local title = "Weapon Mastery"
  local subtitle = "Your mastery over each weapon"
  screen.Name = "MasteryPanel"
  screen.RowStartX = (ScreenCenterX - 1560) - 120
  screen.RowStartY = 535
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
  components.BoxRank1 = CreateScreenComponent({ Name = "EndPanelBox", Group = "Mastery_Backing", X = ScreenCenterX, Y = ScreenCenterY - 10, Scale = 0.7 })
  components.BoxRank2 = CreateScreenComponent({ Name = "EndPanelBox", Group = "Mastery_Backing", X = ScreenCenterX - 520, Y = ScreenCenterY + 30, Scale = 0.7 })
  components.BoxRank3 = CreateScreenComponent({ Name = "EndPanelBox", Group = "Mastery_Backing", X = ScreenCenterX + 520, Y = ScreenCenterY + 30, Scale = 0.7 })
  components.TitleBackground = CreateScreenComponent({ Name = "VictoryBG", Group = "Mastery_Backing", X = ScreenCenterX, Y = ScreenCenterY - 450 })
  SetScaleY({ Id = components.TitleBackground.Id, Fraction = 0.9 })
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
      local frameTarget = 0
      if weapon.Exp < GetNextLevelExp(weapon.Name) then
        frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
      end
      components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
      components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
      components[buttonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "Mastery_Backing", Scale = 0.37, })
      components[buttonKey].OnPressedFunctionName = "OpenDetailedMasteryPanel"
      components[buttonKey].Data = weapon
      Attach({ Id = components[weaponKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
      Attach({ Id = components[buttonKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX + 450, OffsetY = offsetY - 10})
      Attach({ Id = components[backingKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
      SetScaleY({Id = components[buttonKey].Id, Fraction = 0.5})
      SetScaleX({Id = components[buttonKey].Id, Fraction = 0.5})
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
      OffsetX = 0, OffsetY = 0, Color = color, Font = "SpectralSCLight",
      ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })

      index = index + 1
    else
      local weaponKey = "RankedWeaponKey"..rank
      local backingKey = "RankedBackingKey"..rank
      local buttonKey = "RankedButtonKey"..rank
      local box = 0
      local specialAnim = ""
      local titleOffsetX = 200
      local textoffsetX = 50
      local wptitle = GetLevelTitle(weapon.Name)
      local color = LevelColorTable[weapon.Level]
      local lvl = "Level : "..weapon.Level
      local frameTarget = 0
      local offsetX = -200
      local offsetY = -100
      if weapon.Exp < GetNextLevelExp(weapon.Name) then
        frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
      end
      components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
      components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
      components[buttonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "Mastery_Backing", Scale = 0.37, })
      components[buttonKey].OnPressedFunctionName = "OpenDetailedMasteryPanel"
      components[buttonKey].Data = weapon
      SetScaleY({Id = components[buttonKey].Id, Fraction = 0.5})
      --I have the power of god and hardcode on my side
      if rank == 1 then
        Attach({ Id = components[weaponKey].Id, DestinationId = components.BoxRank1.Id, OffsetX = offsetX, OffsetY = offsetY })
        Attach({ Id = components[buttonKey].Id, DestinationId = components.BoxRank1.Id, OffsetX = offsetX + 200, OffsetY = offsetY + 320 })
        Attach({ Id = components[backingKey].Id, DestinationId = components.BoxRank1.Id, OffsetX = offsetX, OffsetY = offsetY })
        box = components.BoxRank1.Id
      elseif rank == 2 then
        Attach({ Id = components[weaponKey].Id, DestinationId = components.BoxRank2.Id, OffsetX = offsetX, OffsetY = offsetY })
        Attach({ Id = components[buttonKey].Id, DestinationId = components.BoxRank2.Id, OffsetX = offsetX + 200, OffsetY = offsetY + 320 })
        Attach({ Id = components[backingKey].Id, DestinationId = components.BoxRank2.Id, OffsetX = offsetX, OffsetY = offsetY })
        box = components.BoxRank2.Id
      elseif rank == 3 then
        Attach({ Id = components[weaponKey].Id, DestinationId = components.BoxRank3.Id, OffsetX = offsetX, OffsetY = offsetY })
        Attach({ Id = components[buttonKey].Id, DestinationId = components.BoxRank3.Id, OffsetX = offsetX + 200, OffsetY = offsetY + 320 })
        Attach({ Id = components[backingKey].Id, DestinationId = components.BoxRank3.Id, OffsetX = offsetX, OffsetY = offsetY })
        box = components.BoxRank3.Id
      end
      if weapon.Level > 5 then
        if weapon.Level == 8 then
          specialAnim = "BoonOrbFront"
          frameTarget = 0
          SetAnimation({ Name = "EndPanelBox_Hades", DestinationId = box, Color = color })
        elseif weapon.Level == 7 then
          specialAnim = "WeaponTitanBlood"
          SetAnimation({ Name = "EndPanelBox_Chthonic", DestinationId = box, Color = color })
        elseif weapon.Level == 6 then
          specialAnim = "RiverWater"
          SetAnimation({ Name = "EndPanelBox_Stone", DestinationId = box, Color = color })
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
        SetAnimation({ Name = "WrathBarFullFx", DestinationId = components[specialKey].Id, Color = color })
        SetAnimation({ Name = "ProjectileShieldMirageLight", DestinationId = components[specialKey2].Id, Color = color, OffsetX = 210, OffsetY = -30 })
        SetScaleY({Id = components[specialKey2].Id, Fraction = 3.6})
        SetAnimation({ Name = specialAnim, DestinationId = components[specialKey3].Id, Color = color, OffsetX = 202, OffsetY = 385, Scale = 1 })
        --ProjectileShieldMirageLight RiverWater  GhostParticles  TorchFlame  SmokeRising InspectPointLoopFx  ElysiumBallistaLoop
        --RailgunLineSpear  SecretDoor_RevealedFx Shielded  HadesFlameAura  PoseidonAresProjectileLoop  PoseidonEncounterStartBuffFloor
        --LightningBoltEnemy  ArtemisCritSparkles FuryBeamEmitter BoonOrbFront
        SetAnimation({ Name = "WrathBar", DestinationId = components[backingKey].Id, Color = color })
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      else
        SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      end
      --weapon
      CreateTextBox({ Id = components[weaponKey].Id, Text = weapon.Name, FontSize = 24,
      OffsetX = titleOffsetX, OffsetY = -145, Color = color, Font = "SpectralSCBold",
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
      OffsetX = 0, OffsetY = 0, Color = color, Font = "SpectralSCLight",
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
  if screen.Name == "MasteryLevelUpPresentation" and not Contains(EnabledConfigMaps, CurrentDeathAreaRoom.Name) then
    EndEarlyAccessPresentation()
  end
end

function OpenDetailedMasteryPanel(screen, button)
  local weapon = button.Data
  CloseMasteryPanel(screen, button)
  ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
  local screen = ScreenAnchors.MasteryScreen
  local components = screen.Components
  local title = weapon.Name
  local subtitle = ""
  local lvl = "Level : "..weapon.Level
  local totalExp = "Total Experience : "..weapon.Exp
  local nextlvlExp = "Next Level : "..GetNextLevelExp(weapon.Name)
  local nextlvlTitle = ""
  local rank = GetWeaponRank(weapon)
  local wptitle = GetLevelTitle(weapon.Name)
  local bestclear = GetFastestRunClearTimeWithWeapon(CurrentRun, weapon.Name)
  local numclears = "Times Cleared : "..GetNumRunsClearedWithWeapon(weapon.Name)
  local weaponKills = "Foes Slain : "..GameState.WeaponKills[weapon.Name]
  local color = LevelColorTable[weapon.Level]
  local boxOverlay = ""
  local specialAnim = ""
  local frameTarget = 0
  if weapon.Exp < GetNextLevelExp(weapon.Name) then
    frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
  end
  local textoffsetX = -250
  local titleOffsetX = 0
  local weaponKey = "RankedWeaponKey"..rank
  local backingKey = "RankedBackingKey"..rank
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
  SetColor({ Id = components.BackgroundDim.Id, Color = Color.Black })
  components.ShopBackground = CreateScreenComponent({ Name = "EndPanelBox", Group = "Mastery_Backing", X = ScreenCenterX, Y = ScreenCenterY - 30 })
  --Title
  CreateTextBox({ Id = components.ShopBackground.Id, Text = title, FontSize = 32,
  OffsetX = 0, OffsetY = -580, Color = Color.LocationTextGold, Font = "SpectralSCBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --SubTitle
  CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
  OffsetX = 0, OffsetY = -380, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Mastery" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = -850, OffsetY = ScreenCenterY - 70 })
  components.CloseButton.OnPressedFunctionName = "CloseMasteryPanel"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display
  components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
  components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
  if weapon.Level > 5 then
    if weapon.Level == 8 then
      specialAnim = "BoonOrbFront"
      boxOverlay = "EndPanelBox_Hades"
      nextlvlExp = "Next Level : 0"
      frameTarget = 0
    elseif weapon.Level == 7 then
      specialAnim = "WeaponTitanBlood"
      boxOverlay = "EndPanelBox_Chthonic"
    elseif weapon.Level == 6 then
      specialAnim = "RiverWater"
      boxOverlay = "EndPanelBox_Stone"
    end
    SetAnimation({ Name = boxOverlay, DestinationId = components.ShopBackground.Id, Color = color })
    local specialKey = "Special"..rank
    local specialKey2 = "Special2"..rank
    local specialKey3 = "Special3"..rank
    components[specialKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
    components[specialKey2] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
    components[specialKey3] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
    Attach({ Id = components[specialKey].Id, DestinationId = components[weaponKey].Id, })
    Attach({ Id = components[specialKey2].Id, DestinationId = components[weaponKey].Id, })
    Attach({ Id = components[specialKey3].Id, DestinationId = components[weaponKey].Id, })
    SetAnimation({ Name = "WrathBarFullFx", DestinationId = components[specialKey].Id, Color = color })
    SetAnimation({ Name = "ProjectileShieldMirageLight", DestinationId = components[specialKey2].Id, Color = color, OffsetX = 195, OffsetY = 80, Scale = 2 })
    SetScaleY({Id = components[specialKey2].Id, Fraction = 5})
    SetAnimation({ Name = specialAnim, DestinationId = components[specialKey3].Id, Color = color, OffsetX = 195, OffsetY = 610, Scale = 1 })
    SetAnimation({ Name = "WrathBar", DestinationId = components[backingKey].Id, Color = color })
    SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
  else
    SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
    SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
  end
  --weapon
  CreateTextBox({ Id = components.ShopBackground.Id, Text = weapon.Name, FontSize = 32,
  OffsetX = titleOffsetX, OffsetY = -350, Color = color, Font = "SpectralSCBold",
  OutlineThickness = 2, OutlineColor = Color.Black,
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --level
  CreateTextBox({ Id = components.ShopBackground.Id, Text = lvl, FontSize = 22,
  OffsetX = titleOffsetX, OffsetY = -275, Color = color, Font = "SpectralSCBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --leveltitle
  CreateTextBox({ Id = components.ShopBackground.Id, Text = wptitle, FontSize = 22,
  OffsetX = titleOffsetX, OffsetY = -235, Color = color, Font = "SpectralSCBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --bars
  Attach({ Id = components[weaponKey].Id, DestinationId = components.ShopBackground.Id, OffsetX = -195, OffsetY = -145 })
  Attach({ Id = components[backingKey].Id, DestinationId = components.ShopBackground.Id, OffsetX = -195, OffsetY = -145 })
  --Data
  bestclear = "Best Time : "..GetTimerString( bestclear, 2 )
  CreateTextBox({ Id = components.ShopBackground.Id, Text = totalExp, FontSize = 18,
  OffsetX = textoffsetX, OffsetY = -65, Color = color, Font = "SpectralSCBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
  CreateTextBox({ Id = components.ShopBackground.Id, Text = nextlvlExp, FontSize = 18,
  OffsetX = textoffsetX, OffsetY = -35, Color = color, Font = "SpectralSCBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
  CreateTextBox({ Id = components.ShopBackground.Id, Text = bestclear, FontSize = 18,
  OffsetX = textoffsetX, OffsetY = -5, Color = color, Font = "SpectralSCBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
  CreateTextBox({ Id = components.ShopBackground.Id, Text = numclears, FontSize = 18,
  OffsetX = textoffsetX, OffsetY = 25, Color = color, Font = "SpectralSCBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
  CreateTextBox({ Id = components.ShopBackground.Id, Text = weaponKills, FontSize = 18,
  OffsetX = textoffsetX, OffsetY = 55, Color = color, Font = "SpectralSCBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
end

function MasteryInit()
  GameState.Mastery = {
    SwordWeapon = {
      Level = 0,
      Exp = 1,
      Name = "SwordWeapon",
    },
    SpearWeapon = {
      Level = 0,
      Exp = 2,
      Name = "SpearWeapon",
    },
    ShieldWeapon = {
      Level = 0,
      Exp = 3,
      Name = "ShieldWeapon",
    },
    BowWeapon = {
      Level = 0,
      Exp = 4,
      Name = "BowWeapon",
    },
    FistWeapon = {
      Level = 0,
      Exp = 5,
      Name = "FistWeapon",
    },
    GunWeapon = {
      Level = 0,
      Exp = 6,
      Name = "GunWeapon",
    },
  }
end

function OpenLevelUpPanel(weapon)
  if weapon.Level == 8 then
    return
  end
  AdjustColorGrading({ Name = "Alert", Duration = 0 })
  AdjustFullscreenBloom({ Name = "NewType10", Duration = 1.4 })
	PlaySound({ Name = "/SFX/SurvivalChallengeStart" })
	thread( DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.17, Duration = 0.4 }, } )
  wait(1.0)
  ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
  local screen = ScreenAnchors.MasteryScreen
  local components = screen.Components
  local title = "Level up !"
  screen.Name = "MasteryLevelUpScreen"
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  PlaySound({ Name = "/SFX/TheseusCrowdChant" })
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "MasteryLevelUp_Backing" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp_Backing" })
  components.WeaponBG = CreateScreenComponent({ Name = "EndPanelBox", Group = "MasteryLevelUp_Backing", X = ScreenCenterX, Y = ScreenCenterY + 30, Scale = 0.7 })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = { 0, 0, 0, 255 }, })
  SetAlpha({ Id = components.BackgroundDim.Id, Fraction = 0 })
  --Display
    if 1 == 1 then
      local weaponKey = "RankedWeaponKey"
      local backingKey = "RankedBackingKey"
      local buttonKey = "RankedButtonKey"
      local specialAnim = ""
      local titleOffsetX = 200
      local textoffsetX = 50
      local wptitle = GetLevelTitle(weapon.Name)
      local color = LevelColorTable[weapon.Level]
      local lvl = "Level : "..weapon.Level
      local frameTarget = 0
      if weapon.Exp < GetNextLevelExp(weapon.Name) then
        frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
      end
      local offsetX = -200
      local offsetY = -100
      components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp" })
      components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp_Backing" })
      --I have the power of god and hardcode on my side
      Attach({ Id = components[weaponKey].Id, DestinationId = components.WeaponBG.Id, OffsetX = offsetX, OffsetY = offsetY })
      Attach({ Id = components[backingKey].Id, DestinationId = components.WeaponBG.Id, OffsetX = offsetX, OffsetY = offsetY })
      if weapon.Level > 5 then
        if weapon.Level == 8 then
          specialAnim = "BoonOrbFront"
          frameTarget = 0
          SetAnimation({ Name = "EndPanelBox_Hades", DestinationId = components.WeaponBG.Id, Color = color })
        elseif weapon.Level == 7 then
          specialAnim = "WeaponTitanBlood"
          SetAnimation({ Name = "EndPanelBox_Chthonic", DestinationId = components.WeaponBG.Id, Color = color })
        elseif weapon.Level == 6 then
          specialAnim = "RiverWater"
          SetAnimation({ Name = "EndPanelBox_Stone", DestinationId = components.WeaponBG.Id, Color = color })
        end
        local specialKey = "Special"
        local specialKey2 = "Special2"
        local specialKey3 = "Special3"
        components[specialKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
        components[specialKey2] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
        components[specialKey3] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
        Attach({ Id = components[specialKey].Id, DestinationId = components[weaponKey].Id, })
        Attach({ Id = components[specialKey2].Id, DestinationId = components[weaponKey].Id, })
        Attach({ Id = components[specialKey3].Id, DestinationId = components[weaponKey].Id, })
        SetAnimation({ Name = "WrathBarFullFx", DestinationId = components[specialKey].Id, Color = color })
        SetAnimation({ Name = "ProjectileShieldMirageLight", DestinationId = components[specialKey2].Id, Color = color, OffsetX = 210, OffsetY = -30 })
        SetScaleY({Id = components[specialKey2].Id, Fraction = 3.6})
        SetAnimation({ Name = specialAnim, DestinationId = components[specialKey3].Id, Color = color, OffsetX = 202, OffsetY = 385, Scale = 1 })
        SetAnimation({ Name = "WrathBar", DestinationId = components[backingKey].Id, Color = color })
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      else
        SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      end
      --weapon
      CreateTextBox({ Id = components[weaponKey].Id, Text = weapon.Name, FontSize = 24,
      OffsetX = titleOffsetX, OffsetY = -145, Color = color, Font = "SpectralSCBold",
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
      --Presentation
      thread( DisplayLocationText, nil, { Text = "3", Delay = 0.0, Color = Color.LocationTextGold, FadeColor = Color.LocationTextGold, Layer = "MasteryLevelUp_Backing", Duration = 1.0, AnimationName = "LocationTextBGVictoryIn", AnimationOutName = "LocationTextBGVictoryOut", FontScale = 0.85 } )
      PlaySound({ Name = "/SFX/ThanatosAttackBell" })
      wait(1.0)
      SetAlpha({ Id = components.BackgroundDim.Id, Fraction = 0.33, Duration = 0.5 })
      thread( DisplayLocationText, nil, { Text = "2", Delay = 0.0, Color = Color.LocationTextGold, FadeColor = Color.LocationTextGold, Layer = "MasteryLevelUp_Backing", Duration = 1.0, AnimationName = "LocationTextBGVictoryIn", AnimationOutName = "LocationTextBGVictoryOut", FontScale = 0.85 } )
      PlaySound({ Name = "/SFX/ThanatosAttackBell" })
      wait(1.0)
      SetAlpha({ Id = components.BackgroundDim.Id, Fraction = 0.66, Duration = 0.5 })
      thread( DisplayLocationText, nil, { Text = "1", Delay = 0.0, Color = Color.LocationTextGold, FadeColor = Color.LocationTextGold, Layer = "MasteryLevelUp_Backing", Duration = 1.0, AnimationName = "LocationTextBGVictoryIn", AnimationOutName = "LocationTextBGVictoryOut", FontScale = 0.85 } )
      PlaySound({ Name = "/SFX/ThanatosAttackBell" })
      wait(1.0)
      SetAlpha({ Id = components.BackgroundDim.Id, Fraction = 1.0, Duration = 0.5 })
      LevelUpPresentation(screen, weapon)
    else
    end
  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
end

function LevelUpPresentation(screen, weapon)
  CloseMasteryPanel(screen)
  ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
  local screen = ScreenAnchors.MasteryScreen
  local components = screen.Components
  local title = "Level up !"
  screen.Name = "MasteryLevelUpPresentation"
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "MasteryLevelUp_Backing" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp_Backing" })
  components.WeaponBG = CreateScreenComponent({ Name = "EndPanelBox", Group = "MasteryLevelUp_Backing", X = ScreenCenterX, Y = ScreenCenterY + 30, Scale = 0.7 })
  components.Banner = CreateScreenComponent({ Name = "VictoryBG", Group = "MasteryLevelUp_Backing", X = ScreenCenterX, Y = 115 })
  SetAlpha({ Id = components.Banner.Id, Fraction = 1 })
  SetThingProperty({ Property = "Ambient", Value = 0.0, DestinationId = components.Banner.Id })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = Color.Transparent })
  --Title
  CreateTextBox({ Id = components.Banner.Id, Text = title, FontSize = 42,
  OffsetX = 0, OffsetY = 0, Color = Color.LocationTextGold, Font = "SpectralSCLightTitling",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "MasteryLevelUp" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 0, OffsetY = ScreenCenterY - 70 })
  components.CloseButton.OnPressedFunctionName = "CloseMasteryPanel"
  components.CloseButton.ControlHotkey = "Cancel"
  --Special Fx
  components.SpecialDisplay = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp" })
  Attach({ Id = components.SpecialDisplay.Id, DestinationId = components.Background.Id })
  PlaySound({ Name = "/SFX/ZeusWrathThunder" })
  local vos = {
    --Very nice.
    [1] = "/VO/ZagreusField_0228",
    --Excellent.
    [2] = "/VO/ZagreusField_0230",
    --Oh, yes!
    [3] = "/VO/ZagreusField_4097",
  }
  local vo = vos[math.random(1, 3)]
  PlaySound({ Name = vo })
  if weapon.Level > 5 then
    if weapon.Level == 6 then

    elseif weapon.Level == 7 then

    else
      --no level ups for 8
      CloseMasteryPanel(screen)
      return
    end
  else
  end
  --Display
  weapon.Level = weapon.Level + 1
  local weaponKey = "RankedWeaponKey"
  local backingKey = "RankedBackingKey"
  local buttonKey = "RankedButtonKey"
  local specialAnim = ""
  local titleOffsetX = 200
  local textoffsetX = 50
  local wptitle = GetLevelTitle(weapon.Name)
  local color = LevelColorTable[weapon.Level]
  local lvl = "Level : "..weapon.Level
  local frameTarget = 0
  if weapon.Exp < GetNextLevelExp(weapon.Name) then
    frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
  end
  local offsetX = -200
  local offsetY = -100
  components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp" })
  components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp_Backing" })
  --I have the power of god and hardcode on my side
  Attach({ Id = components[weaponKey].Id, DestinationId = components.WeaponBG.Id, OffsetX = offsetX, OffsetY = offsetY })
  Attach({ Id = components[backingKey].Id, DestinationId = components.WeaponBG.Id, OffsetX = offsetX, OffsetY = offsetY })
  if weapon.Level > 5 then
    if weapon.Level == 8 then
      specialAnim = "BoonOrbFront"
      frameTarget = 0
      SetAnimation({ Name = "EndPanelBox_Hades", DestinationId = components.WeaponBG.Id, Color = color })
    elseif weapon.Level == 7 then
      specialAnim = "WeaponTitanBlood"
      SetAnimation({ Name = "EndPanelBox_Chthonic", DestinationId = components.WeaponBG.Id, Color = color })
    elseif weapon.Level == 6 then
      specialAnim = "RiverWater"
      SetAnimation({ Name = "EndPanelBox_Stone", DestinationId = components.WeaponBG.Id, Color = color })
    end
    local specialKey = "Special"
    local specialKey2 = "Special2"
    local specialKey3 = "Special3"
    components[specialKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp" })
    components[specialKey2] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp" })
    components[specialKey3] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryLevelUp" })
    Attach({ Id = components[specialKey].Id, DestinationId = components[weaponKey].Id, })
    Attach({ Id = components[specialKey2].Id, DestinationId = components[weaponKey].Id, })
    Attach({ Id = components[specialKey3].Id, DestinationId = components[weaponKey].Id, })
    SetAnimation({ Name = "WrathBarFullFx", DestinationId = components[specialKey].Id, Color = color })
    SetAnimation({ Name = "ProjectileShieldMirageLight", DestinationId = components[specialKey2].Id, Color = color, OffsetX = 210, OffsetY = -30 })
    SetScaleY({Id = components[specialKey2].Id, Fraction = 3.6})
    SetAnimation({ Name = specialAnim, DestinationId = components[specialKey3].Id, Color = color, OffsetX = 202, OffsetY = 385, Scale = 1 })
    SetAnimation({ Name = "WrathBar", DestinationId = components[backingKey].Id, Color = color })
    SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
  else
    SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
    SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
  end
  --weapon
  CreateTextBox({ Id = components[weaponKey].Id, Text = weapon.Name, FontSize = 24,
  OffsetX = titleOffsetX, OffsetY = -145, Color = color, Font = "SpectralSCBold",
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
  --End
  AdjustColorGrading({ Name = "Off", Duration = 0.45 })
  AdjustFullscreenBloom({ Name = "Off", Duration = 0.45 })
  screen.KeepOpen = true
  HandleScreenInput(screen)
end

function OpenProgressionPanel()
  local wp = GetEquippedWeapon()
  local weapon = Mastery[wp]
  if tempExp == 0 or weapon == nil or weapon.Level == 8 then
    return
  end
  ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
  local screen = ScreenAnchors.MasteryScreen
  local components = screen.Components
  screen.Name = "MasteryProgressionScreen"
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "MasteryProgression_Backing" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryProgression_Backing" })
  components.WeaponBG = CreateScreenComponent({ Name = "EndPanelBox", Group = "MasteryProgression_Backing", X = ScreenCenterX, Y = ScreenCenterY + 30, Scale = 0.7 })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "MasteryProgression" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 0, OffsetY = ScreenCenterY - 70 })
  components.CloseButton.OnPressedFunctionName = "CloseMasteryPanel"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display
    if 1 == 1 then
      local weaponKey = "RankedWeaponKey"
      local backingKey = "RankedBackingKey"
      local buttonKey = "RankedButtonKey"
      local specialAnim = ""
      local titleOffsetX = 200
      local textoffsetX = 50
      local wptitle = GetLevelTitle(weapon.Name)
      local color = LevelColorTable[weapon.Level]
      local lvl = "Level : "..weapon.Level
      local frameTarget = 0
      if weapon.Exp < GetNextLevelExp(weapon.Name) then
        frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
      end
      local offsetX = -200
      local offsetY = -100
      components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryProgression" })
      components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryProgression_Backing" })
      --I have the power of god and hardcode on my side
      Attach({ Id = components[weaponKey].Id, DestinationId = components.WeaponBG.Id, OffsetX = offsetX, OffsetY = offsetY })
      Attach({ Id = components[backingKey].Id, DestinationId = components.WeaponBG.Id, OffsetX = offsetX, OffsetY = offsetY })
      if weapon.Level > 5 then
        if weapon.Level == 8 then
          specialAnim = "BoonOrbFront"
          frameTarget = 0
          SetAnimation({ Name = "EndPanelBox_Hades", DestinationId = components.WeaponBG.Id, Color = color })
        elseif weapon.Level == 7 then
          specialAnim = "WeaponTitanBlood"
          SetAnimation({ Name = "EndPanelBox_Chthonic", DestinationId = components.WeaponBG.Id, Color = color })
        elseif weapon.Level == 6 then
          specialAnim = "RiverWater"
          SetAnimation({ Name = "EndPanelBox_Stone", DestinationId = components.WeaponBG.Id, Color = color })
        end
        local specialKey = "Special"
        local specialKey2 = "Special2"
        local specialKey3 = "Special3"
        components[specialKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryProgression" })
        components[specialKey2] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryProgression" })
        components[specialKey3] = CreateScreenComponent({ Name = "BlankObstacle", Group = "MasteryProgression" })
        Attach({ Id = components[specialKey].Id, DestinationId = components[weaponKey].Id, })
        Attach({ Id = components[specialKey2].Id, DestinationId = components[weaponKey].Id, })
        Attach({ Id = components[specialKey3].Id, DestinationId = components[weaponKey].Id, })
        SetAnimation({ Name = "WrathBarFullFx", DestinationId = components[specialKey].Id, Color = color })
        SetAnimation({ Name = "ProjectileShieldMirageLight", DestinationId = components[specialKey2].Id, Color = color, OffsetX = 210, OffsetY = -30 })
        SetScaleY({Id = components[specialKey2].Id, Fraction = 3.6})
        SetAnimation({ Name = specialAnim, DestinationId = components[specialKey3].Id, Color = color, OffsetX = 202, OffsetY = 385, Scale = 1 })
        SetAnimation({ Name = "WrathBar", DestinationId = components[backingKey].Id, Color = color })
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      else
        SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      end
      --weapon
      CreateTextBox({ Id = components[weaponKey].Id, Text = weapon.Name, FontSize = 24,
      OffsetX = titleOffsetX, OffsetY = -145, Color = color, Font = "SpectralSCBold",
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

      wait(2.0)
      weapon.Exp = weapon.Exp + tempExp
      tempExp = 0
      if weapon.Exp >= GetNextLevelExp(weapon.Name) then
        frameTarget = 0
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
        wait(1.0)
        CloseMasteryPanel(screen)
        wait(0.2)
        OpenLevelUpPanel(weapon)
      else
        frameTarget = 1 - (weapon.Exp / GetNextLevelExp(weapon.Name))
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = false, Color = color })
      end
    else
    end
  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
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
  if triggerArgs ~= nil and triggerArgs.AttackerId ~= nil and triggerArgs.AttackerId == CurrentRun.Hero.ObjectId and victim.Name ~= "TrainingMelee" then
    local multiplier = GetTotalSpentShrinePoints() + 1
    tempExp = tempExp + (1*multiplier)
  end
  CreateAnimation({ Name = "ThanatosAoE", DestinationId = triggerArgs.triggeredById, Color = Color.VioletPurple})
  PlaySound({ Name = "/SFX/ThanatosAttackBell" })
  baseKill(victim, triggerArgs)
end

OnHit{function(triggerArgs)
  local victim = triggerArgs.TriggeredByTable
  if triggerArgs.TriggeredByTable == nil or triggerArgs.IsInvulnerable or triggerArgs.AttackerId ~= CurrentRun.Hero.ObjectId or
  triggerArgs.triggeredById == CurrentRun.Hero.ObjectId or victim.CosmeticApplied == true then
    return
  end
  victim.CosmeticApplied = true
  PlaySound({ Name = "/SFX/HellFireImpact" })
  SetColor({ Id = triggerArgs.triggeredById, Color = Color.Purple})
  CreateAnimation({ Name = "HadesConsumeHealFxLoop", DestinationId = triggerArgs.triggeredById, Color = Color.VioletPurple})
end}

local baseCloseRunClearScreen = CloseRunClearScreen
function CloseRunClearScreen()
  baseCloseRunClearScreen()
  OpenProgressionPanel()
end

OnAnyLoad{ "DeathArea",
function(triggerArgs)
  wait(3.0)
  if tempExp > 0 then
    tempExp = tempExp * 0.4
    OpenProgressionPanel()
  end
end}
