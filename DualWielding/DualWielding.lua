
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

WeaponList = {
  SwordWeapon =
  {
    Name = "SwordWeapon",
    Icon = "Codex_Portrait_Sword",
    Aspects =
    {
      "SwordBaseUpgradeTrait", "SwordCriticalParryTrait", "DislodgeAmmoTrait", "SwordConsecrationTrait",
    },
  },
  SpearWeapon =
  {
    Name = "SpearWeapon",
    Icon = "Codex_Portrait_Spear",
    Aspects =
    {
      "SpearBaseUpgradeTrait", "SpearTeleportTrait", "SpearWeaveTrait", "SpearSpinTravel",
    },
  },
  ShieldWeapon =
  {
    Name = "ShieldWeapon",
    Icon = "Codex_Portrait_Shield",
    Aspects =
    {
      "ShieldBaseUpgradeTrait", "ShieldRushBonusProjectileTrait", "ShieldTwoShieldTrait", "ShieldLoadAmmoTrait",
    },
  },
  BowWeapon =
  {
    Name = "BowWeapon",
    Icon = "Codex_Portrait_Bow",
    Aspects =
    {
      "BowBaseUpgradeTrait", "BowMarkHomingTrait", "BowLoadAmmoTrait", "BowBondTrait",
    },
  },
  FistWeapon =
  {
    Name = "FistWeapon",
    Icon = "Codex_Portrait_Fist",
    Aspects =
    {
      "FistBaseUpgradeTrait", "FistVacuumTrait", "FistWeaveTrait", "FistDetonateTrait",
    },
  },
  GunWeapon =
  {
    Name = "GunWeapon",
    Icon = "Codex_Portrait_Gun",
    Aspects =
    {
      "GunBaseUpgradeTrait", "GunGrenadeSelfEmpowerTrait", "GunManualReloadTrait", "GunLoadedGrenadeTrait",
    },
  },
}

UpgradeList = {

  SwordWeapon = { "SwordTwoComboTrait", "SwordSecondaryAreaDamageTrait", "SwordHeavySecondStrikeTrait", "SwordThrustWaveTrait", "SwordSecondaryDoubleAttackTrait", "SwordHealthBufferDamageTrait", "SwordDoubleDashAttackTrait", "SwordCriticalTrait", "SwordBackstabTrait", "SwordCursedLifeStealTrait", "SwordGoldDamageTrait", "SwordBlinkTrait", "SwordConsecrationBoostTrait"},

  BowWeapon = { "BowDoubleShotTrait", "BowLongRangeDamageTrait", "BowSlowChargeDamageTrait", "BowTapFireTrait", "BowPenetrationTrait", "BowPowerShotTrait", "BowSecondaryBarrageTrait", "BowTripleShotTrait", "BowSecondaryFocusedFireTrait", "BowChainShotTrait", "BowConsecutiveBarrageTrait", "BowCloseAttackTrait", "BowBondBoostTrait"},

  ShieldWeapon = { "ShieldDashAOETrait", "ShieldRushProjectileTrait", "ShieldThrowFastTrait", "ShieldThrowCatchExplode", "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait", "ShieldBashDamageTrait", "ShieldPerfectRushTrait", "ShieldThrowElectiveCharge", "ShieldThrowEmpowerTrait", "ShieldBlockEmpowerTrait", "ShieldThrowRushTrait", "ShieldLoadAmmoBoostTrait"},

  SpearWeapon = { "SpearReachAttack", "SpearAutoAttack", "SpearThrowExplode", "SpearThrowBounce", "SpearThrowPenetrate", "SpearThrowCritical", "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearDashMultiStrike", "SpearThrowElectiveCharge", "SpearSpinChargeAreaDamageTrait", "SpearAttackPhalanxTrait", "SpearSpinTravelDurationTrait"},

  GunWeapon = { "GunSlowGrenade", "GunMinigunTrait", "GunShotgunTrait", "GunExplodingSecondaryTrait", "GunGrenadeFastTrait", "GunArmorPenerationTrait", "GunInfiniteAmmoTrait", "GunConsecutiveFireTrait", "GunGrenadeClusterTrait", "GunGrenadeDropTrait", "GunHeavyBulletTrait", "GunHomingBulletTrait", "GunChainShotTrait"},

  FistWeapon = { "FistReachAttackTrait", "FistDashAttackHealthBufferTrait", "FistTeleportSpecialTrait", "FistDoubleDashSpecialTrait", "FistChargeSpecialTrait", "FistKillTrait", "FistSpecialLandTrait", "FistAttackFinisherTrait", "FistConsecutiveAttackTrait", "FistSpecialFireballTrait", "FistHeavyAttackTrait", "FistAttackDefenseTrait"},
}

