TraitData.HestiaWeaponTrait =
{
	Icon = "Boon_Dionysus_01",
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Slot = "Melee",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.0,
		},
		Rare =
		{
			MinMultiplier = 1.25,
			MaxMultiplier = 1.25,

		},
		Epic =
		{
			MinMultiplier = 1.5,
			MaxMultiplier = 1.5,
		},
		Heroic =
		{
			Multiplier = 1.75,
		}
	},
	PropertyChanges =
	{
		{
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "BurnOverTime",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName = "BurnOverTime",
			EffectProperty = "Amount",
			ChangeType = "Add",
			BaseMin = 1,
			BaseMax = 1,
			MinMultiplier = 0.335,
			AsInt = true,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipPoisonDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipPoisonStacks",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "MaxStacks",
		},
		{
			ExtractAs = "TooltipPoisonRate",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "Cooldown",
			DecimalPlaces = 1,
		}
	}
}

TraitData.HestiaRangedTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hestia",
	Icon = "Boon_Aphrodite_02",
	RequiredFalseTrait = "ShieldLoadAmmoTrait",
	Slot = "Ranged",
	UnloadAmmoOffset = -20,
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.0,
		},
		Rare =
		{
			Multiplier = 1.11,
		},
		Epic =
		{
			Multiplier = 1.22,
		},
		Heroic =
		{
			Multiplier = 1.33,
		}
	},
	PropertyChanges =
	{
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "Projectile",
			ChangeValue = "HestiaProjectile",
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "ProjectileSpacing",
			ChangeValue = 0,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "Scale",
			ChangeValue = 0.5,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "ProjectileAngleOffset",
			ChangeValue = 25,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "AutoLockRange",
			ChangeValue = 440,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "DetonateChildGraphics",
			ChangeValue = "Cone180Athena",
			ChangeType = "Absolute",
		},

		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			WeaponProperty = "FireFx",
			ChangeValue = "ProjectileFireRing-Aphrodite",
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "BurnOverTime",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			EffectName = "BurnOverTime",
			EffectProperty = "Amount",
			ChangeType = "Add",
			BaseMin = 1,
			BaseMax = 1,
			MinMultiplier = 0.335,
			AsInt = true,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "DamageLow",
			BaseMin = 90,
			BaseMax = 90,
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = DuplicateStrongMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "BaseRangedDamage",
			External = true,
			BaseType = "Projectile",
			BaseName = "RangedWeapon",
			BaseProperty = "DamageLow",
		},
		{
			ExtractAs = "TooltipWeakDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ReduceDamageOutput",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipWeakPower",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "ReduceDamageOutput",
			BaseProperty = "Modifier",
			Format = "NegativePercentDelta"
		}
	}
}

TraitData.HestiaRushTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Slot = "Rush",
	Icon = "Boon_Dionysus_03",
	RarityLevels =
	{
		Common =
		{
			MinMultiplier = 1.0,
			MaxMultiplier = 1.0,
		},
		Rare =
		{
			MinMultiplier = 1.5,
			MaxMultiplier = 1.5,

		},
		Epic =
		{
			MinMultiplier = 2.0,
			MaxMultiplier = 2.0,
		},
		Heroic =
		{
			MinMultiplier = 2.5,
			MaxMultiplier = 2.5,
		}
	},
	WeaponDataOverride =
	{
		RushWeapon =
		{
			CauseImpactReaction = false,
			ImpactReactionHitsOverride = 0,
		},
	},
	PropertyChanges =
	{
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			WeaponProperty = "Projectile",
			ChangeValue = "HestiaDashProjectile",
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			WeaponProperty = "BlinkDetonateAtOrigin",
			ChangeValue = true,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			WeaponProperty = "BlinkDetonateAtEndpoint",
			ChangeValue = false,
			ChangeType = "Absolute",
		},
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "BurnOverTime",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName = "BurnOverTime",
			EffectProperty = "Amount",
			BaseMin = 1,
			BaseMax = 1,
			ChangeType = "Add",
			AsInt = true,
			MinMultiplier = 0.5,
			IdenticalMultiplier =
			{
				Value = -0.8,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipPoisonDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipPoisonStacks",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "MaxStacks",
		},
		{
			ExtractAs = "TooltipPoisonRate",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "Cooldown",
			DecimalPlaces = 1,
		}
	}
}

