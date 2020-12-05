ProjectileData.HestiaProjectile =
{
	InheritFrom = { "NoSlowFrameProjectile", "AphroditeColorProjectile" },

	StoreAmmoInLastHit = true,
}

EffectData.BurnOverTime =
{
	InheritFrom = { "NoSlowFrameEffect", "NoShakeEffect"},
	CancelArmorSpark = true,
	CancelArmorUnitShake = true,
	CancelUnitShake = true,
	CancelVulnerabilitySpark = true,
	CancelRumble = true,
	CancelHitSpark = true,
	CancelUnitHitFlash = true,
	DamageTextStartColor = Color.LightYellow,
	DamageTextColor = Color.DarkRed,
	DamageTextSize = 25,
	OnApplyFunctionName = "BurnOverTimeApply",
	OnClearFunctionName = "BurnOverTimeClear",
}