local DualWieldingConfig = { }
local debug = false
local announcementMsg = false
OnAnyLoad{function(triggerArgs)
  if ModUtil ~= nil then
    debug = true
    if not announcementMsg then
      ModUtil.Hades.PrintStack("ModUtil is installed, DualWielding debug messages enabled!")
      announcementMsg = true
    end
  end
  if GameState.DualWieldingConfig == nil then
    GameState.DualWieldingConfig = {
      weapon1 = "none",
      weapon1aspect = "none",
      weapon1aspectIndex = nil,
      weapon2 = "none",
      weapon2aspect = "none",
      weapon2aspectIndex = nil,
      SavedHammerUpgrades1 = {
        Weapon = "",
        Aspect = "",
        Upgrades = { },
      },
      SavedHammerUpgrades2 = {
        Weapon = "",
        Aspect = "",
        Upgrades = { },
      },
     }
  end
  DualWieldingConfig = GameState.DualWieldingConfig
end
}

DualWieldingScreen = { Components = {} }

local swapcd = _worldTime
local atkcd = _worldTime
local combo = 0
local canSwap = false


OnAnyLoad{ "DeathArea",
	function( triggerArgs )
    ResetSavedHammerUpgrades()
  end
}

function ModCheckCooldown(time)
  --only checks swapcd
  if time == nil then
    return
  end
  if swapcd == nil then
    swapcd = _worldTime
    return false
  end
  if _worldTime > swapcd + time then
    swapcd = _worldTime
    return true
  end
  return false
end

function SwapCounter()
  if canSwap then
    CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = CurrentRun.Hero.ObjectId, Scale = 1.2 })
    return
  end
  if combo >= 5 and ModCheckCooldown(5.0) then
    canSwap = true
    combo = 0
    CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = CurrentRun.Hero.ObjectId, Scale = 1.2 })
  else
    combo = combo + 1
  end
end

function CheckSpecialUnequip(aspect)
  if aspect == "ShieldLoadAmmoTrait" then
    RemoveSelfAmmoLoad(CurrentRun.Hero)
  elseif aspect == "BowLoadAmmoTrait" then
    RemoveAmmoLoad(CurrentRun.Hero)
  elseif aspect == "SpearSpinTravel" then
    RemoveSpearGuanYu(CurrentRun.Hero)
  end
end

function CheckHadesShout(traits)
  for i, traitData in pairs(traits) do
    if traitData.Name == "HadesShoutTrait" then
      RemoveTrait(CurrentRun.Hero, traitData.Name)
    end
  end
end

function ResetSavedHammerUpgrades()
  DualWieldingConfig.SavedHammerUpgrades1 = {
    Weapon = "",
    Aspect = "",
    Upgrades = { },
   }
  DualWieldingConfig.SavedHammerUpgrades2 = {
    Weapon = "",
    Aspect = "",
    Upgrades = { },
   }
end

function SaveHammerUpgrades(weapon, aspect, traits)
  if DualWieldingConfig.SavedHammerUpgrades1 == nil or DualWieldingConfig.SavedHammerUpgrades2 == nil then
    ResetSavedHammerUpgrades()
  end
  local upgrades = { }
  for i, traitData in pairs(traits) do
    if IsHammerBoon(traitData.Name) then
      table.insert(upgrades, traitData)
    end
  end
  if upgrades ~= nil then
    if weapon == DualWieldingConfig.weapon1 and aspect == DualWieldingConfig.weapon1aspect then
      DualWieldingConfig.SavedHammerUpgrades1.Weapon = DualWieldingConfig.weapon1
      DualWieldingConfig.SavedHammerUpgrades1.Aspect = DualWieldingConfig.weapon1aspect
      DualWieldingConfig.SavedHammerUpgrades1.Upgrades = upgrades
    elseif weapon == DualWieldingConfig.weapon2 and aspect == DualWieldingConfig.weapon2aspect then
      DualWieldingConfig.SavedHammerUpgrades2.Weapon = DualWieldingConfig.weapon2
      DualWieldingConfig.SavedHammerUpgrades2.Aspect = DualWieldingConfig.weapon2aspect
      DualWieldingConfig.SavedHammerUpgrades2.Upgrades = upgrades
    end
  end