TraitData.HestiaSecondaryTrait =
{
	Icon = "Boon_Dionysus_00",
	InheritFrom = { "ShopTier1Trait" },
	God = "Hera",
	Slot = "Secondary",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.0,
		},
		Rare =
		{
			MinMultiplier = 1.2,
			MaxMultiplier = 1.2,

		},
		Epic =
		{
			MinMultiplier = 1.4,
			MaxMultiplier = 1.4,
		},
		Heroic =
		{
			Multiplier = 1.6,
		}
	},
	PropertyChanges =
	{
		{
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "BurnOverTime",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName = "BurnOverTime",
			EffectProperty = "Amount",
			BaseMin = 1,
			BaseMax = 1,
			AsInt = true,
			MinMultiplier = 0.25,
			ChangeType = "Add",
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		{
			TraitName = "GunLoadedGrenadeTrait",
			WeaponNames = { "GunGrenadeToss" },
			ProjectileProperty = "GroupName",
			ChangeValue = "FX_Standing_Add",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		},
	},
	EnemyPropertyChanges =
	{
		{
			TraitName = "GunLoadedGrenadeTrait",
			LegalUnits = { "GunBombUnit" },
			ThingProperty = "Graphic",
			ChangeValue = "LuciferBomb-Dionysus",
			ChangeType = "Absolute",
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipPoisonDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipPoisonStacks",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "MaxStacks",
		},
		{
			ExtractAs = "TooltipPoisonRate",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DamageOverTime",
			BaseProperty = "Cooldown",
			DecimalPlaces = 1,
		}
	}
}

TraitData.HestiaShoutTrait =
{
	InheritFrom = { "ShopTier1Trait" },
	RequiredTextLines = { "PoseidonWrathIntro01" },
	CustomTrayText = "DemeterShoutTrait_Tray",
	God = "Demeter",
	Slot = "Shout",
	Icon = "Boon_Demeter_04",
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.0,
		},
		Rare =
		{
			Multiplier = 1.1,
		},
		Epic =
		{
			Multiplier = 1.2,
		},
		Heroic =
		{
			Multiplier = 1.3,
		}
	},
	AddShout =
	{
		FunctionName = "HestiaShout",
		MaxFunctionName = "HestiaMaxShout",
		Cost = 25,
		MaxDurationMultiplier = 2,
		SuperDuration = 5,
		IsBurst = true,
		ExtractValues =
		{
			{
				Key = "Cost",
				ExtractAs = "TooltipWrathStocks",
				Format = "WrathStocks",
				SkipAutoExtract = true
			},
			{
				Key = "MaxDurationMultiplier",
				ExtractAs = "TooltipDuration",
				Format = "EXWrathDuration",
				DecimalPlaces = 2,
				SkipAutoExtract = true
			}
		}
	},
	EndShout = "EndHestia",
	PreEquipWeapons = { "HestiaSuper", "HestiaMaxSuper", },
	PropertyChanges =
	{
		{
			WeaponNames = { "HestiaSuper", "HestiaMaxSuper", },
			EffectName = "BurnOverTime",
			EffectProperty = "Active",
			ChangeValue = true,
		},
		{
			WeaponNames = { "HestiaSuper", "HestiaMaxSuper", },
			EffectName = "BurnOverTime",
			EffectProperty = "Amount",
			BaseMin = 1,
			BaseMax = 1,
			AsInt = true,
			MinMultiplier = 0.25,
			ChangeType = "Add",
			DepthMult = DepthDamageMultiplier,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		{
			WeaponNames = { "HestiaSuper", "HestiaMaxSuper", },
			ProjectileProperty = "DamageLow",
			BaseMin = 10,
			BaseMax = 10,
			MinMultiplier = 0.2,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			}
		},
		{
			WeaponNames = { "HestiaSuper", "HestiaMaxSuper", },
			ProjectileProperty = "DamageHigh",
			DeriveValueFrom = "DamageLow"
		},
		{
			WeaponNames = { "HestiaSuper", "HestiaMaxSuper", },
			ProjectileProperty = "Fuse",
			ChangeValue = 0.25,
			ExtractValue =
			{
				ExtractAs = "TooltipInterval",
				SkipAutoExtract = true,
				DecimalPlaces = 2,
			}
		},
	},
	ExtractValues =
	{
		{
			ExtractAs = "TooltipChillDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DemeterSlow",
			BaseProperty = "Duration",
		},
		{
			ExtractAs = "TooltipChillPower",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DemeterSlow",
			BaseProperty = "ElapsedTimeMultiplier",
			Format = "NegativePercentDelta"
		},
		{
			ExtractAs = "TooltipChillStacks",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "DemeterSlow",
			BaseProperty = "MaxStacks",
		},
	}
}
