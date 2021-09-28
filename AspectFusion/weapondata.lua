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
end