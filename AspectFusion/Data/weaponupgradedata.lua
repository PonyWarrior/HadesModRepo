if AspectFusion.Config.Enabled then
    WeaponUpgradeData.SwordWeapon[5] =
    {
        Costs = { AspectFusion.Config.FinalFormUnlockBloodCost, 0, 0, 0, 0 },
        MaxUpgradeLevel = 1,
        TraitName = "UltraSwordTrait",
        EquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponSwordAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponSwordAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_SwordAlt03",
        GameStateRequirements =
        {
            RequiredTextLines = { "UltraSwordUnlocked" },
        }
    }
    WeaponUpgradeData.FistWeapon[5] =
    {
        Costs = { AspectFusion.Config.FinalFormUnlockBloodCost, 0, 0, 0, 0 },
        MaxUpgradeLevel = 1,
        TraitName = "UltraFistTrait",
        EquippedKitAnimation = "WeaponFistsAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponFistsAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponFistsAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponFistsAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_FistAlt03",
        UnequipFunctionName = "RemoveFistDetonateDash",
        GameStateRequirements =
        {
            RequiredTextLines = { "UltraFistUnlocked" },
        }
    }
    WeaponUpgradeData.ShieldWeapon[5] =
    {
        Costs = { AspectFusion.Config.FinalFormUnlockBloodCost, 0, 0, 0, 0 },
        MaxUpgradeLevel = 1,
        TraitName = "UltraShieldTrait",
        UnequipFunctionName = "RemoveSelfAmmoLoad",
        EquippedKitAnimation = "WeaponShieldAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponShieldAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponShieldAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponShieldAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_ShieldAlt03",
        GameStateRequirements =
        {
            RequiredTextLines = { "UltraShieldUnlocked" },
        }
    }
    WeaponUpgradeData.SpearWeapon[5] =
    {
        Costs = { AspectFusion.Config.FinalFormUnlockBloodCost, 0, 0, 0, 0 },
        MaxUpgradeLevel = 1,
        TraitName = "UltraSpearTrait",
        UnequipFunctionName = "RemoveSpearGuanYu",
        EquippedKitAnimation = "WeaponSpearAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponSpearAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponSpearAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponSpearAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_SpearAlt03",
        GameStateRequirements =
        {
            RequiredTextLines = { "UltraSpearUnlocked" },
        }
    }
    WeaponUpgradeData.BowWeapon[5] =
    {
        Costs = { AspectFusion.Config.FinalFormUnlockBloodCost, 0, 0, 0, 0 },
        MaxUpgradeLevel = 1,
        TraitName = "UltraBowTrait",
        EquippedKitAnimation = "WeaponBowAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponBowAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponBowAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponBowAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_BowAlt03",
        GameStateRequirements =
        {
            RequiredTextLines = { "UltraBowUnlocked" },
        }
    }
    WeaponUpgradeData.GunWeapon[5] =
    {
        Costs = { AspectFusion.Config.FinalFormUnlockBloodCost, 0, 0, 0, 0 },
        MaxUpgradeLevel = 1,
        TraitName = "UltraGunTrait",
        EquippedKitAnimation = "WeaponGunAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponGunAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponGunAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponGunAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_GunAlt03",
        GameStateRequirements =
        {
            RequiredTextLines = { "UltraGunUnlocked" },
        }
    }
end