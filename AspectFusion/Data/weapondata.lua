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

end