
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
  -- local wp = GetEquippedWeapon()
  -- local lvl = GetLevelTitle(wp)
  -- ModUtil.Hades.PrintStack("Mastery level : "..lvl)
  -- ModUtil.Hades.PrintStack("Mastery experience : "..Mastery[wp].Exp)
end}

OnControlPressed{"Shout",
  function(triggerArgs)
    if Contains(EnabledConfigMaps, CurrentRun.CurrentRoom.Name) then
      OpenMasteryPanel()
      --ModUtil.Hades.PrintStack("open mastery menu")
      return
    end
end}

function OpenMasteryPanel()
  ScreenAnchors.MasteryScreen = DeepCopyTable(MasteryScreen)
  local screen = ScreenAnchors.MasteryScreen
  local components = screen.Components
  local title = "Weapon Mastery"
  local subtitle = "Your mastery over each weapon"
  screen.Name = "MasteryPanel"
  screen.RowStartX = -495
  screen.RowStartY = -170
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
  components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "Mastery_Backing", X = 830, Y = 400})
  components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "Mastery_Backing", X = 490, Y = 464 })
  components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "Mastery_Backing", X = 1710, Y = 423 })
  SetScaleY({Id = components.LeftPart.Id, Fraction = 1.3})
  SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.3})
  SetScaleX({Id = components.MiddlePart.Id, Fraction = 10})
  SetScaleY({Id = components.RightPart.Id, Fraction = 1.3})
  --Title
  CreateTextBox({ Id = components.Background.Id, Text = title, FontSize = 34,
  OffsetX = 100, OffsetY = -370, Color = Color.White, Font = "SpectralSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --SubTitle
  CreateTextBox({ Id = components.Background.Id, Text = subtitle, FontSize = 19,
  OffsetX = 100, OffsetY = -340, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "Mastery" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = ScreenCenterY - 70 })
  components.CloseButton.OnPressedFunctionName = "CloseMasteryPanel"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display
    for index, weapon in pairs(Mastery) do
      if weapon == Mastery.SwordWeapon then
        local weaponKey = "WeaponKey"..index
        local backingKey = "BackingKey"..index

        local wptitle = GetLevelTitle("SwordWeapon")
        local frameTarget = 1 - (weapon.Exp / GetNextLevelExp("SwordWeapon"))
        components[weaponKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery" })
        components[backingKey] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Mastery_Backing" })
        Attach({ Id = components[weaponKey].Id, DestinationId = components.Background.Id, OffsetX = screen.RowStartX, OffsetY = screen.RowStartY })
        Attach({ Id = components[backingKey].Id, DestinationId = components.Background.Id, OffsetX = screen.RowStartX, OffsetY = screen.RowStartY })
        SetAnimation({ Name = "HealthBar", DestinationId = components[backingKey].Id })
        SetAnimation({ Name = "HealthBarFill", DestinationId = components[weaponKey].Id, FrameTarget = frameTarget, Instant = true, Color = Color.Black })

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

function MasteryInit()
  GameState.Mastery = {
    SwordWeapon = {
      Level = 0,
      Exp = 0,
    },
    SpearWeapon = {
      Level = 0,
      Exp = 0,
    },
    ShieldWeapon = {
      Level = 0,
      Exp = 0,
    },
    BowWeapon = {
      Level = 0,
      Exp = 0,
    },
    FistWeapon = {
      Level = 0,
      Exp = 0,
    },
    GunWeapon = {
      Level = 0,
      Exp = 0,
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

function GetNextLevelExp(weapon)
  local nextlvl = Mastery[weapon].Level + 1
  if nextlvl > 8 then
    -- max lvl
    return 0
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
