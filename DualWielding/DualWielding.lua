
-- SwordWeapon : Stygian Blade
--   SwordBaseUpgradeTrait : Aspect of Zagreus
--   SwordCriticalParryTrait : Aspect of Nemesis
--   DislodgeAmmoTrait : Aspect of Poseidon
--   SwordConsecrationTrait : Aspect of Arthur
-- SpearWeapon : Eternal Spear
--   SpearBaseUpgradeTrait : Aspect of Zagreus
--   SpearTeleportTrait : Aspect of Achilles
--   SpearWeaveTrait : Aspect of Hades
--   SpearSpinTravel : Aspect of Guan Yu
-- ShieldWeapon : Shield of Chaos
--   ShieldBaseUpgradeTrait : Aspect of Zagreus
--   ShieldTwoShieldTrait : Aspect of Zeus
--   ShieldRushBonusProjectileTrait : Aspect of Chaos
--   ShieldLoadAmmoTrait : Aspect of Beowulf
-- BowWeapon : Heart-Seeking Bow
--   BowBaseUpgradeTrait : Aspect of Zagreus
--   BowLoadAmmoTrait : Aspect of Hera
--   BowMarkHomingTrait : Aspect of Chiron
--   BowBondTrait : Aspect of Rama
-- FistWeapon : Twin Fists
--   FistBaseUpgradeTrait : Aspect of Zagreus
--   FistVacuumTrait : Aspect of Talos
--   FistWeaveTrait : Aspect of Demeter
--   FistDetonateTrait : Aspect of Gilgamesh
-- GunWeapon : Adamant Rail
--   GunBaseUpgradeTrait : Aspect of Zagreus
--   GunManualReloadTrait : Aspect of Hestia
--   GunGrenadeSelfEmpowerTrait : Aspect of Eris
--   GunLoadedGrenadeTrait : Aspect of Lucifer

local config = {
  weapon1 = "BowWeapon",
  weapon1aspect = "BowLoadAmmoTrait",
  weapon2 = "BowWeapon",
  weapon2aspect = "BowMarkHomingTrait",
}

DualWieldingScreen = { Components = {} }

local weapon1 = config.weapon1
local weapon1aspect = config.weapon1aspect
local weapon2 = config.weapon2
local weapon2aspect = config.weapon2aspect
local swapcd = _worldTime
local atkcd = _worldTime
local combo = 0
local canSwap = false

function ModCheckCooldown(name, time)
  if time == nil then
    return
  end
  if name == nil then
    name = _worldTime
    return false
  end
  if _worldTime > name + time then
    name = _worldTime
    return true
  end
  return false
end

function SwapCounter()
  if canSwap then
    -- ModUtil.Hades.PrintStack('can swap', 3, Color.Yellow, Color.TransparentBlack, 25)
    CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = CurrentRun.Hero.ObjectId, Scale = 1.2 })
    return
  end
  if combo >= 5 and ModCheckCooldown(swapcd, 5.0) then
    canSwap = true
    combo = 0
    -- ModUtil.Hades.PrintStack('can swap', 3, Color.Yellow, Color.TransparentBlack, 25)
    CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = CurrentRun.Hero.ObjectId, Scale = 1.2 })
  else
    combo = combo + 1
  end
end

function SwitchWeapon()
  local weapon = GetEquippedWeapon()
  if weapon == weapon1 and not HeroHasTrait(weapon2aspect) then
    RemoveTrait(CurrentRun.Hero, weapon1aspect)
    EquipPlayerWeapon(WeaponData[weapon2], { PreLoadBinks = true })
    AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = weapon2aspect,
    Rarity = GetRarityKey(GetWeaponUpgradeLevel( weapon2, 1 )) })})
  else
    RemoveTrait(CurrentRun.Hero, weapon2aspect)
    EquipPlayerWeapon(WeaponData[weapon1], { PreLoadBinks = true })
    AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = weapon1aspect,
    Rarity = GetRarityKey(GetWeaponUpgradeLevel( weapon1, 1 )) })})
  end
  ReloadAllTraits()
