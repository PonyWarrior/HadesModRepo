-- add 5th aspect
-- change the aspect menu
-- custom animations
-- custom boons
-- change all the calls

local loaded = false
OnAnyLoad{function(triggerArgs)
  if not loaded then
    loaded = true
    ModUtil.Hades.PrintStack('yolo')
    TraitData.YasuoSwordTrait =
    {
      Name = "YasuoSwordTrait",
      Icon = "WeaponEnchantment_Sword04",
      InheritFrom = { "WeaponEnchantmentTrait" },
      RequiredWeapon = "SwordWeapon",
      AddOnFireWeapons = { "AresProjectile" },
      LegalOnFireWeapons = { "SwordParry" },
      CustomTrayText = "SwordConsecrationTrait_Tray",
      PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt03ParryReturnToIdle",
      PostWeaponUpgradeScreenAngle = 300,
      OnProjectileDeathFunction =
      {
        Name = "ConsecrationFieldDeath",
      },
      RarityLevels =
      {
        Common =
        {
          MinMultiplier = 1.00,
          MaxMultiplier = 1.00,
        },
        Rare =
        {
          MinMultiplier = 1.25,
          MaxMultiplier = 1.25,
        },
        Epic =
        {
          MinMultiplier = 1.50,
          MaxMultiplier = 1.50,
        },
        Heroic =
        {
          MinMultiplier = 1.75,
          MaxMultiplier = 1.75,
        },
        Legendary =
        {
          MinMultiplier = 2.00,
          MaxMultiplier = 2.00,
        },
      },
      PropertyChanges =
      {

        -- Main Attack Changes / Excalibur
        -- {
        --   WeaponNames = { "SwordWeaponDash", "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
        --   WeaponProperty = "FullyAutomatic",
        --   ChangeValue = true,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },

        -- SwordWeaponDash
        -- {
        --   WeaponNames = { "SwordWeaponDash" },
        --   WeaponProperty = "ChargeTime",
        --   ChangeValue = 0.20,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "CancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack1_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack1_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeC-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          ProjectileProperty = "DamageLow",
          ChangeValue = 50,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          ProjectileProperty = "DamageHigh",
          ChangeValue = 50,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },

        -- SwordWeapon
        -- {
        --   WeaponNames = { "SwordWeapon" },
        --   WeaponProperty = "ChargeTime",
        --   ChangeValue = 0.25,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack3_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack3_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeAFlipped-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur2",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },


        -- SwordWeapon2
        -- {
        --   WeaponNames = { "SwordWeapon2" },
        --   WeaponProperty = "ChargeTime",
        --   ChangeValue = 0.35,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack2_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack2_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeA-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur2",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },


        -- SwordWeapon3
        -- {
        --   WeaponNames = { "SwordWeapon3" },
        --   WeaponProperty = "ChargeTime",
        --   ChangeValue = 0.50,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack3_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack3_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeAFlipped-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur2",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },


        -- Sword Parry

        -- {
        --   WeaponNames = { "SwordParry" },
        --   WeaponProperty = "ChargeStartAnimation",
        --   ChangeValue = "ZagreusSwordAlt03ParryCharge",
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        --
        -- {
        --   WeaponNames = { "SwordParry" },
        --   WeaponProperty = "FireGraphic",
        --   ChangeValue = "ZagreusSwordAlt03ParryFire",
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        --
        -- {
        --   WeaponName = "SwordParry",
        --   ProjectileProperty = "DetonateGraphic",
        --   ChangeValue = "RadialNovaSwordParry-Arthur",
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },

        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack1_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack1_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeC-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur1",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },

        -- {
        --   WeaponNames = { "SwordParry" },
        --   WeaponProperty = "ChargeTime",
        --   ChangeValue = 0.5,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },

        {
          WeaponNames = { "SwordParry" },
          ProjectileProperty = "DamageLow",
          ChangeValue = 100,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          ProjectileProperty = "DamageHigh",
          ChangeValue = 100,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },

        -- Ares Projectile
        {
            WeaponNames = { "AresProjectile" },
            ProjectileName = "AresProjectile",
            ProjectileProperty = "DamageRadius",
            ChangeValue = 270,
            ChangeType = "Absolute",
        },
        {
            WeaponNames = { "AresProjectile" },
            ProjectileName = "AresProjectile",
            ProjectileProperty = "Fuse",
            ChangeValue = 0.2,
            ChangeType = "Absolute",
        },
        {
            WeaponNames = { "AresProjectile" },
            ProjectileName = "AresProjectile",
            ProjectileProperty = "TotalFuse",
            ChangeValue = 0.8,
            ChangeType = "Absolute",
        },

        -- {
        --   LuaProperty = "MaxHealth",
        --   ChangeValue = 50,
        --   AsInt = true,
        --   ChangeType = "Add",
        --   ExtractValue =
        --   {
        --     ExtractAs = "TooltipHealth",
        --   }
        -- },
      },
    }
    WeaponUpgradeData.SwordWeapon[5] = {
      Costs = { 0, 0, 0, 0, 0 },
      MaxUpgradeLevel = 5,
      TraitName = "YasuoSwordTrait",
      EquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOff",
      UnequippedKitAnimation = "WeaponSwordAlt03FloatingIdle",
      BonusUnequippedKitAnimation = "WeaponSwordAlt03FloatingIdleBonus",
      BonusEquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOffBonus",
      Image = "Codex_Portrait_SwordAlt03"
    }
  end
end}
