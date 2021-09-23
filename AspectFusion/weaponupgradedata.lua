if AspectFusion.Config.Enabled then
    WeaponUpgradeData.SwordWeapon[5] =
    {
        Costs = { 0, 0, 0, 0, 0 },
        MaxUpgradeLevel = 0,
        StartsUnlocked = true,
        TraitName = "UltraSwordTrait",
        EquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponSwordAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponSwordAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_SwordAlt03"
    }
    WeaponUpgradeData.FistWeapon[5] =
    {
        Costs = { 0, 0, 0, 0, 0 },
        MaxUpgradeLevel = 0,
        StartsUnlocked = true,
        TraitName = "UltraFistTrait",
        EquippedKitAnimation = "WeaponFistsAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponFistsAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponFistsAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponFistsAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_FistAlt03",
        UnequipFunctionName = "RemoveFistDetonateDash",
    }
    WeaponUpgradeData.ShieldWeapon[5] =
    {
        Costs = { 0, 0, 0, 0, 0 },
        MaxUpgradeLevel = 0,
        StartsUnlocked = true,
        TraitName = "UltraShieldTrait",
        UnequipFunctionName = "RemoveSelfAmmoLoad",
        EquippedKitAnimation = "WeaponShieldAlt03FloatingIdleOff",
        UnequippedKitAnimation = "WeaponShieldAlt03FloatingIdle",
        BonusUnequippedKitAnimation = "WeaponShieldAlt03FloatingIdleBonus",
        BonusEquippedKitAnimation = "WeaponShieldAlt03FloatingIdleOffBonus",
        Image = "Codex_Portrait_ShieldAlt03"
    }
end