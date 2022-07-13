if AspectFusion.Config.Enabled then
    WeaponData.UltraFistDetonationWeapon =
    {

    }

    EffectData.UltraMarkRuptureTargetApplicator =
    {
        OnApplyFunctionName = "OnRuptureDashHit",
    }

    EffectData.UltraMarkRuptureTarget =
    {
        OnApplyFunctionName = "MarkRuptureTargetApply",
        OnClearFunctionName = "MarkRuptureTargetApply",
    }

    WeaponData.UltraGunWeapon =
	{
		InheritFrom = { "GunWeapon" },
		DashWeapon = nil,
	}

    WeaponData.UltraSniperGunWeapon =
	{
		InheritFrom = { "GunWeapon" },
		DashWeapon = nil,
		OnFiredFunctionName = "ClearManualReloadVFX",
	}

    --Bow
    ProjectileData.AphroditeBeowulfProjectile.StoreAmmoInLastHit = false
    ProjectileData.AresBeowulfProjectile.StoreAmmoInLastHit = false
    ProjectileData.AthenaDeflectingBeowulfProjectile.StoreAmmoInLastHit = false
end