end

function RestoreSavedHammerUpgrades(weapon, aspect)
  if weapon == DualWieldingConfig.weapon1 and aspect == DualWieldingConfig.weapon1aspect then
    if DualWieldingConfig.SavedHammerUpgrades1.Weapon == weapon and DualWieldingConfig.SavedHammerUpgrades1.Aspect and DualWieldingConfig.SavedHammerUpgrades1.Upgrades ~= nil then
      for i, traitData in pairs(DualWieldingConfig.SavedHammerUpgrades1.Upgrades) do
        if not HeroHasTrait(traitData.Name) then
          AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, })})
        end
      end
    end
  elseif weapon == DualWieldingConfig.weapon2 and aspect == DualWieldingConfig.weapon2aspect then
    if DualWieldingConfig.SavedHammerUpgrades2.Weapon == weapon and DualWieldingConfig.SavedHammerUpgrades2.Aspect and DualWieldingConfig.SavedHammerUpgrades2.Upgrades ~= nil then
      for i, traitData in pairs(DualWieldingConfig.SavedHammerUpgrades2.Upgrades) do
        if not HeroHasTrait(traitData.Name) then
          AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, })})
        end
      end
    end
  end
end

function RemoveAllHammerUpgrades(traits)
  for i, traitData in pairs(traits) do
    if IsHammerBoon(traitData.Name) then
      RemoveTrait(CurrentRun.Hero, traitData.Name)
    end
  end
end

function IsHammerBoon(traitName)
	if traitName ~= nil then
		for i, loot in pairs (LootData) do
			if loot.Icon == "WeaponUpgradeSymbol" and loot.TraitIndex[traitName] then
				return true
			end
		end
		return false
	end
end

function SwitchWeapon()
  if DualWieldingConfig == nil or DualWieldingConfig.weapon1 == "none" or DualWieldingConfig.weapon2 == "none" then
    if debug then
      ModUtil.Hades.PrintStack("Cannot swap, config is empty or incomplete!")
    end
    return
  end
  local weapon = GetEquippedWeapon()
  if weapon == DualWieldingConfig.weapon1 and not HeroHasTrait(DualWieldingConfig.weapon2aspect) then
    SaveHammerUpgrades(DualWieldingConfig.weapon1, DualWieldingConfig.weapon1aspect, CurrentRun.Hero.Traits)
    RemoveAllHammerUpgrades(CurrentRun.Hero.Traits)
    CheckSpecialUnequip(DualWieldingConfig.weapon1aspect)
    RemoveTrait(CurrentRun.Hero, DualWieldingConfig.weapon1aspect)
    EquipPlayerWeapon(WeaponData[DualWieldingConfig.weapon2], { PreLoadBinks = true })
    AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = DualWieldingConfig.weapon2aspect,
    Rarity = GetRarityKey(GetWeaponUpgradeLevel( DualWieldingConfig.weapon2, DualWieldingConfig.weapon2aspectIndex )) })})
    RestoreSavedHammerUpgrades(DualWieldingConfig.weapon2, DualWieldingConfig.weapon2aspect)
  else
    SaveHammerUpgrades(DualWieldingConfig.weapon2, DualWieldingConfig.weapon2aspect, CurrentRun.Hero.Traits)
    RemoveAllHammerUpgrades(CurrentRun.Hero.Traits)
    CheckSpecialUnequip(DualWieldingConfig.weapon2aspect)
    RemoveTrait(CurrentRun.Hero, DualWieldingConfig.weapon2aspect)
    EquipPlayerWeapon(WeaponData[DualWieldingConfig.weapon1], { PreLoadBinks = true })
    AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = DualWieldingConfig.weapon1aspect,
    Rarity = GetRarityKey(GetWeaponUpgradeLevel( DualWieldingConfig.weapon1, DualWieldingConfig.weapon1aspectIndex )) })})
    RestoreSavedHammerUpgrades(DualWieldingConfig.weapon1, DualWieldingConfig.weapon1aspect)
  end
  CheckHadesShout(CurrentRun.Hero.Traits)
  DualWieldingReloadAllTraits()