end

function OpenDualwieldingConfigMenu()
  ScreenAnchors.DualWieldingScreen = DeepCopyTable(DualWieldingScreen)
  local screen = ScreenAnchors.DualWieldingScreen
  local components = screen.Components
  screen.Name = "DualWieldingConfigMenu"
  screen.RowStartX = -350
  screen.RowStartY = -270
  OnScreenOpened({ Flag = screen.Name, PersistCombatUI = true })
  SetConfigOption({ Name = "UseOcclusion", Value = false })
  FreezePlayerUnit()
  EnableShopGamepadCursor()
  PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })
  --Background
  components.BackgroundDim = CreateScreenComponent({ Name = "rectangle01", Group = "DualWielding" })
  components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "DualWielding" })
  SetScale({ Id = components.BackgroundDim.Id, Fraction = 4 })
  SetColor({ Id = components.BackgroundDim.Id, Color = {0.090, 0.055, 0.157, 0.8} })
  components.LeftPart = CreateScreenComponent({ Name = "TraitTrayBackground", Group = "DualWielding", X = 830, Y = 400})
  components.MiddlePart = CreateScreenComponent({ Name = "TraitTray_Center", Group = "DualWielding", X = 490, Y = 464 })
  components.RightPart = CreateScreenComponent({ Name = "TraitTray_Right", Group = "DualWielding", X = 1710, Y = 423 })
  SetScaleY({Id = components.LeftPart.Id, Fraction = 1.3})
  SetScaleY({Id = components.MiddlePart.Id, Fraction = 1.3})
  SetScaleX({Id = components.MiddlePart.Id, Fraction = 10})
  SetScaleY({Id = components.RightPart.Id, Fraction = 1.3})
  --Title
  CreateTextBox({ Id = components.Background.Id, Text = "DualWielding Config Menu", FontSize = 34,
  OffsetX = 100, OffsetY = -370, Color = Color.White, Font = "SpectralSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  CreateTextBox({ Id = components.Background.Id, Text = "Instructions here", FontSize = 19,
  OffsetX = 100, OffsetY = -340, Width = 840, Color = Color.SubTitle, Font = "CrimsonTextItalic",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "DualWielding" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = ScreenCenterY - 70 })
  components.CloseButton.OnPressedFunctionName = "CloseDualWieldingConfigMenu"
  components.CloseButton.ControlHotkey = "Cancel"
  --End
  screen.KeepOpen = true
  HandleScreenInput(screen)
end

function CloseDualWieldingConfigMenu(screen, button)
  DisableShopGamepadCursor()
  SetConfigOption({ Name = "FreeFormSelectWrapY", Value = false })
  SetConfigOption({ Name = "UseOcclusion", Value = true })
  CloseScreen(GetAllIds(screen.Components), 0.1)
  PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
  ScreenAnchors.DualWieldingScreen = nil
  UnfreezePlayerUnit()
  screen.KeepOpen = false
  OnScreenClosed({ Flag = screen.Name })
end

OnHit{
  function (triggerArgs)
    if triggerArgs.TriggeredByTable ~= nil and not triggerArgs.IsInvulnerable and triggerArgs.AttackerId == CurrentRun.Hero.ObjectId then
      SwapCounter()
    end
  end
}

OnControlPressed{ "Reload",
  function (triggerArgs)
    if canSwap then
      canSwap = false
      SwitchWeapon()
    end
  end
}

OnControlPressed{ "Shout",
	function( triggerArgs )
		local ticks = 0
		wait(0.25)
		while IsControlDown({ Name = "Shout" }) do
			ticks = ticks + 1
			if ticks > 3 then
        OpenDualwieldingConfigMenu()
				return
			end
			if ticks > 0 then
        ModUtil.Hades.PrintStack(ticks,0.5)
			end
			wait(0.5)
		end
	end
}
