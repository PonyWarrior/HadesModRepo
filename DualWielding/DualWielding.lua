
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

DualWielding = {
  weapon1 = "BowWeapon",
  weapon1aspect = "BowLoadAmmoTrait",
  weapon2 = "BowWeapon",
  weapon2aspect = "BowMarkHomingTrait",
}

local weapon1 = DualWielding.weapon1
local weapon1aspect = DualWielding.weapon1aspect
local weapon2 = DualWielding.weapon2
local weapon2aspect = DualWielding.weapon2aspect
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

OnHit{
  function (triggerArgs)
    if triggerArgs.TriggeredByTable ~= nil and not triggerArgs.IsInvulnerable and triggerArgs.AttackerId == CurrentRun.Hero.ObjectId then
      SwapCounter()
    end
  end
}

OnControlPressed{ "Rush",
  function (triggerArgs)
    if canSwap then
      canSwap = false
      SwitchWeapon()
    end
  end
}