end

function DualWieldingReloadAllTraits()
	-- Remove all traits, then readd them in order
	local shouldSkip = {
		FastClearDodgeBonusTrait = true,
		PerfectClearDamageBonusTrait = true,
    RoomRewardMaxHealthTrait = true,
    RoomRewardEmptyMaxHealthTrait = true
	}
	local weaponName = GetEquippedWeapon()
	local removedTraitData = {}
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		if shouldSkip[traitData.Name] ~= true then
			table.insert(removedTraitData, { Name = traitData.Name, Rarity = traitData.Rarity })
		end
	end

	for i, traitData in pairs(removedTraitData) do
		RemoveTrait( CurrentRun.Hero, traitData.Name )
	end
	-- re-equip all weapons to flush Absolute change values

	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = weaponName })
	local weaponSetNames = WeaponSets.HeroWeaponSets[weaponName]
	if weaponSetNames ~= nil then
		for k, linkedWeaponName in pairs( weaponSetNames ) do
			UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = linkedWeaponName })
		end
	end
	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RangedWeapon "})


	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = weaponName })
	if weaponSetNames ~= nil then
		for k, linkedWeaponName in pairs( weaponSetNames ) do
			EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = linkedWeaponName })
		end
	end
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RangedWeapon" })


	for i, traitData in pairs(removedTraitData) do
		if traitData.Name then
			if traitData.Rarity then
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity}) })
			else
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name }) })
			end
		end
	end
	UpdateHeroTraitDictionary()
end

function SaveDualWieldingConfig(screen, button)
  if DualWieldingConfig == nil or DualWieldingConfig.weapon1 == "none" or DualWieldingConfig.weapon2 == "none" then
    if debug then
      ModUtil.Hades.PrintStack("Cannot save, config is empty or incomplete!")
    end
    return
  end
  GameState.DualWieldingConfig = DualWieldingConfig
  if GameState.DualWieldingConfig ~= nil and GameState.DualWieldingConfig == DualWieldingConfig and DualWieldingConfig.weapon1 ~= "none" and DualWieldingConfig.weapon2 ~= "none" then
    if debug then
      ModUtil.Hades.PrintStack("Config saved successfully!")
    end
  else
    if debug then
      ModUtil.Hades.PrintStack("Error with config, could not save!")
    end
  end
end

function SelectDualWieldingWeapon(screen, button)
  if button.Slot == 1 then
    DualWieldingConfig.weapon1 = button.Weapon
    DualWieldingConfig.weapon1aspect = button.Aspect
    DualWieldingConfig.weapon1aspectIndex = button.Index
    ModifyTextBox({ Id = screen.Components.WeaponDisplay1.Id, Text = DualWieldingConfig.weapon1 })
    ModifyTextBox({ Id = screen.Components.AspectDisplay1.Id, Text = DualWieldingConfig.weapon1aspect })
  else
    DualWieldingConfig.weapon2 = button.Weapon
    DualWieldingConfig.weapon2aspect = button.Aspect
    DualWieldingConfig.weapon2aspectIndex = button.Index
    ModifyTextBox({ Id = screen.Components.WeaponDisplay2.Id, Text = DualWieldingConfig.weapon2 })
    ModifyTextBox({ Id = screen.Components.AspectDisplay2.Id, Text = DualWieldingConfig.weapon2aspect })
  end
end

function OpenDualwieldingConfigMenu()
  ScreenAnchors.DualWieldingScreen = DeepCopyTable(DualWieldingScreen)
  local screen = ScreenAnchors.DualWieldingScreen
  local components = screen.Components
  screen.Name = "DualWieldingConfigMenu"
  screen.RowStartX = -495
  screen.RowStartY = -170
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
  --Close button
  components.CloseButton = CreateScreenComponent({ Name = "ButtonClose", Scale = 0.7, Group = "DualWielding" })
  Attach({ Id = components.CloseButton.Id, DestinationId = components.Background.Id, OffsetX = 100, OffsetY = ScreenCenterY - 70 })
  components.CloseButton.OnPressedFunctionName = "CloseDualWieldingConfigMenu"
  components.CloseButton.ControlHotkey = "Cancel"
  --Display weapon choice
  --Weapon 1
  CreateTextBox({ Id = components.Background.Id, Text = "Weapon 1", FontSize = 19,
  OffsetX = 100, OffsetY = -300, Width = 840, Color = Color.White, Font = "UbuntuMonoBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  local index = 1
  for i, weapon in pairs (WeaponList) do
    local purchaseButtonKey = "PurchaseButton"..index
    local index2 = 1
    local rowoffset = 230
    local columnoffset = 220
    local numperrow = 6
    local offsetX = screen.RowStartX + columnoffset * ((index - 1) % numperrow)
    local offsetY = screen.RowStartY + rowoffset * (math.floor((index - 1) / numperrow))
    components[purchaseButtonKey] = CreateScreenComponent({ Name = "rectangle01", Group = "DualWielding", Scale = 0.4, })
    SetAnimation({ DestinationId = components[purchaseButtonKey].Id, Name = weapon.Icon })
    SetAlpha({ Id = components[purchaseButtonKey].Id, Fraction = 1 })
    SetThingProperty({ Property = "Ambient", Value = 0.0, DestinationId = components[purchaseButtonKey].Id })
    Attach({ Id = components[purchaseButtonKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
    offsetY = offsetY - 75
    for t, aspect in pairs (weapon.Aspects) do
      local aspectPurchaseButtonKey = "AspectPurchaseButton"..index..t
      local aspectRowOffset = 45
      local aspectOffsetX = offsetX + 110
      local aspectOffsetY = offsetY + aspectRowOffset * (math.floor(t - 1))
      components[aspectPurchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "DualWielding", Scale = 0.16, })
      components[aspectPurchaseButtonKey].OnPressedFunctionName = "SelectDualWieldingWeapon"
      components[aspectPurchaseButtonKey].Slot = 1
      components[aspectPurchaseButtonKey].Index = t
      components[aspectPurchaseButtonKey].Weapon = weapon.Name
      components[aspectPurchaseButtonKey].Aspect = aspect
      Attach({ Id = components[aspectPurchaseButtonKey].Id, DestinationId = components.Background.Id, OffsetX = aspectOffsetX, OffsetY = aspectOffsetY })
      CreateTextBox({ Id = components[aspectPurchaseButtonKey].Id, Text = aspect,
        FontSize = 15, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset = {0, 2}, Justification = "Center"
      })
      index2 = index2 +1
    end
    index = index + 1
  end
  --Weapon 2
  CreateTextBox({ Id = components.Background.Id, Text = "Weapon 2", FontSize = 19,
  OffsetX = 100, OffsetY = -60, Width = 840, Color = Color.White, Font = "UbuntuMonoBold",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  for i, weapon in pairs (WeaponList) do
    local purchaseButtonKey = "PurchaseButton"..index
    local index2 = 1
    local rowoffset = 230
    local columnoffset = 220
    local numperrow = 6
    local offsetX = screen.RowStartX + columnoffset * ((index - 1) % numperrow)
    local offsetY = screen.RowStartY + rowoffset * (math.floor((index - 1) / numperrow))
    components[purchaseButtonKey] = CreateScreenComponent({ Name = "rectangle01", Group = "DualWielding", Scale = 0.4, })
    SetAnimation({ DestinationId = components[purchaseButtonKey].Id, Name = weapon.Icon })
    SetAlpha({ Id = components[purchaseButtonKey].Id, Fraction = 1 })
    SetThingProperty({ Property = "Ambient", Value = 0.0, DestinationId = components[purchaseButtonKey].Id })
    Attach({ Id = components[purchaseButtonKey].Id, DestinationId = components.Background.Id, OffsetX = offsetX, OffsetY = offsetY })
    offsetY = offsetY - 75
    for t, aspect in pairs (weapon.Aspects) do
      local aspectPurchaseButtonKey = "AspectPurchaseButton"..index..t
      local aspectRowOffset = 45
      local aspectOffsetX = offsetX + 110
      local aspectOffsetY = offsetY + aspectRowOffset * (math.floor(t - 1))
      components[aspectPurchaseButtonKey] = CreateScreenComponent({ Name = "BoonSlot1", Group = "DualWielding", Scale = 0.16, })
      components[aspectPurchaseButtonKey].OnPressedFunctionName = "SelectDualWieldingWeapon"
      components[aspectPurchaseButtonKey].Slot = 2
      components[aspectPurchaseButtonKey].Index = t
      components[aspectPurchaseButtonKey].Weapon = weapon.Name
      components[aspectPurchaseButtonKey].Aspect = aspect
      Attach({ Id = components[aspectPurchaseButtonKey].Id, DestinationId = components.Background.Id, OffsetX = aspectOffsetX, OffsetY = aspectOffsetY })
      CreateTextBox({ Id = components[aspectPurchaseButtonKey].Id, Text = aspect,
        FontSize = 15, OffsetX = 0, OffsetY = 0, Width = 720, Color = Color.White, Font = "AlegreyaSansSCLight",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset = {0, 2}, Justification = "Center"
      })
      index2 = index2 +1
    end
    index = index + 1
  end
  --Display selection
  components.WeaponDisplay1 = CreateScreenComponent({ Name = "BlankObstacle", Group = "DualWielding", })
  Attach({ Id = components.WeaponDisplay1.Id, DestinationId = components.Background.Id, OffsetX = -200, OffsetY = 200 })
  CreateTextBox({ Id = components.WeaponDisplay1.Id, Text = DualWieldingConfig.weapon1, FontSize = 19,
  OffsetX = 0, OffsetY = 0, Width = 840, Color = Color.White, Font = "AlegreyaSansSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  components.AspectDisplay1 = CreateScreenComponent({ Name = "BlankObstacle", Group = "DualWielding", })
  Attach({ Id = components.AspectDisplay1.Id, DestinationId = components.Background.Id, OffsetX = -200, OffsetY = 240 })
  CreateTextBox({ Id = components.AspectDisplay1.Id, Text = DualWieldingConfig.weapon1aspect, FontSize = 19,
  OffsetX = 0, OffsetY = 0, Width = 840, Color = Color.White, Font = "AlegreyaSansSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })

  components.WeaponDisplay2 = CreateScreenComponent({ Name = "BlankObstacle", Group = "DualWielding", })
  Attach({ Id = components.WeaponDisplay2.Id, DestinationId = components.Background.Id, OffsetX = 400, OffsetY = 200 })
  CreateTextBox({ Id = components.WeaponDisplay2.Id, Text = DualWieldingConfig.weapon2, FontSize = 19,
  OffsetX = 0, OffsetY = 0, Width = 840, Color = Color.White, Font = "AlegreyaSansSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  components.AspectDisplay2 = CreateScreenComponent({ Name = "BlankObstacle", Group = "DualWielding", })
  Attach({ Id = components.AspectDisplay2.Id, DestinationId = components.Background.Id, OffsetX = 400, OffsetY = 240 })
  CreateTextBox({ Id = components.AspectDisplay2.Id, Text = DualWieldingConfig.weapon2aspect, FontSize = 19,
  OffsetX = 0, OffsetY = 0, Width = 840, Color = Color.White, Font = "AlegreyaSansSCLight",
  ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
  --Save button
  -- components.SaveButton = CreateScreenComponent({ Name = "BoonSlot1", Group = "DualWielding", Scale = 0.28, })
  -- components.SaveButton.OnPressedFunctionName = "SaveDualWieldingConfig"
  -- Attach({ Id = components.SaveButton.Id, DestinationId = components.Background.Id, OffsetX = 80, OffsetY = 350 })
  -- CreateTextBox({ Id = components.SaveButton.Id, Text = "Save Config", FontSize = 19,
  -- OffsetX = 0, OffsetY = 0, Width = 840, Color = Color.White, Font = "AlegreyaSansSCLight",
  -- ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Center" })
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
			if ticks > 0 and debug then
        ModUtil.Hades.PrintStack(ticks,0.5)
			end
			wait(0.5)
		end
	end
}
