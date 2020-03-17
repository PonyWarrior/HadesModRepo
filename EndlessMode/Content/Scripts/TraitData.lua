local DepthDamageMultiplier = 0.0
local DuplicateMultiplier = -0.60
local DuplicateStrongMultiplier = -0.40
TraitMultiplierData =
{
	DefaultDiminishingReturnsMultiplier = 0.7,
	DefaultMinMultiplier = 0.1,
}

TraitData =
{
	ShopTier1Trait =
	{
		Cost = 30,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.3,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 1.8,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.3,
				MaxMultiplier = 2.5,
			},
		}
	},

	ShopTier2Trait =
	{
		Cost = 60,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.3,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.5,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.7,
			}
		}
	},

	ShopTier3Trait =
	{
		Cost = 120,
		RarityLevels =
		{
			Legendary =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
		}
	},

	SynergyTrait =
	{
		IsDuoBoon = true,
		Frame = "Duo",
		RequiredFalseRewardType = "Devotion",
		CustomRarityName = "Boon_Synergy",
		CustomRarityColor = {210, 255, 97, 255},
		RarityLevels =
		{
			Legendary =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
		}
	},

	WeaponTrait =
	{
		Frame = "Hammer"
	},

	ShopTrait =
	{
		Frame = "Shop"
	},

	ChaosCurseTrait =
	{
		Icon = "Shop_Vial",
	},

	ChaosCurseRemainingEncounters =
	{
		RemainingUses =
		{
			BaseMin = 3,
			BaseMax = 4,
			AsInt = true,
		},
		UsesAsEncounters = true,
	},

	ChaosBlessingTrait =
	{
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
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
		}
	},

	GiftTrait =
	{
		Frame = "Gift",
		Slot = "Keepsake",
		ChamberThresholds =  { 25, 50 },

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
	},

	AssistTrait =
	{
		Frame = "Gift",
		Slot = "Assist",
		Icon = "Keepsake_Unknown",
		ChamberThresholds =  { 25, 50 },

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 4.0,
			},
			Legendary =
			{
				Multiplier = 5.0,
			},
		},
	},

	WeaponEnchantmentTrait =
	{
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
	},

	GodModeTrait =
	{
		Icon = "GodMode",

		ExtractValues =
		{
			{
				ExtractAs = "TooltipEasyModeDefense",
				Format = "EasyModeMultiplier",
				SkipAutoExtract = true

			}
		}
	},

	LimitedTimeTrait =
	{
		LimitedTime = true,
	},

	-- Zeus
	RetaliateWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "LightningStrikeRetaliate" },
		Icon = "Boon_Zeus_01",
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeRetaliate",
				ProjectileProperty = "DamageLow",
				BaseMin = 80,
				BaseMax = 80,
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
				WeaponName = "LightningStrikeRetaliate",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	ZeusLightningDebuff =
	{
		InheritFrom = { "ShopTier1Trait" },
		PreEquipWeapons = { "ZeusAttackBolt" },
		Icon = "Boon_Zeus_12",
		PropertyChanges =
		{
			{
				WeaponName = "ZeusAttackBolt",
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
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
				WeaponName = "ZeusAttackBolt",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				TraitName = "ZeusWeaponTrait",
				WeaponName = "ChainLightning",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ZeusRushTrait",
				WeaponName = "LightningDash",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ZeusShoutTrait",
				WeaponName = "LightningStrikeX",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "RetaliateWeaponTrait",
				WeaponName = "LightningStrikeRetaliate",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AmmoBoltTrait",
				WeaponName = "ZeusAmmoWeapon",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "LightningCloudTrait",
				WeaponName = "ZeusDionysusCloudStrike",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		},
	},

	SuperGenerationTrait =
	{
		Icon = "Boon_Zeus_09",
		InheritFrom = { "ShopTier1Trait" },
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		SuperGainMultiplier =
		{
			BaseMin = 1.1,
			BaseMax = 1.1,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "SuperGainMultiplier",
				ExtractAs = "TooltipMultiplier",
				Format = "PercentDelta",
			}
		}
	},

	DefensiveSuperGenerationTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Poseidon_10",
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		DefensiveSuperGainMultiplier =
		{
			BaseMin = 1.4,
			BaseMax = 1.4,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "DefensiveSuperGainMultiplier",
				ExtractAs = "TooltipMultiplier",
				Format = "PercentDelta",
			}
		}
	},

	ZeusBoltAoETrait = {
		InheritFrom = { "ShopTier2Trait" },
		Icon = "Boon_Zeus_10",
		God = "Zeus",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				ProjectileProperty = "DamageRadius",
				BaseValue = 120,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "LightningStrikeSecondary",
					BaseProperty = "DamageRadius",
				}
			},
			{
				TraitName = "ZeusRushTrait",
				WeaponName = "LightningDash",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "ZeusShoutTrait",
				WeaponName = "LightningStrikeX",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "AmmoBoltTrait",
				WeaponName = "ZeusAmmoWeapon",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "LightningCloudTrait",
				WeaponName = "ZeusDionysusCloudStrike",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
		},
	},

	ZeusBonusBoltTrait = {
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Zeus_11",
		God = "Zeus",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
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
		BonusBolts =
		{
			BaseValue = 0.25,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		PropertyChanges =
		{
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				WeaponProperty = "BonusProjectileChance",
				BaseValue = 0.25,
				ChangeType = "Add",
				DeriveSource = "DeriveSource",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipChance",
					Format = "Percent",
				}
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				WeaponProperty = "BonusProjectileChance",
				DeriveValueFrom = "DeriveSource"
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				WeaponProperty = "BonusProjectileChance",
				DeriveValueFrom = "DeriveSource"
			},
			{
				TraitName = "RetaliateWeaponTrait",
				WeaponName = "LightningStrikeRetaliate",
				WeaponProperty = "BonusProjectileChance",
				DeriveValueFrom = "DeriveSource"
			},
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				TraitName = "RetaliateWeaponTrait",
				WeaponName = "LightningStrikeRetaliate",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			}
		},
	},

	ZeusBonusBounceTrait = {
		Icon = "Boon_Zeus_03",
		InheritFrom = { "ShopTier2Trait" },
		God = "Zeus",
		PreEquipWeapons = { "ChainLightning" },
		RarityLevels = {
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ChainLightning",
				ProjectileProperty = "NumJumps",
				BaseMin = 2,
				BaseMax = 2,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "BonusJumps",
				}
			},
			{
				TraitName = "ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "NumJumps",
				BaseMin = 3,
				BaseMax = 3,
				ChangeType = "Add",
			},
		},
	},

	ZeusWeaponTrait =
	{
		Icon = "Boon_Zeus_04",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Melee",
		AddOnDamageWeapons = { "ChainLightning" },
		OnDamageWeaponProperties = { FirstHitOnly = true, FireFromVictimLocation = true},
		LegalOnDamageWeapons = WeaponSets.HeroPhysicalWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 2.0,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ChainLightning",
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				DepthMult = DepthDamageMultiplier,
				AsInt = true,
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
				WeaponName = "ChainLightning",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},

			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxZeus",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeZeus",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Zeus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Zeus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Zeus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Zeus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ZeusSecondaryTrait =
	{
		Icon = "Boon_Zeus_00",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Secondary",
		AddOnDamageWeapons = { "LightningStrikeSecondary" },
		OnDamageWeaponProperties = { FireFromVictimLocation = true},
		PreEquipWeapons = { "LightningStrikeSecondary" },
		LegalOnDamageWeapons = WeaponSets.HeroSecondaryWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 2.00,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeSecondary",
				ProjectileProperty = "DamageLow",
				BaseMin = 30,
				BaseMax = 30,
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
				WeaponName = "LightningStrikeSecondary",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionZeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalZeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},



	ZeusRangedTrait =
	{
		Icon = "Boon_Zeus_05",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Ranged",
		CustomTrayText = "ZeusRangedTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "ZeusProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
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
			}
		}
	},

	ZeusChargedBoltTrait =
	{
		Icon = "Boon_Zeus_02",
		InheritFrom = { "ShopTier3Trait" },
		God = "Zeus",
		PreEquipWeapons = { "ZeusLegendaryWeapon" },
		PropertyChanges =
		{
			{
				WeaponName = "ZeusLegendaryWeapon",
				ProjectileName = "LightningSpark",
				ProjectileProperty = "DamageLow",
				BaseMin = 40,
				BaseMax = 40,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				AutoRamp = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource",
			},
			{
				WeaponName = "ZeusLegendaryWeapon",
				ProjectileName = "LightningSpark",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
		},
	},

	ZeusRushTrait =
	{
		Icon = "Boon_Zeus_06",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Rush",
		PreEquipWeapons = { "LightningDash" },

		AddRush =
		{
			FunctionName = "ZeusDash",
			RunOnce = true,
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
				MinMultiplier = 1.33,
				MaxMultiplier = 1.33,
			},
			Epic =
			{
				MinMultiplier = 1.66,
				MaxMultiplier = 1.66,
			},
			Heroic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "LightningDash",
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
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
				WeaponName = "LightningDash",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Zeus",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Zeus",
				ChangeType = "Absolute",
			},


		},
	},

	ZeusShoutTrait =
	{
		Icon = "Boon_Zeus_07",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "ZeusShoutTrait_Tray",
		God = "Zeus",
		Slot = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,
			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		AddShout =
		{
			FunctionName = "ZeusShout",
			Cost = 25,
			SuperDuration = 1.5,
			MaxDurationMultiplier = 6,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				}
			}
		},
		PreEquipWeapons = { "LightningStrikeX" },
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeX",
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
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
				WeaponName = "LightningStrikeX",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	},

	WrathDamageBuffTrait =
	{
		Icon = "Boon_Zeus_08",
		InheritFrom = { "ShopTier1Trait" },
		DamagePerSuperStock =
		{
			BaseValue = 0.15,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		SetupFunction =
		{
			Name = "SetupSuperDamageBonus",
			RunOnce = true,
		},
		ExtractValues =
		{
			{
				Key = "DamagePerSuperStock",
				ExtractAs = "TooltipDamage",
				Format = "Percent",
			}
		}
	},

	RetainTempHealthTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
	},

	-- Athena
	AthenaWeaponTrait =
	{
		Icon = "Boon_Athena_01",
		InheritFrom = { "ShopTier1Trait" },
		God = "Athena",
		Slot = "Melee",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.40,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "DeflectProjectiles",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "ShieldWeapon",
				EffectName = "ShieldAttackReflect",
				EffectProperty = "Deflect",
				ChangeValue = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				EffectName = "ShieldDashReflect",
				EffectProperty = "Deflect",
				ChangeValue = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireSelfReflection",
				EffectProperty = "Deflect",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Athena-Spike",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Athena-Spike",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAthena",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeAthena",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Athena-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Athena-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Athena-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Athena-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	AthenaSecondaryTrait =
	{
		Icon = "Boon_Athena_00",
		InheritFrom = { "ShopTier1Trait" },
		God = "Athena",
		Slot = "Secondary",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.6,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrow", "SpearWeaponThrowReturn", "SwordParry", "ShieldThrow", "BowSplitShot", "GunGrenadeToss", "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "DeflectProjectiles",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 75,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 75,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 75,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 450,
				ChangeType = "Absolute"
			},

			--[[
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParrySelfReflection",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParrySelfInvulnerable",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParrySelfReflectRange",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			]]

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAthena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAthena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	AthenaRangedTrait =
	{
		Icon = "Boon_Athena_02",
		InheritFrom = { "ShopTier1Trait" },
		God = "Athena",
		Slot = "Ranged",
		CustomTrayText = "AthenaRangedTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AthenaDeflectingProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Athena",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 85,
				BaseMax = 85,
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
			}
		}
	},

	AthenaRushTrait =
	{
		Icon = "Boon_Athena_03",
		InheritFrom = { "ShopTier1Trait" },
		God = "Athena",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AthenaRushProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrail-AthenaDark",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Athena",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateOnInterval",
				ChangeValue = 60,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AthenaDashShieldReflection",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AthenaDashShieldReflect",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
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
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	},

	AthenaShieldTrait =
	{
		Icon = "Boon_Athena_05",
		InheritFrom = { "ShopTier2Trait" },
		God = "Athena",
		EnemyIncomingDamageModifiers =
		{
			ProjectileDeflectedMultiplier =
			{
				BaseValue = 1.8,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "ProjectileDeflectedMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
	},

	AthenaBackstabDebuffTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Athena_14",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AthenaRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "MagicShieldRetaliate",
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AthenaRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				BaseValue = 1.5,
				SourceIsMultiplier = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
				ChangeType = "Add",
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponName = "MagicShieldRetaliate",
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
		}
	},

	AthenaShoutTrait =
	{
		Icon = "Boon_Athena_04",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "AthenaShoutTrait_Tray",
		God = "Athena",
		Slot = "Shout",
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
			FunctionName = "AthenaShout",
			Cost = 25,
			MaxDurationMultiplier = 6,
			AddDuration = true,
			SuperDuration = {
				BaseValue = 1.5,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "SuperDuration",
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 2,
				},
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndAthenaShout",
		PreEquipWeapons = { "AthenaShoutWeapon" },
	},

	EnemyDamageTrait =
	{
		Icon = "Boon_Athena_06",
		InheritFrom = { "ShopTier1Trait" },
		AddIncomingDamageModifiers =
		{
			NonTrapDamageTakenMultiplier =
			{
				BaseMin = 0.90,
				BaseMax = 0.95,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "NonTrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},

	TrapDamageTrait =
	{
		Icon = "Boon_Athena_07",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "TrapDamageTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.585,
			},
		},
		AddIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseMin = 0.40,
				BaseMax = 0.40,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},

	LastStandHealTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Athena_12",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		LastStandHealFraction =
		{
			BaseValue = 0.10,
		},
		ExtractValues =
		{
			{
				Key = "LastStandHealFraction",
				ExtractAs = "TooltipHeal",
				Format = "Percent",
			}
		}
	},

	LastStandDurationTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Athena_11",
		PreEquipWeapons = {"LastStandMetaUpgradeWrath", "LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "LastStandMetaUpgradeWrath", "LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "MagicShield",
				EffectProperty = "Duration",
				BaseValue = 2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
				ChangeType = "Add",
			},
			{
				WeaponNames = { "LastStandMetaUpgradeWrath", "LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "MagicShieldInvincible",
				EffectProperty = "Duration",
				DeriveValueFrom = "MagicShield"
			},
			{
				WeaponNames = {"LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "MagicShield",
				EffectProperty = "BackFx",
				ChangeValue= "AthenaProtectionBack",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = {"LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "MagicShield",
				EffectProperty = "FrontFx",
				ChangeValue = "AthenaProtectionFront",
				ChangeType = "Absolute",
			},
		},
	},


	PreloadSuperGenerationTrait = {
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Athena_13",
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 2.0,
			}
		},
		StartingSuperAmount =
		{
			BaseValue = 20,
			IdenticalMultiplier =
			{
				Value = -0.5,
			},
		},
		ExtractValues =
		{
			{
				Key = "StartingSuperAmount",
				ExtractAs = "TooltipCriticalSuperGain",
			}
		}
	},

	AthenaRetaliateTrait =
	{
		Icon = "Boon_Athena_08",
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "MagicShieldRetaliate" },
		PropertyChanges =
		{
			{
				WeaponName = "MagicShieldRetaliate",
				ProjectileProperty = "DamageLow",
				BaseMin = 30,
				BaseMax = 30,
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
				WeaponName = "MagicShieldRetaliate",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	ShieldHitTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Athena_10",
		RequiredFalseTrait = "ShieldHitTrait",
		SetupFunction =
		{
			Name = "ReactivateInvulnerability",
		},
		CurrentCooldown = 20,
		TimeCooldown = 20,
		ReactivateFunction = "ReactivateInvulnerability",
		ExtractValues =
		{
			{
				Key = "TimeCooldown",
				ExtractAs = "TooltipCooldown",
			}
		}
	},

	-- Poseidon
	PoseidonWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Melee",
		Icon = "Boon_Poseidon_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.30,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = {"SwordWeapon", "SwordWeapon2", "SwordWeaponDash", "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash",},
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1600,
				BaseMax = 1600,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = {"SwordWeapon", "SwordWeapon2", "SwordWeaponDash", "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1600,
				BaseMax = 1600,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SwordWeapon3", "ShieldWeapon", "ShieldWeaponDash", "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1100,
				BaseMax = 1100,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SwordWeapon3", "ShieldWeapon", "ShieldWeaponDash", "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 900,
				BaseMax = 900,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash", "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 2500,
				BaseMax = 2500,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash", "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 2500,
				BaseMax = 2500,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "FistWeapon", "FistWeapon2","FistWeapon3","FistWeapon4","FistWeapon5", "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1200,
				BaseMax = 1200,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "FistWeapon", "FistWeapon2","FistWeapon3","FistWeapon4","FistWeapon5", "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1200,
				BaseMax = 1200,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxPoseidon",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipePoseidon",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Poseidon-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Poseidon-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Poseidon-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Poseidon-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	PoseidonSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Secondary",
		Icon = "Boon_Poseidon_00",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.7,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 2300,
				BaseMax = 2300,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 2300,
				BaseMax = 2300,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1800,
				BaseMax = 1800,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1800,
				BaseMax = 1800,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1200,
				BaseMax = 1200,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1200,
				BaseMax = 1200,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunGrenadeToss", "FistWeaponSpecial", "FistWeaponSpecialDash"  },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 2500,
				BaseMax = 2500,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunGrenadeToss", "FistWeaponSpecial", "FistWeaponSpecialDash"  },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 2500,
				BaseMax = 2500,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1100,
				BaseMax = 1100,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1100,
				BaseMax = 1100,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "PoseidonSplashNovaSpearThrow",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionPoseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalPoseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	PoseidonRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Ranged",
		Icon = "Boon_Poseidon_02",
		CustomTrayText = "PoseidonRangedTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "PoseidonProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Poseidon",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
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
				DeriveValueFrom = "DamageLow",
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
			}
		}
	},

	PoseidonRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Rush",
		Icon = "Boon_Poseidon_03",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "PoseidonRushProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "CancelAttachedProjectiles",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Poseidon",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Poseidon",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpointDelay",
				ChangeValue = -0.1,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 35,
				BaseMax = 35,
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
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		},
	},

	PoseidonShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Shout",
		Icon = "Boon_Poseidon_04",
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "PoseidonShoutTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		AddShout =
		{
			FunctionName = "PoseidonShout",
			Cost = 25,
			SuperDuration = 1.2,
			MaxDurationMultiplier = 6,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndSurge",
		PreEquipWeapons = { "PoseidonSurfWeapon" },
		PropertyChanges =
		{
			{
				WeaponName = "PoseidonSurfWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 250,
				BaseMax = 250,
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
				WeaponName = "PoseidonSurfWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponName = "PoseidonSurfWeapon",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 3500,
				ChangeType = "Absolute",
			},
		}
	},

	BonusCollisionTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Icon = "Boon_Poseidon_05",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		BonusCollisionVulnerability =
		{
			BaseValue = 3.0,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "BonusCollisionVulnerability",
				ExtractAs = "TooltipVulnerability",
				Format = "PercentDelta",
			}
		}
	},

	SlamStunTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Poseidon",
		Icon = "Boon_Poseidon_08",
		AddOnSlamWeapons = { "PoseidonCollisionBlast" },
		PropertyChanges =
		{
			{
				WeaponName = "PoseidonCollisionBlast",
				EffectName = "WaterStun",
				EffectProperty = "Duration",
				BaseValue = 3,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	SlamExplosionTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Poseidon",
		Icon = "Boon_Poseidon_08",
		AddOnSlamWeapons = { "PoseidonCollisionBlast" },
		PropertyChanges =
		{
			{
				WeaponName = "PoseidonCollisionBlast",
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
			},
			{
				WeaponName = "PoseidonCollisionBlast",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	OnEnemyDeathDefenseBuffTrait =
	{
		OnEnemyDeathWeapon =
		{
			Weapon = "PoseidonKillBuff"
		},
		PropertyChanges =
		{
			{
				WeaponName = "PoseidonKillBuff",
				EffectName = "KillDefenseBonus",
				EffectProperty = "Duration",
				BaseValue = 5,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	SlipperyTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Poseidon_11",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "BlizzardOrbTrait",
				ProjectileName = "IceSpark",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonAphroditeTouchTrait",
				WeaponName = "PoseidonAphroditeTouchWeapon",
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				BaseValue = 5,
				MinMultiplier = 0.2,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ChangeType = "Add",
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "BlizzardOrbTrait",
				ProjectileName = "IceSpark",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
		}
	},

	BossDamageTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			}
		},
		Icon = "Boon_Poseidon_12",
		AddOutgoingDamageModifiers =
		{
			BossDamageMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidEnchantments =
			{
				TraitDependentWeapons = {
					PoseidonWeaponTrait = WeaponSets.HeroPhysicalWeapons,
					PoseidonSecondaryTrait = WeaponSets.HeroSecondaryWeapons,
					PoseidonRushTrait = WeaponSets.HeroRushWeapons,
					PoseidonRangedTrait = WeaponSets.HeroNonPhysicalWeapons,
				},
				ValidWeapons = {
					"PoseidonSurfWeapon",
				},
			},
			ExtractValues =
			{
				{
					Key = "BossDamageMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},

	},

	DoubleCollisionTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "DoubleCollisionTrait",
		Icon = "Boon_Poseidon_07",
		PropertyChanges =
		{
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonAphroditeTouchTrait",
				WeaponName = "PoseidonAphroditeTouchWeapon",
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		}
	},

	FishingTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "FishingTrait",
		RequiredTextLines = { "PoseidonFishQuest01" },
		Icon = "Boon_Poseidon_13",
		FishingPointChanceBonus = 0.2,
		DisableFishRequirements = true,
	},

	HealthRewardBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Aphrodite_11",
		RequiredFalseTraits = { "HealthRewardBonusTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		HealthRewardBonus =
		{
			BaseValue = 1.3,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "HealthRewardBonus",
				ExtractAs = "TooltipPercentIncrease",
				Format = "PercentDelta",
			}
		}
	},

	RoomRewardBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Poseidon_09",
		RequiredFalseTraits = { "RoomRewardBonusTrait" },
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
		MoneyRewardBonus =
		{
			BaseValue = 1.5,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		MetapointRewardBonus =
		{
			BaseValue = 1.5,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		GemRewardBonus =
		{
			BaseValue = 1.5,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "MoneyRewardBonus",
				ExtractAs = "TooltipPercentIncrease",
				Format = "PercentDelta",
			}
		}
	},

	ReducedEnemySpawnsTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		SpawnMultiplier =
		{
			BaseValue = 0.8,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "SpawnMultiplier",
				ExtractAs = "TooltipSpawnMultiplier",
				Format = "NegativePercentDelta",
			}
		}
	},

	UnusedWeaponBonusTrait = {
		Frame = "MetaUpgrade",
		Icon = "BonusDarkness_01",
		MetaPointMultiplier = 1.2,
		BonusMetaPointDropOnKillChance = 0,
	},

	HealthBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				ChangeValue = 20,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	PoseidonPickedUpMinorLootTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Hidden = true,
	},

	RoomRewardMaxHealthTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Hidden = true,
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 25,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	--Endless mod
	EndlessModLoop =
	{
		InheritFrom = { "ShopTier1Trait" },
		Hidden = true,
		PropertyChanges =
		{
			{
				LuaProperty = "EndlessModLoopedTimes",
				BaseValue = 1,
				ChangeType = "Add",
			},
		},
		RarityBonus =
		{
			RareBonus = 0.34,
			EpicBonus = 0.34,
			LegendaryBonus = 0.34,
			ReplaceBonus = 0.34,
		},
	},
	--/
	-- Artemis
	ArtemisWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_01",
		God = "Artemis",
		Slot = "Melee",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.2,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.15,
				BaseMax = 0.15,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxArtemis",
				ChangeType = "Absolute"
			},

			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeArtemis",
				ChangeType = "Absolute",
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Artemis-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Artemis-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Artemis-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Artemis-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},



		},
	},

	ArtemisSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_00",
		God = "Artemis",
		Slot = "Secondary",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.4,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				ProjectileProperty = "CriticalHitChance",
				BaseValue = 0.20,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "ArtemisSpearThrowStartFx",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionArtemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalArtemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ArtemisRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Artemis",
		Slot = "Ranged",
		Icon = "Boon_Artemis_02",
		CustomTrayText = "ArtemisRangedTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.145,
			},
			Epic =
			{
				Multiplier = 1.290,
			},
			Heroic =
			{
				Multiplier = 1.435,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "ArtemisProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Artemis",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
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
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.10,
				BaseMax = 0.10,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
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
			}
		}
	},

	ArtemisRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "BowStoredChargeTrait",
		God = "Artemis",
		Icon = "Boon_Artemis_03",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = {
				BaseValue = 1.5,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = -0.7,
				},
			},
			ValidWeapons = WeaponSets.HeroDashWeapons,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Artemis",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Artemis",
				ChangeType = "Absolute",
			},
		},
	},

	ArtemisCriticalTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		Icon = "Boon_Artemis_05",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		PropertyChanges =
		{
			{
				UnitProperty = "CritMultiplierAddition",
				BaseValue = 0.15,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipCritDamageBonus",
					Format = "Percent",
				}
			},
		}
	},

	CriticalBufferMultiplierTrait =
	{
		Icon = "Boon_Artemis_09",
		InheritFrom = { "ShopTier2Trait" },
		CriticalHealthBufferMultiplier =
		{
			BaseValue = 2,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "CriticalHealthBufferMultiplier",
				ExtractAs = "TooltipDamageBonus",
				Format = "PercentDelta",
			}
		}
	},

	CriticalSuperGenerationTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		Icon = "Boon_Artemis_13",
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		CriticalSuperGainAmount =
		{
			BaseValue = 0.25,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "CriticalSuperGainAmount",
				ExtractAs = "TooltipCriticalSuperGain",
				DecimalPlaces = 2,
			}
		}
	},

	CriticalStunTrait =
	{
		Icon = "Boon_Artemis_05",
		InheritFrom = { "ShopTier2Trait" },
		AddOnDamageWeapons = { "CriticalStunApplier" },
		OnDamageWeaponProperties = { CritOnly = true },
		PropertyChanges =
		{
			{
				WeaponName = "CriticalStunApplier",
				EffectName = "CriticalStun",
				EffectProperty = "Duration",
				BaseValue = 1,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	ArtemisShoutTrait =
	{
		Icon = "Boon_Artemis_04",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "ArtemisShoutTrait_Tray",
		God = "Artemis",
		Slot = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,
			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		AddShout =
		{
			FunctionName = "ArtemisShout",
			MaxFunctionName = "ArtemisMaxShout",
			Cost = 20,
			SuperDuration = 0.8,
			IsBurst = true,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				}
			}
		},
		PreEquipWeapons = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
		PropertyChanges =
		{
			{
				WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
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
				WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.35,
				BaseMax = 0.35,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},
		}
	},

	ArtemisShoutBuffTrait =
	{
		Icon = "Boon_Artemis_04",
		InheritFrom = { "ShopTier1Trait" },
		God = "Artemis",
		Slot = "Shout",
		AddShout =
		{
			FunctionName = "ArtemisShout",
			Cost = 25,
			SuperDuration =
			{
				BaseValue = 3,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "SuperDuration",
					ExtractAs = "TooltipDuration"
				}
			}
		},
		PreEquipWeapons = { "ArtemisShoutBuff" },
		PropertyChanges =
		{
			{
				WeaponName = "ArtemisShoutBuff",
				EffectName = "ShoutCritChance",
				EffectProperty = "Duration",
				BaseValue = 3,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	ArtemisBonusProjectileTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Artemis",
		Icon = "Boon_Artemis_06",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.4,
				MaxMultiplier = 1.4,
			},
			Epic =
			{
				MinMultiplier = 1.8,
				MaxMultiplier = 1.8,
			},
			Heroic =
			{
				Multiplier = 2.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "NumProjectileWaves",
				ChangeValue = 2,
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
					SkipAutoExtract = true,
				},
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileWaveInterval",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AdditionalWaveDamageMultiplier",
				BaseValue = 0.25,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format ="Percent"
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileAngleOffsetMin",
				ChangeValue = -0.15,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileAngleOffsetMax",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
			},
		},
	},

	MoreAmmoTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Artemis_07",
		RequiredFalseTrait = "MoreAmmoTrait",
		--[[
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 4,
			}
		},
		]]
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				BaseValue = 3.0,
				ChangeType = "Add",
				MinMultiplier = 1,
				ExtractValue =
				{
					ExtractAs = "TooltipCapacity",
				}
			},
		},

	},

	RoomAmmoTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RoomAmmoRestore = 3,
		Icon = "Boon_Artemis_10",
		ExtractValues =
		{
			{
				Key = "RoomAmmoRestore",
				ExtractAs = "TooltipAmmo",
			}
		}
	},

	UnstoredAmmoDamageTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "MagnetismTrait",
		RequiredInactiveMetaUpgrade = "AmmoMetaUpgrade",
		Icon = "Boon_Hermes_02",
		AddOutgoingDamageModifiers =
		{
			UnstoredAmmoMultiplier = 1.5,
			ExtractValues =
			{
				{
					Key = "UnstoredAmmoMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},

	},

	AmmoReloadTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		CustomTrayText = "AmmoReloadTrait_Tray",
		RequiredInactiveMetaUpgrade = "AmmoMetaUpgrade",
		Icon = "Boon_Hermes_03",
		RequiredFalseTrait = "AmmoReloadTrait",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 2.75/2.5,
				MaxMultiplier = 2.75/2.5,
			},
			Epic =
			{
				MinMultiplier = 2.75/2.25,
				MaxMultiplier = 2.75/2.25,
			},
			Heroic =
			{
				Multiplier = 2.75/2,
			}
		},
		AmmoReloadTimeDivisor =
		{
			BaseValue = 3/2.75,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "AmmoReloadTimeDivisor",
				ExtractAs = "TooltipAmmo",
				Format = "AmmoReloadDivisor",
				DecimalPlaces = 2.0,
			},
			{
				ExtractAs = "TooltipTotalAmmoDelay",
				Format = "ExistingAmmoReloadDelay",
				SkipAutoExtract = true,
				DecimalPlaces = 2.0,
			}
		}
	},
	AmmoReclaimTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		CustomTrayText = "AmmoReclaimTrait_Tray",
		RequiredInactiveMetaUpgrade = "ReloadAmmoMetaUpgrade",
		Icon = "Boon_Hermes_03",
		RequiredFalseTraits = { "AresRangedTrait", "DionysusRangedTrait", "DemeterRangedTrait" },
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
				Multiplier = 2.5,
			}
		},
		AmmoReclaimTimeDivisor =
		{
			BaseValue = 1.6,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "AmmoReclaimTimeDivisor",
				ExtractAs = "TooltipAmmo",
				Format = "AmmoDelayDivisor",
				DecimalPlaces = 2.0,
			},
			{
				ExtractAs = "TooltipTotalAmmoDelay",
				Format = "ExistingAmmoDropDelay",
				SkipAutoExtract = true,
				DecimalPlaces = 2.0,
			}
		}
	},

	CritBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_08",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.34,
				MaxMultiplier = 1.34,
			},
			Epic =
			{
				MinMultiplier = 1.67,
				MaxMultiplier = 1.67,
			},
			Heroic =
			{
				Multiplier = 2,
			}
		},
		PropertyChanges =
		{
			{
				UnitProperty = "CritAddition",
				BaseValue = 0.03,
				MinMultiplier = 0.333333,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipCritBonus",
					Format = "Percent",
				},
			},
		}
	},

	ArtemisAmmoExitTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		AmmoDropWeapons = { "ArtemisAmmoWeapon" },
		Icon = "Boon_Artemis_09",
		RequiredFalseTraits = { "AresRangedTrait", "DionysusRangedTrait", "DemeterRangedTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ArtemisAmmoWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
			},
			{
				WeaponName = "ArtemisAmmoWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	CritVulnerabilityTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_14",
		PreEquipWeapons = { "CritVulnerabilityWeapon" },
		OnEnemyCrittedFunction =
		{
			Name = "MarkRandomNearby",
			Args = { Range = 1200 }
		},
		PropertyChanges =
		{
			{
				WeaponName = "CritVulnerabilityWeapon",
				EffectName = "CritVulnerability",
				EffectProperty = "CritVulnerabilityAddition",
				BaseValue = 0.30,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipVulnerability",
					Format = "Percent",
				}
			},
		}
	},

	ArtemisSupportingFireTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_12",
		AddOnDamageWeapons = {"ArtemisLegendary"},
		OnDamageWeaponProperties = { FirstHitOnly = true },
		LegalOnDamageWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
		AddOnFireWeapons = { "ArtemisLegendary" },
		LegalOnFireWeapons = WeaponSets.HeroNonPhysicalWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ArtemisLegendary",
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.1,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = -0.6,
				},
			},
			{
				WeaponName = "ArtemisLegendary",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},
	-- Aphrodite
	AphroditeDurationTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Aphrodite",
		Icon = "Boon_Aphrodite_05",
		PreEquipWeapons = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				BaseValue = 5,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = { "AphroditeShoutWeapon", "AreaWeakenAphrodite" },
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
		}
	},

	AphroditePotencyTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Aphrodite",
		Icon = "Boon_Aphrodite_12",
		PreEquipWeapons = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
		RequiredFalseTrait = "AphroditePotencyTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.5,
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
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				BaseValue = -0.1,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipModifier",
					DecimalPlaces = 1,
					Format = "Percent",
					AbsoluteValue = true
				},
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
		}
	},

	AphroditeWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Slot = "Melee",
		Icon = "Boon_Aphrodite_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.50,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "DetonateChildGraphics",
				ChangeValue = "Cone180Athena",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Emitter-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Emitter-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAphrodite",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeAphrodite",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Aphrodite-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Aphrodite-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Aphrodite-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Aphrodite-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	AphroditeSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Slot = "Secondary",
		Icon = "Boon_Aphrodite_00",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.8,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "AphroditeSpearThrowStartFx",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	AphroditeRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Icon = "Boon_Aphrodite_02",
		Slot = "Ranged",
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
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AphroditeProjectile",
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
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 25,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
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
			}
		}
	},

	AphroditeRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Slot = "Rush",
		Icon = "Boon_Aphrodite_03",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AphroditeRushProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 20,
				BaseMax = 20,
				AsInt = true,
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
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpointDelay",
				ChangeValue = 0.01,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Aphrodite",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Aphrodite",
				ChangeType = "Absolute",
			},
		},
	},

	AphroditeShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "AphroditeShoutTrait_Tray",
		God = "Aphrodite",
		Slot = "Shout",
		Icon = "Boon_Aphrodite_04",
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
			FunctionName = "AphroditeShout",
			MaxFunctionName = "AphroditeMaxShout",
			Cost = 25,
			SuperDuration = 0.25,
			IsBurst = true,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				}
			}
		},
		PreEquipWeapons = { "AphroditeSuperCharm", "AphroditeMaxSuperCharm", },
		PropertyChanges =
		{
			{
				WeaponNames = { "AphroditeSuperCharm", "AphroditeMaxSuperCharm",},
				EffectName = "Charm",
				EffectProperty = "Duration",
				BaseValue = 5,
				ChangeType = "Add",
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = -0.9,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
			},
		}
	},

	AphroditeWeakenTrait =
	{
		God = "Aphrodite",
		InheritFrom = {"ShopTier2Trait"},
		PreEquipWeapons = {"AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon"},
		Icon = "Boon_Aphrodite_06",
		PropertyChanges =
		{
			{
				TraitName = "AphroditeWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = {"AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				BaseMin = 0.10,
				BaseMax = 0.10,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
				ChangeType = "Add",
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = {"AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
		}
	},

	AphroditeRetaliateTrait =
	{
		God = "Aphrodite",
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "AreaWeakenAphrodite" },
		Icon = "Boon_Aphrodite_09",
		PropertyChanges =
		{
			{
				WeaponName = "AreaWeakenAphrodite",
				ProjectileProperty = "DamageLow",
				BaseMin = 25,
				BaseMax = 25,
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
				WeaponName = "AreaWeakenAphrodite",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	AphroditeDeathTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Aphrodite_08",
		OnEnemyDeathWeapon = { Weapon = "DeathAreaWeakenAphrodite", FireAtDeathLocation = true },
		PropertyChanges =
		{
			{
				WeaponName = "DeathAreaWeakenAphrodite",
				ProjectileProperty = "DamageLow",
				BaseMin = 40,
				BaseMax = 40,
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
				WeaponName = "DeathAreaWeakenAphrodite",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	ProximityArmorTrait =
	{
		Icon = "Boon_Aphrodite_07",
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		AddIncomingDamageModifiers =
		{
			ProximityThreshold = 400,
			ProximityMultiplier =
			{
				BaseValue = 0.9,
				MinMultiplier = 0.1,
				ToNearest = 0.01,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "ProximityMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},

	CharmTrait =
	{
		Icon = "Boon_Aphrodite_10",
		RequiredFalseTrait = "CharmTrait",
		God = "Aphrodite",
		InheritFrom = { "ShopTier3Trait" },
		AddOnEffectWeapons =
		{
			EffectName = "ReduceDamageOutput",
			Weapon = "AphroditeCharmWeapon",
			AffectChance = 0.15,
			--IgnoreEnemies = { "Harpy", "Harpy2", "Harpy3", "HydraHead" },
		},
		PropertyChanges =
		{
			{
				WeaponName = "AphroditeCharmWeapon",
				EffectName = "Charm",
				EffectProperty = "Duration",
				ChangeValue = 4,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
				DeriveTarget = "DurationTarget"
			},
		}
	},

	-- Ares
	AresWeaponTrait =
	{
		Icon = "Boon_Ares_01",
		InheritFrom = { "ShopTier1Trait" },
		God = "Ares",
		Slot = "Melee",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
				BaseMin = 50,
				BaseMax = 50,
				AsInt = true,
				MinMultiplier = 0.025,
				IdenticalMultiplier =
				{
					Value = -0.35,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},

			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAres",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeAres",
				ChangeType = "Absolute",
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Ares-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Ares-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Ares-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Ares-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	AresSecondaryTrait =
	{
		Icon = "Boon_Ares_00",
		InheritFrom = { "ShopTier1Trait" },
		God = "Ares",
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.33,
			},
			Epic =
			{
				Multiplier = 1.66,
			},
			Heroic =
			{
				Multiplier = 2.00,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
				BaseMin = 60,
				BaseMax = 60,
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
				WeaponName = "SwordParry",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "AresSpearThrowStartFx",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAres",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAres",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	OnSpawnSwordTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		AddOnEnemySpawnWeapon = {
			Weapon = "SpawnDelayDamage",
			AffectChance = 0.5,
		},
		PropertyChanges =
		{
			{
				WeaponName = "SpawnDelayDamage",
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
				BaseMin = 50,
				BaseMax = 150,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
		}
	},

	AresRangedTrait =
	{
		Icon = "Boon_Ares_02",
		InheritFrom = { "ShopTier1Trait" },
		God = "Ares",
		Slot = "Ranged",
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
				Multiplier = 1.3,
			},
			Heroic =
			{
				Multiplier = 1.4,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AresProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.1,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = -0.8,
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
			}
		}
	},

	AresRushTrait =
	{
		Icon = "Boon_Ares_03",
		InheritFrom = { "ShopTier1Trait" },
		God = "Ares",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AresRushProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Ares",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Ares",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 5,
				BaseMax = 5,
				AsInt = true,
				MinMultiplier = 0.2,
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
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
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
		},
	},

	AresShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "AresShoutTrait_Tray",
		Icon = "Boon_Ares_04",
		God = "Ares",
		Slot = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		AddShout =
		{
			FunctionName = "AresShout",
			Cost = 25,
			SuperDuration = 2.5,
			MaxDurationMultiplier = 5,
			MaxWeaponDataOverride =
			{
				AresSurgeWeapon =
				{
					FireRumbleParameters =
					{
						{ ScreenPreWait = 0.1, RightFraction = 0.17, Duration = 7.5 },
					},
				},
			},
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndSurge",
		PreEquipWeapons = { "AresSurgeWeapon" },
		PropertyChanges =
		{
			{
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 15,
				BaseMax = 15,
				AsInt = true,
				MinMultiplier = 0.05,
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
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	},

	AresAoETrait =
	{
		Icon = "Boon_Ares_07",
		InheritFrom = { "ShopTier2Trait" },
		God = "Ares",
		RequiresFalseTraits = { "AresAoETrait" },
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
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				BaseValue = 30,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "AresProjectile",
					BaseProperty = "DamageRadius",
				}
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "AresRangedTrait"
			},

			{
				TraitName = "AresShoutTrait",
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "AresRangedTrait"
			},

		},
	},

	AresDragTrait =
	{
		Icon = "Boon_Ares_08",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "AresDragTrait",
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 300,
				ChangeType = "Add",
			},
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 100,
				ChangeType = "Add",
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 300,
				ChangeType = "Add",
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 100,
				ChangeType = "Add",
			},

			{
				TraitName = "AresShoutTrait",
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 600,
				ChangeType = "Add",
			},
			{
				TraitName = "AresShoutTrait",
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 200,
				ChangeType = "Add",
			},

			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "TotalFuse",
				BaseValue = 0.2,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
				DeriveTarget = "TotalFuseTarget"
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "TotalFuse",
				BaseValue = 0.2,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
				DeriveTarget = "TotalFuseTarget"
			},
		},
	},

	AresLoadCurseTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "AresLoadCurseTrait",
		Icon = "Boon_Ares_11",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,

			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "Stacks",
				ChangeValue = true,
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Stacks",
				ChangeValue  = true,
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Stacks",
				ChangeValue  = true,
			},
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "StackAmount",
				BaseMin = 5,
				BaseMax = 5,
				AsInt = true,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DamageSource",
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "StackAmount",
				DeriveValueFrom = "DamageSource"
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "StackAmount",
				DeriveValueFrom = "DamageSource"
			},
		},
	},

	AresLongCurseTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Ares_13",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,

			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.60,
				ToNearest = 0.05,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidEffects = { "DelayedDamage" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "Duration",
				ChangeValue = 0.5,
				ChangeType = "Add",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					SkipAutoExtract = true,
					ExtractAs = "TooltipDelay",
				},
				DeriveSource = "DurationSource",
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
		},
	},

	AresCursedRiftTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "AresCursedRiftTrait",
		Icon = "Boon_Ares_09",
		TextStore = "AresShoutTrait",
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "AresProjectile",
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				ChangeValue = 1,
				ChangeType = "Absolute",
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "AresRushProjectile",
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				DeriveValueFrom = "DamageSource"
			},

			{
				TraitName = "AresShoutTrait",
				WeaponNames = { "AresSurgeWeapon" },
				ProjectileName = "AresInvisibleAoE",
				ProjectileProperty = "DamagePerConescutiveHit",
				DeriveValueFrom = "DamageSource"
			},
			{
				TraitName = "AresShoutTrait",
				WeaponNames = { "AresSurgeWeapon" },
				ProjectileName = "AresInvisibleAoE",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.55,
				ChangeType = "Absolute",
				DeriveSource = "WindowSource"
			},
		},
	},

	AresRetaliateTrait =
	{
		Icon = "Boon_Ares_05",
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "AresRetaliate" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,
			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		PropertyChanges =
		{
			--[[
			{
				WeaponName = "AresRetaliate",
				ProjectileProperty = "DamageLow",
				BaseMin = 15,
				BaseMax = 15,
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
				WeaponName = "AresRetaliate",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			]]

			{
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
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

		},
	},

	IncreasedDamageTrait =
	{
		Icon = "Boon_Ares_06",
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 0.8,
			},
			Rare =
			{
				Multiplier = 1.0,

			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.4,
			}
		},
		God = "Ares",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.1,
				MinMultiplier = 0.1,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = -0.6,
				},
			},
			ValidWeapons = WeaponSets.HeroAllWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		}
	},

	OnWrathDamageBuffTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Zeus_13",
		OnSuperWeapons = { "AresShoutBuff" },
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,

			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "AresShoutBuff",
				EffectName = "ShoutDamageBonus",
				EffectProperty = "Duration",
				ChangeValue = 15,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					SkipAutoExtract = true
				}
			},
			{
				WeaponName = "AresShoutBuff",
				EffectName = "ShoutDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 1.20,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta"
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
			}
		}
	},

	OnEnemyDeathDamageInstanceBuffTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Ares_12",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		OnEnemyDeathWeapon =
		{
			Weapon = "AresKillBuff"
		},
		OnEnemyDeathKillBonus =
		{
			BaseValue = 1.00,
			IdenticalMultiplier =
			{
				Value = -0.7,
			},
		},
		ExtractValues =
		{
			{
				Key = "OnEnemyDeathKillBonus",
				ExtractAs = "TooltipKillBonus",
				Format = "Percent",
			}
		},
	},

	-- Dionysus
	DionysusSpreadTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_07",
		PreEquipEnemyWeapon = "DionysusPlagueWeapon",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "DionysusPlagueWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "DionysusPlagueWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "DionysusPlagueWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "DionysusPlagueWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
		EnemyPropertyChanges =
		{
			{
				WeaponName = "DionysusPlagueWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				BaseMin = 4,
				BaseMax = 4,
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
		}
	},
	DionysusSlowTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_06",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.3,
				MaxMultiplier = 1.5,

			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.2,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				BaseValue = 0.85,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Multiply",
				DeriveSource = "ModifierSource",
				ExtractValue =
				{
					ExtractAs = "InitialSlow",
					Format = "NegativePercentDelta",
				}
			},
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				ChangeValue = 4,
				ChangeType = "Absolute",
				DeriveSource = "DurationSource",
				ExtractValue =
				{
					ExtractAs = "SlowDuration",
				}
			},
			-- Active
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			-- Modifier
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			-- Duration
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
		}
	},

	DionysusAoETrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_05",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				BaseValue = 100,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},

				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "DionysusField",
					BaseProperty = "DamageRadius",
				}
			},
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "DionysusRangedTrait"
			},
		},
	},

	DionysusDefenseTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_11",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName= "WinePuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName= "WinePuddleDefense",
				EffectProperty = "Modifier",
				BaseMin = 0.85,
				BaseMax = 0.90,
				SourceIsMultiplier = true,
				DeriveSource = "ModifierSource",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			-- Active
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				EffectName= "WinePuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			-- Modifier
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				EffectName= "WinePuddleDefense",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
		},
	},


	DionysusComboVulnerability =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "DionysusComboVulnerability",
		God = "Dionysus",
		Icon = "Boon_Dionysus_08",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName= "WinePuddleVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName= "WinePuddleVulnerability",
				EffectProperty = "Modifier",
				BaseMin = 2.0,
				BaseMax = 2.0,
				SourceIsMultiplier = true,
				DeriveSource = "ModifierSource",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				}
			},
		},
	},

	GiftHealthTrait =
	{
		Icon = "Boon_Dionysus_05",
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",

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
		GiftPointHealthMultiplier =
		{
			BaseValue = 20,
			AsInt = true,
			MinMultiplier = 0.05,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "GiftPointHealthMultiplier",
				ExtractAs = "TooltipHealthConversion",
			}
		}
	},

	DionysusMaxHealthTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Hidden = true,
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 25,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},
	DionysusWeaponTrait =
	{
		Icon = "Boon_Dionysus_01",
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
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
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				ChangeType = "Add",
				BaseMin = 4,
				BaseMax = 4,
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
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxDionysus",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeDionysus",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Dionysus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Dionysus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Dionysus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Dionysus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


		}
	},

	DionysusSecondaryTrait =
	{
		Icon = "Boon_Dionysus_00",
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
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
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				BaseMin = 5,
				BaseMax = 5,
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
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionDionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "DionysusImpactPieceSpearThrow",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalDionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		}
	},

	DionysusRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Slot = "Ranged",
		Icon = "Boon_Dionysus_02",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DionysusLobProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "SilentImpactOnInvulnerable",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ManualAiming",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AutoLockRange",
				ChangeValue = 900,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ManualAimingInitialOffset",
				ChangeValue = 420,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "GunGrenadeWarningDecal",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusRangedWeapon_ChargeDionysusLob",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "DionysusLobProjectile",
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				AsInt = true,
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
				ProjectileName = "DionysusLobProjectile",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			-- In case bow load ammo is Active
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Type",
				ChangeValue = "INSTANT",
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
			}
		}
	},

	DionysusRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
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
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Dionysus",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Dionysus",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DionysusDashProjectile",
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateOnInterval",
				ChangeValue = 120,
				ChangeType = "Absolute",
			},
			]]
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
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "Range",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				BaseMin = 2,
				BaseMax = 2,
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
	},

	AmmoFieldTrait =
	{
		Icon = "Boon_Zeus_08",
		InheritFrom = { "ShopTier1Trait" },
		PreEquipWeapons = { "DionysusAmmoWeapon" },
		AmmoFieldWeapon =
		{
			WeaponName = "DionysusAmmoWeapon",
			Interval = { Min = 1.5, Max = 1.5 }
		},
		PropertyChanges =
		{
			{
				WeaponName = "DionysusAmmoWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				ChangeType = "Add",
				BaseMin = 5,
				BaseMax = 5,
				AsInt = true,
				MinMultiplier = 0.2,
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
		}
	},

	AmmoBoltTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Artemis_Zeus_01",
		RequiredFalseTrait = "AmmoBoltTrait",
		RequiredInactiveMetaUpgrade = "ReloadAmmoMetaUpgrade",
		PreEquipWeapons = { "ZeusAmmoWeapon" },
		AmmoFieldWeapon =
		{
			WeaponName = "ZeusAmmoWeapon",
			Interval = { Min = 1.5, Max = 1.5 },
			Range = 450,
		},
		PropertyChanges =
		{
			{
				WeaponName = "ZeusAmmoWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "ZeusAmmoWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				UnitProperty = "Magnetism",
				BaseValue = 0.5,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipMagnetism",
					Format = "PercentDelta"
				}
			},
		}
	},

	DionysusShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "DionysusShoutTrait_Tray",
		God = "Dionysus",
		Slot = "Shout",
		Icon = "Boon_Dionysus_04",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,
			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		AddShout =
		{
			FunctionName = "DionysusShout",
			Cost = 25,
			SuperDuration = 1.5,
			MaxDurationMultiplier = 6,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				}
			}
		},
		PreEquipWeapons = { "DionysusShoutWeapon" },
		PropertyChanges =
		{
			{
				WeaponName = "DionysusShoutWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeType = "Absolute",
				ChangeValue = true,
			},
			{
				WeaponName = "DionysusShoutWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				ChangeType = "Add",
				BaseMin = 15,
				BaseMax = 15,
				AsInt = true,
				MinMultiplier = 0.25,
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
		}
	},

	DionysusPoisonPowerTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_09",
		AddOutgoingDamageModifiers =
		{
			EffectThresholdDamageMultiplier =
			{
				BaseValue = 1.50,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "EffectThresholdDamageMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				UnitProperty = "EffectDamageMultiplierName",
				ChangeValue = "DamageOverTime",
				ChangeType = "Absolute",
			},
			{
				UnitProperty = "EffectDamageMultiplierMinRequired",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipRequiredPoisonedEnemies",
					SkipAutoExtract = true,
				}
			},
		}
	},

	DoorHealTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		CustomNameWithMetaUpgrade =
		{
			MetaUpgradeName = "HealingReductionShrineUpgrade",
			Name = "DoorHealTrait_Reduced",
		},
		Icon = "Boon_Dionysus_10",
		RequiredFalseTraits = { "DoorHealTrait" },
		RarityLevels = {
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
				Multiplier = 2.0,
			}
		},
		CombatEncounterHealthPercentFloor =
		{
			BaseValue = 0.3,
			ReducedByMetaupgradeValue = "HealingReductionShrineUpgrade",
			IdenticalMultiplier =
			{
				DiminishingReturnsMultiplier = 0.4,
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "CombatEncounterHealthPercentFloor",
				ExtractAs = "TooltipHeal",
				Format = "Percent",
			},
			{
				ExtractAs = "HealingReduction",
				Format = "TotalMetaUpgradeChangeValue",
				MetaUpgradeName = "HealingReductionShrineUpgrade"
			}
		}
	},

	-- Demeter


	DemeterWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Slot = "Melee",
		Icon = "Boon_Demeter_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.4,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxDemeter",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeDemeter",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Demeter-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Demeter-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Demeter-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Demeter-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipe-Demeter-Flipped",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		}
	},

	DemeterSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Slot = "Secondary",
		Icon = "Boon_Demeter_00",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.6,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionDemeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalDemeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	DemeterRangedTrait =
	{
		Icon = "Boon_Demeter_02",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Ranged",
		CustomTrayText = "DemeterRangedTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.15,
			},
			Epic =
			{
				Multiplier = 1.30,
			},
			Heroic =
			{
				Multiplier = 1.45,
			}
		},
		WeaponDataOverride =
		{
			RangedWeapon =
			{
				CauseImpactReaction = false,
				ImpactReactionHitsOverride = 0,
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/Leftovers/SFX/AuraCharge",
							StoppedBy = { "ChargeCancel", "Fired" }
						}
					},
					FireSounds =
					{
						{
							-- StoppedBy = { "SpeechFromCue" }
						},
					},

					ImpactSounds =
					{

					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DemeterProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Demeter",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 8,
				BaseMax = 8,
				MinMultiplier = 0.1,
				IdenticalMultiplier =
				{
					Value = -0.8,
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
			}
		}
	},
	DemeterRushTrait =
	{
		Icon = "Boon_Demeter_03",
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DemeterRushProjectile",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 15,
				BaseMax = 15,
				AsInt = true,
				MinMultiplier = 0.2,
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
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	},

	DemeterShoutTrait =
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
			FunctionName = "DemeterShout",
			MaxFunctionName = "DemeterMaxShout",
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
				}
			}
		},
		PreEquipWeapons = { "DemeterSuper", "DemeterMaxSuper", },
		PropertyChanges =
		{
			{
				WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
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
				WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	},

	HealingPotencyTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Icon = "Boon_Demeter_09",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.075,
			},
			Epic =
			{
				Multiplier = 1.150,
			},
			Heroic =
			{
				Multiplier = 1.225,
			}
		},
		TraitHealingBonus =
		{
			BaseValue = 1.3,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		DummyHealFraction = 0.3,

		ExtractValues =
		{
			{
				Key = "DummyHealFraction",
				ExtractAs = "TooltipHeal",
				Format = "PercentPlayerHealth",
			},
			{
				Key = "TraitHealingBonus",
				ExtractAs = "TooltipHealing",
				Format = "PercentDelta"
			},
		}
	},

	CastNovaTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Demeter_05",
		God = "Demeter",
		AddOnFireWeapons = { "DemeterAmmoWind" },
		LegalOnFireWeapons = WeaponSets.HeroNonPhysicalWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "DemeterAmmoWind",
				ProjectileProperty = "DamageLow",
				BaseMin = 40,
				BaseMax = 40,
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
			},
			{
				WeaponName = "DemeterAmmoWind",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	HarvestBoonTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Demeter_08",
		RequiredFalseTrait = "HarvestBoonTrait",
		RarityLevels = {
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
		},
		UpgradedTraitNum = { BaseValue = 1 },
		RoomsPerUpgrade = 3,
		CurrentRoom = 0,
		ExtractValues =
		{
			{
				Key = "UpgradedTraitNum",
				ExtractAs = "TooltipTraitNum",
			},
		},

	},
	ZeroAmmoBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Icon = "Boon_Demeter_11",
		RequiredFalseTrait = "ZeroAmmoBonusTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ZeroRangedWeaponAmmoMultiplier =
			{
				BaseValue = 1.1,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "ZeroRangedWeaponAmmoMultiplier",
					ExtractAs = "TooltipAttack",
					Format = "PercentDelta",
				},
			}
		},
		AddIncomingDamageModifiers =
		{
			ZeroRangedWeaponAmmoMultiplier = 0.9,
			ExtractValues =
			{
				{
					Key = "ZeroRangedWeaponAmmoMultiplier",
					ExtractAs = "TooltipDefense",
					Format = "NegativePercentDelta",
					SkipAutoExtract = true
				},
			}
		},
	},
	MaximumChillBlast =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Demeter_07",
		God = "Demeter",
		PreEquipWeapons = { "DemeterMaxChill" },
		RequiredFalseTrait = "MaximumChillBlast",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "DemeterMaxChill",
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			{
				WeaponName = "DemeterMaxChill",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},
	MaximumChillBonusSlow =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Demeter_12",
		God = "Demeter",
		RequiredFalseTrait = "MaximumChillBonusSlow",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		SetupFunction =
		{
			Name = "TrackMaximumChillBlast",
			RunOnce = true,
		},
		PreEquipWeapons = { "DemeterWorldChill" },
		PropertyChanges =
		{

			{
				WeaponName = "DemeterWorldChill",
				EffectName = "DemeterWorldChill",
				EffectProperty = "ElapsedTimeMultiplier",
				BaseValue = 0.9,
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
				ChangeType = "Multiply",
			},

			{
				WeaponName = "DemeterWorldChill",
				EffectName = "DemeterWorldChill",
				EffectProperty = "Amount",
				BaseValue = 20,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ChangeType = "Add",
			},
		},
	},
	InstantChillKill =
	{
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Demeter_10",
		RequiredFalseTrait = "InstantChillKill",
		OnDamageEnemyFunction = {
			FunctionName = "CheckChillKill",
			FunctionArgs = {
				ChillDeathThreshold = 0.10,
				ExtractValues =
				{
					{
						Key = "ChillDeathThreshold",
						ExtractAs = "TooltipDeathThreshold",
						Format = "Percent",
					},
				}
			}
		},
		PreEquipWeapons = { "DemeterChillKill" },
		PropertyChanges =
		{
			{
				WeaponName = "DemeterChillKill",
				ProjectileProperty = "DamageLow",
				BaseMin = 50,
				BaseMax = 50,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			{
				WeaponName = "DemeterChillKill",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},
	-- Hermes
	HermesShoutDodge =
	{
		OnSuperWeapons = { "HermesWrathBuff" },
		RequiredSlottedTrait = "Shout",
		Icon = "Boon_Hermes_12",
		RequiredFalseTraits = { "HermesShoutDodge" },
		RarityLevels = {
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 2.00,
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "HermesWrathBuff",
				EffectName = "SpeedBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.3,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipBonus",
					Format = "Percent"
				}
			},
			{
				WeaponName = "HermesWrathBuff",
				EffectName = "DodgeBonus",
				EffectProperty = "DodgeChance",
				BaseValue = 0.3,
				ChangeType = "Add",
			},
			{
				WeaponName = "HermesWrathBuff",
				EffectName = "SpeedBonus",
				EffectProperty = "Duration",
				BaseValue = 10,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					SkipAutoExtract = true
				}
			},
			{
				WeaponName = "HermesWrathBuff",
				EffectName = "DodgeBonus",
				EffectProperty = "Duration",
				BaseValue = 10,
				ChangeType = "Add",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
			}
		}
	},

	MagnetismTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "MagnetismTrait",
		RequiredInactiveMetaUpgrade = "ReloadAmmoMetaUpgrade",
		Icon = "Boon_Hermes_11",
		PropertyChanges =
		{
			{
				UnitProperty = "Magnetism",
				BaseValue = 100.0,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipMagnetism",
					Format = "PercentDelta"
				}
			},
			{
				UnitProperty = "MagnetismFx",
				ChangeValue = "HermesWings_Ammo",
			}
		},
	},

	BonusDashTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "BonusDashTrait",
		Icon = "Boon_Hermes_01",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2.00,
			},
			Epic =
			{
				Multiplier = 3.00,
			},
			Heroic =
			{
				Multiplier = 4.00,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipSize",
				BaseValue = 1,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
		},
	},

	RapidRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "RapidRushTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2.00,
			},
			Epic =
			{
				Multiplier = 3.00,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDuration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipRegenInterval",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
			]]

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "WeaponRange",
				BaseValue = 1.3,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkMaxRange",
				BaseValue = 1.3,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDisableMove",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDisableMoveRapid",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

		},
	},

	DeathDefianceFreezeTimeTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "DeathDefianceFreezeTimeTrait",
		LastStandTimeScale = 0.1,
		LastStandTimeScaleDuration =
		{
			BaseValue = 5,
		},

		ExtractValues =
		{
			{
				Key = "LastStandTimeScaleDuration",
				ExtractAs = "TooltipDuration",
				DecimalPlaces = 2,
			},
		}
	},

	FreezeTimeDashTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "FreezeTimeDashTrait",
		WeaponDataOverride =
		{
			RushWeapon =
			{
				FireRadialBlur =
				{
					Strength = 0.3,
					Distance = 1.6,
					FXInTime = 0.06,
					FXHoldTime = 0.4,
					FXOutTime = 0.4,
				},
			},
		},
		DashProperties =
		{
			Duration =
			{
				BaseValue = 0.3,

			},
			ElapsedTimeMultiplier = 0.1,
			ExtractValues =
			{
				{
					Key = "Duration",
					DecimalPlaces = 2,
					ExtractAs = "TooltipTimeFreeze",
				},
			}
		},
	},

	CollisionTouchTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "CollisionTouchTrait",
		PreEquipWeapons = { "CollisionTouchWeapon" },
		Icon = "Boon_Hermes_03",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				UnitProperty = "ContinuousWeapon",
				ChangeValue = "CollisionTouchWeapon",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "CollisionTouchWeapon",
				EffectName = "HermesSlow",
				EffectProperty = "Duration",
				ChangeValue = 3,
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
				ChangeType = "Absolute"
			},
			{
				WeaponName = "CollisionTouchWeapon",
				EffectName = "HermesSlow",
				EffectProperty = "ElapsedTimeMultiplier",
				BaseValue = 0.8,
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
				ChangeType = "Absolute",
			},
			{
				UnitProperty = "CollideWithUnits",
				ChangeValue = false,
				ChangeType = "Absolute",
			}
		}
	},

	DodgeChanceTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "DodgeChanceTrait",
		Icon = "Boon_Hermes_04",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.33,
			},
			Epic =
			{
				Multiplier = 1.66,
			},
			Heroic =
			{
				Multiplier = 2.00,
			}
		},
		PropertyChanges =
		{
			{
				LifeProperty = "DodgeChance",
				BaseValue = 0.15,
				ChangeType = "Add",
				DataValue = false,
				ExtractValue =
				{
					ExtractAs = "TooltipChance",
					Format = "Percent"
				},
			},
		}
	},

	RapidCastTrait =
	{
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 0.75,
				MaxMultiplier = 0.75,
			},
			Epic =
			{
				MinMultiplier = 0.50,
				MaxMultiplier = 0.50,
			},
			Heroic =
			{
				MinMultiplier = 0.25,
				MaxMultiplier = 0.25,
			},
		},
		RequiredFalseTraits = { "RapidCastTrait", "BowLoadAmmoTrait" },
		RequiredInactiveMetaUpgrade = "ReloadAmmoMetaUpgrade",
		Icon = "Boon_Hermes_02",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ChargeTime",
				BaseValue = 0.8,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeedIncrease",
					Format = "NegativePercentDelta",
				},
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "SpeedMultiplier",
				BaseValue = 0.8,
				SourceIsNegativeMultiplier = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusRangedWeapon_FireRepeat",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "RangedDisable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "RangedDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "RangedDisableCancelableFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Hermes",
				ChangeType = "Absolute",
			},
		},
		WeaponDataOverride =
		{
			RangedWeapon =
			{
				NotReadyAmmoPackText = "",
			},
		},
	},

	RushSpeedBoostTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_08",
		RequiredFalseTrait = "RushSpeedBoostTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponSpeedBoost",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponSpeedBoost",
				EffectProperty = "Duration",
				BaseValue = 0.6,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponSpeedBoost",
				EffectProperty = "Modifier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipSpeedBoost",
					Format = "PercentDelta",
				},
			},
		},
	},

	MoveSpeedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_05",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.08,
				MaxMultiplier = 1.08,
			},
			Epic =
			{
				MinMultiplier = 1.17,
				MaxMultiplier = 1.17,
			},
			Heroic =
			{
				MinMultiplier = 1.24,
				MaxMultiplier = 1.24,
			},
		},
		RequiredFalseTrait = "MoveSpeedTrait",
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				BaseValue = 1.2,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},
		}
	},

	RushRallyTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_07",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 0.20,
				MaxMultiplier = 0.20,
			},
			Rare =
			{
				MinMultiplier = 0.30,
				MaxMultiplier = 0.30,
			},
			Epic =
			{
				MinMultiplier = 0.40,
				MaxMultiplier = 0.40,
			},
			Heroic =
			{
				MinMultiplier = 0.50,
				MaxMultiplier = 0.50,
			},
		},
		RequiredFalseTrait = "RushRallyTrait",
		PropertyChanges =
		{
			{
				LuaTable = "RallyHealth",
				LuaProperty = "RallyActive",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				LuaTable = "RallyHealth",
				LuaProperty = "RallyHealOnDash",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				LuaTable = "RallyHealth",
				LuaProperty = "HitsDrainRallyHealthMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				LuaTable = "RallyHealth",
				LuaProperty = "ConversionPercent",
				BaseValue = 1.0,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipHeal",
					Format = "Percent",
				}
			},
			{
				LuaTable = "RallyHealth",
				LuaProperty = "RallyDecayRateSeconds",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
			},
		}
	},

	HermesBonusProjectilesTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		PropertyChanges =
		{
			{
				TraitName = "HermesRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "NumProjectiles",
				ChangeValue = 5,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
				}
			},
		}
	},

	HermesRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "HermesProjectile",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "NumProjectiles",
				ChangeValue = 5,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.04,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileAngleOffsetMin",
				ChangeValue = -0.087,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileAngleOffsetMax",
				ChangeValue = 0.087,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 20,
				BaseMax = 40,
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
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	},

	HermesRushAreaSlow =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "HermesRushAreaSlow",
		PreEquipWeapons = { "AreaSlowWeapon" },
		Icon = "Boon_Hermes_10",
		DashChargeProperties =
		{
			StartCue = "/SFX/Player Sounds/HermesWhooshDash",
			EndCue = "/SFX/Player Sounds/HermesWhooshDashReverse",
			--AudioFilter = "Pause",
			--ColorGrade = "TimeStop",
			--ColorGradeStartDuration = 0.1,
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx2",
				ChangeValue = "HermesRushSpeedLight",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushAreaSlowWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		},
	},

	HermesPlannedRushTrait =
	{
		Icon = "Boon_Athena_03",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "HermesPlannedRushTrait",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 0.7,
				MaxMultiplier = 0.7,
			},
			Rare =
			{
				MinMultiplier = 0.6,
				MaxMultiplier = 0.6,
			},
			Epic =
			{
				MinMultiplier = 0.5,
				MaxMultiplier = 0.5,
			},
		},
		DashChargeProperties =
		{
			StartCue = "/SFX/Player Sounds/HermesWhooshDash",
			EndCue = "/SFX/Player Sounds/HermesWhooshDashReverse",
			AudioFilter = "Pause",
			ColorGrade = "TimeStop",
			ColorGradeStartDuration = 0.1,
			--[[
			ElapsedTimeMultiplier =
			{
				BaseValue = 0.25,
			},
			ExtractValues =
			{
				{
					Key = "ElapsedTimeMultiplier",
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
			}
			]]
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ChargeTime",
				BaseValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "MinChargeToFire",
				BaseValue = 0.05,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "WeaponRange",
				BaseValue = 1.5,
				ChangeType = "Multiply",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkMaxRange",
				BaseValue = 1.5,
				ChangeType = "Multiply",
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ForceMaxChargeRelease",
				BaseValue = true,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "HermesRushSpeedLight",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusDashFrame",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipRegenOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLine_HermesPlannedRushTrait",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AreaSlowWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AreaSlowWeapon",
				ChangeType = "Absolute",
			},
			]]
		},
	},

	HermesPlannedRushTrait2 =
	{
		Icon = "Boon_Athena_03",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "HermesPlannedRushTrait",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 0.7,
				MaxMultiplier = 0.7,
			},
			Rare =
			{
				MinMultiplier = 0.6,
				MaxMultiplier = 0.6,
			},
			Epic =
			{
				MinMultiplier = 0.5,
				MaxMultiplier = 0.5,
			},
		},
		DashChargeProperties =
		{
			StartCue = "/SFX/Player Sounds/HermesWhooshDash",
			EndCue = "/SFX/Player Sounds/HermesWhooshDashReverse",
			AudioFilter = "Pause",
			ColorGrade = "TimeStop",
			ColorGradeStartDuration = 0.1,
			ElapsedTimeMultiplier =
			{
				BaseValue = 0.25,
			},
			ExtractValues =
			{
				{
					Key = "ElapsedTimeMultiplier",
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ChargeTime",
				BaseValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "HermesRushSpeedLight",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusStop",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipRegenOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLine_HermesPlannedRushTrait",
				ChangeType = "Absolute",
			},
		},
	},


	HermesWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_06",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.250,
				MaxMultiplier = 1.250,
			},
			Rare =
			{
				MinMultiplier = 1.125,
				MaxMultiplier = 1.125,
			},
			Epic =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Heroic =
			{
				MinMultiplier = 0.875,
				MaxMultiplier = 0.875,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineA",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon2" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineB",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "SwordWeapon3" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Sword3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Sword3_Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Spear",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				EffectName = "ShieldDisableAttack",
				EffectProperty = "Active",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				EffectName = "ShieldDisableAttackFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineB_Shield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_ShieldRush",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesBowTrail",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon" },
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesGunTrail",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponDash" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
		},
		ExtractEntry =
		{
			BaseValue = 0.70,
		},
		ExtractValues =
		{
			{
				Key = "ExtractEntry",
				DecimalPlaces = 2,
				Format = "NegativePercentDelta",
				ExtractAs = "TooltipSpeedIncrease",
			},
		}
	},

	HermesSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_09",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.250,
				MaxMultiplier = 1.250,
			},
			Rare =
			{
				MinMultiplier = 1.125,
				MaxMultiplier = 1.125,
			},
			Epic =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Heroic =
			{
				MinMultiplier = 0.875,
				MaxMultiplier = 0.875,
			},
		},
		RequiredFalseTraits = { "SwordSecondaryBlinkTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordParryChargeFast",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DislodgeAmmoTrait",
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02ParryChargeFast",
				ChangeType = "Absolute",
			},
			{
				TraitName = "SwordCriticalParryTrait",
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01ParryChargeFast",
				ChangeType = "Absolute",
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt03ParryCharge", -- this is different from the others on purpose
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryDisableFastCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "CooldownWeaponSlotThree",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_SwordParry",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow", "SpearWeaponThrowReturn" },
				ProjectileProperty = "Speed",
				BaseValue = 1.3,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "SpearWeaponThrow",
				EffectName = "SpearThrowDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				EffectName = "SpearThrowDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				EffectName = "SpearThrowDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				EffectName = "SpearThrowDisableFastCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				EffectName = "SpearThrowReturnDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				EffectName = "SpearThrowReturnDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},


			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_Bow",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "StartFx2",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},


			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "DisableOwnerForDuration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Speed",
				BaseValue = 1.3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Acceleration",
				BaseValue = 2.1,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "HermesShieldTrail",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_Bow",
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "CooldownWeaponSlotThree",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableFastCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_Bow",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableCancelableFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			-- this is for GunGrenadeFastTrait
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ClipRegenInterval",
				ChangeValue = 0.7,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_GunGrenade",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "FistWeaponSpecialDash",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "FistWeaponSpecialDash",
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},

		},
		ExtractEntry =
		{
			BaseValue = 0.7,
		},
		ExtractValues =
		{
			{
				Key = "ExtractEntry",
				DecimalPlaces = 2,
				Format = "NegativePercentDelta",
				ExtractAs = "TooltipSpeedIncrease",
			},
		},
	},

	MoneyMultiplierTrait =
	{
		MoneyMultiplier = 2.0,
		RemainingUses = 3,
		UsesAsEncounters = true,
	},

	-- Shop Traits --

	ImprovedWeaponTrait =
	{
		Cost = 100,
		CostIncreasePerStack = 500,
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				ChangeValue="1.2",
				ChangeType="MultiplyBase",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				}
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				ChangeValue="1.2",
				ChangeType="MultiplyBase",
			}
		}
	},

	ReducedCooldownTrait =
	{
		Cost = 100,
		CostIncreasePerStack = 500,
		MaxAmount = 1,
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				WeaponProperty = "CooldownWeaponSlotThree",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipCooldownReduction",
					Format = "NegativePercentDelta",
				}
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
			},
		}
	},

	-- Gift Traits
	LifeOnUrnTrait=
	{
		Icon = "Keepsake_Duster",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "LifeOnUrnTrait_Rack",
		DropOnKill = {
			Chance = { BaseValue = 0.02} ,
			DropCap = 1,
			Name = "HealDropMinor",
			ValidEnemies = { "Breakable" },
			ExtractValues =
			{
				{
					Key = "Chance",
					ExtractAs = "TooltipDropChance",
					Format = "Percent",
				}
			}
		},
	},

	ShopDurationTrait =
	{
		Icon = "Keepsake_Hourglass",
		EquipSound = "/SFX/Menu Sounds/KeepsakeCharonBoneHourglass",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ShopDurationTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			}
		},
		TraitDurationIncrease =
		{
			ValidTraits = {
			"TemporaryImprovedWeaponTrait",
			"TemporaryImprovedRangedTrait",
			"TemporaryWeaponLifeOnKillTrait",
			"TemporaryMoreAmmoTrait",
			"TemporaryBonusDamageTrait",
			"TemporaryMoveSpeedTrait",
			"TemporaryDoorHealTrait",
			"TemporaryLastStandHealTrait",
			},
			Amount = { BaseValue = 4 },
			ExtractValues =
			{
				{
					Key = "Amount",
					ExtractAs = "TooltipDurationBonus",
				}
			}
		},
	},


	ReincarnationTrait =
	{
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ReincarnationTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		Icon = "Keepsake_Skelly_Tooth",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSkellyTooth",
		KeepsakeLastStandHealAmount = { BaseValue = 50 },
		ExtractValues =
		{
			{
				Key = "KeepsakeLastStandHealAmount",
				ExtractAs = "TooltipLastStandHealth",
			},
		}
	},

	FuryAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "FuryAssistTrait_Rack",
		InRackIcon = "Keepsake_Meg_Plush_Menu",
		Icon = "Keepsake_Meg_Plush",

		EquipSound = "/SFX/Menu Sounds/KeepsakeMegLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			WeaponName = "NPC_FurySister_01_Assist",
			GameStateRequirements = {
				RequiredFalseRooms = { "A_Boss01", "A_Boss02", "A_Boss03", "D_Boss01" }
				 },
			AssistPresentationPortrait = "Portrait_FurySister01_Default_01",
			AssistPresentationColor = { 200, 0, 255, 255 },
			AssistPostWeaponSlowDuration = 1.3,
		},
		PropertyChanges =
		{

			{
				WeaponName = "NPC_FurySister_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 2500,
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
				WeaponName = "NPC_FurySister_01_Assist",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		LoadBinks =
		{
			"Enemy_MegaeraMultiFurySkyDive_Bink",
		},
	},

	ThanatosAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "ThanatosAssistTrait_Rack",
		InRackIcon = "Keepsake_Thanatos_Plush_Menu",
		Icon = "Keepsake_Thanatos_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeThanatosLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			WeaponName = "NPC_Thanatos_01_Assist",
			GameStateRequirements = {
				RequiredFalseRooms = { "D_Boss01" },
				RequiredFalseEncounters = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium" }
				 },
			AssistPresentationPortrait = "Portrait_Thanatos_Default_01",
			AssistPresentationColor = { 200, 0, 255, 255 },
		},
		PropertyChanges =
		{

			{
				WeaponName = "NPC_Thanatos_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 3500,
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
				WeaponName = "NPC_Thanatos_01_Assist",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		LoadBinks =
		{
			"ThanatosAttackHold_Bink",
		},
	},

	SisyphusAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "SisyphusAssistTrait_Rack",
		InRackIcon = "Keepsake_Sisiyphus_Plush_Menu",
		Icon = "Keepsake_Sisiyphus_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSisyphusLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			FunctionName = "SisyphusLootSprinkle",
			SisyphusWeapon = "NPC_Sisyphus_01_Assist",
			LootOptions =
			{
				{
					Name = "MinorMoneyDrop",
					MinAmount = 1,
					MaxAmount = 1,
				},
				{
					Name = "HealDropMinor",
					MinAmount = 5,
					MaxAmount = 6,
				},
				{
					Name = "RoomRewardMetaPointDrop",
					MinAmount = 1,
					MaxAmount = 1,
				},
			},
			Range = 80,
			MinForce = 200,
			MaxForce = 350,
			GameStateRequirements = {},
			AssistPresentationPortrait = "Portrait_Sisyphus_Default_01",
			AssistPresentationColor = { 110, 255, 0, 255 },
		},
		PreEquipWeapons = {"NPC_Sisyphus_01_Assist"},
		PropertyChanges =
		{

			{
				WeaponName = "NPC_Sisyphus_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 1000,
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
				WeaponName = "NPC_Sisyphus_01_Assist",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		RemainingUses = { BaseValue = 1 },
		LoadPackages = "NPC_Sisyphus_01_Assist",
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		}
	},

	SkellyAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "SkellyAssistTrait_Rack",
		InRackIcon = "Keepsake_Skelly_Plush_Menu",
		Icon = "Keepsake_Skelly_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSkellyLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			FunctionName = "SkellyAssist",
			GameStateRequirements = { },
			AssistPresentationPortrait = "Portrait_Skelly_Default_01",
			AssistPresentationColor = { 96, 64, 255, 255 },
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		LoadBinks =
		{
			"Enemy_Skeleton_Idle_Bink",
			"Enemy_Skeleton_OnHit_Bink",
			"Enemy_Skeleton_Dead_Bink",
		},
	},

	DusaAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "DusaAssistTrait_Rack",
		InRackIcon = "Keepsake_Dusa_Plush_Menu",
		Icon = "Keepsake_Dusa_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeDusaLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			FunctionName = "DusaAssist",
			Duration = 25,
			GameStateRequirements = {
				RequiredFalseRooms = { "D_Boss01" }
				 },
			AssistPresentationPortrait = "Portrait_Dusa_Confident_01",
			AssistPresentationColor = { 255, 50, 240, 255 },
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		LoadPackages = "DusaSummon",
		Binks =
		{
			"NPC_DusaIdle_Bink",
			"NPC_DusaIdleWorking_Bink",
		}
	},


	HeroicStandTrait =
	{
		InheritFrom = { "GiftTrait" },
		InRackTitle = "HeroicStandTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		Icon = "Keepsake_Skelly_Tooth",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSkellyTooth",
		LastStandWeapon = "LastStandReincarnateShield",
		CurrentCooldown = 1,
		RoomCooldown = 1,
		LastStandTimer =
		{
			BaseValue = 5
		},
		PropertyChanges =
		{
			{
				LuaProperty = "LastStandHealth",
				BaseValue = 1,
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				Key = "LastStandTimer",
				ExtractAs = "TooltipLastStandTimer",
			},
		}
	},

	ShieldAfterHitTrait =
	{
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ShieldAfterHitTrait_Rack",
		Icon = "Keepsake_Spear",
		EquipSound = "/Leftovers/Menu Sounds/TalismanMetalClankDown",
		AddOnHitWeapons = { "ShieldBarrier" },
		OnHitWeaponProperties = { IgnoreAutomatic = true },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldBarrier",
				EffectName = "MagicShieldWeaponInvincible",
				EffectProperty = "Duration",
				BaseValue = 1.0,
				ChangeType = "Absolute",
				DeriveSource = "DurationSource",
				ExtractValue =
				{
					ExtractAs = "ShieldDuration",
					DecimalPlaces = 2,
				}
			},

		}
	},

	DarknessRoomTrait =
	{
		InheritFrom = { "GiftTrait" },
		DarknessPerRoom = {
			Base = 1,
			DepthMult = 0,
		}
	},

	DiscountTrait =
	{
		InheritFrom = { "GiftTrait" },
		StoreCostMultiplier = 0.8,
	},

	AlphaStrikeTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				LuaProperty = "TargetHighHealthDamageOutputMultiplier",
				ChangeValue = 1.5,
				ChangeType = "Add",
			},
			{
				LuaProperty = "TargetHighHealthThreshold",
				ChangeValue = 0.8,
				ChangeType = "Absolute",
			},
		},
	},

	DirectionalArmorTrait =
	{
		Icon = "Keepsake_Bracer",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAchillesBracer",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "DirectionalArmorTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 2.0,
			},
			Rare =
			{
				Multiplier = 2.5,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		AddIncomingDamageModifiers =
		{
			HitVulnerabilityMultiplier = 1.1,
			HitArmorMultiplier =
			{
				BaseValue = 0.9,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "HitArmorMultiplier",
					ExtractAs = "TooltipDefense",
					Format = "NegativePercentDelta",
				},
				{
					Key = "HitVulnerabilityMultiplier",
					ExtractAs = "TooltipVulnerability",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				LifeProperty = "ArmorCoverage",
				ChangeValue = math.rad(200) ,
				ChangeType = "Absolute",
				DataValue = false,
			},
		},
	},

	LowHealthDamageTrait =
	{
		Icon = "Keepsake_Earring",
		EquipSound = "/SFX/Menu Sounds/KeepsakeMegSkullEarring",
		ProcSound = "/Leftovers/SFX/PositiveTalismanProc_2",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "LowHealthDamageTrait_Rack",
		LowHealthThresholdText =
		{
			-- Display variable only, to change the data value change the value below under "LowHealthThreshold"
			Threshold = 0.3,
			Text = "Hint_LowHealthDamageTrait",
		},
		AddOutgoingDamageModifiers =
		{
			LowHealthThreshold = 0.3,
			LowHealthDamageOutputMultiplier =
			{
				BaseValue = 1.2,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "LowHealthDamageOutputMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
				{
					Key = "LowHealthThreshold",
					ExtractAs = "TooltipThreshold",
					Format = "Percent",
				},
			}
		}
	},
	FastClearDodgeBonusTrait =
	{
		Icon = "Keepsake_Feather",
		EquipSound = "/SFX/Menu Sounds/KeepsakeHermesFastClear",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "FastClearDodgeBonusTrait_Rack",
		UnequippedKeepsakeTitle = "FastClearDodgeBonusTrait_Dead",
		CustomNameWhileDead = "FastClearDodgeBonusTrait_Dead",
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
			}
		},
		FastClearThreshold = 30,
		FastClearDodgeBonus =
		{
			BaseValue = 0.01,
			DecimalPlaces = 4,
		},
		FastClearSpeedBonus =
		{
			BaseValue = 0.01,
			DecimalPlaces = 4,
		},
		AccumulatedDodgeBonus = 0,
		ExtractValues =
		{
			{
				Key = "FastClearDodgeBonus",
				ExtractAs = "TooltipFastClearDodgeBonus",
				Format = "Percent",
				DecimalPlaces = 2,
			},
			{
				Key = "AccumulatedDodgeBonus",
				ExtractAs = "TooltipAccumulatedBonus",
				Format = "Percent",
				DecimalPlaces = 2,
			},
		}

	},
	PerfectClearDamageBonusTrait =
	{
		Icon = "Keepsake_Butterfly",
		EquipSound = "/SFX/Menu Sounds/KeepsakeThanatosButterflyBell",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "PerfectClearDamageBonusTrait_Rack",
		UnequippedKeepsakeTitle = "PerfectClearDamageBonusTrait_Dead",
		CustomNameWhileDead = "PerfectClearDamageBonusTrait_Dead",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,

			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		PerfectClearDamageBonus =
		{
			BaseValue = 1.01,
			SourceIsMultiplier = true,
			DecimalPlaces = 3,
		},
		AddOutgoingDamageModifiers =
		{
			UseTraitValue = "AccumulatedDamageBonus",
		},
		AccumulatedDamageBonus = 1,
		ExtractValues =
		{
			{
				Key = "PerfectClearDamageBonus",
				ExtractAs = "TooltipPerfectClearBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
			{
				Key = "AccumulatedDamageBonus",
				ExtractAs = "TooltipAccumulatedBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
		}
	},

	PerfectClearHealthBonusTrait =
	{
		Icon = "Keepsake_Shackle",
		InheritFrom = { "GiftTrait" },
		HealthBonus = { BaseValue = 1 },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,

			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		ExtractValues =
		{
			{
				Key = "HealthBonus",
				ExtractAs = "TooltipHealthBonus",
			}
		}
	},

	LowHealthDefenseTrait =
	{
		Icon = "Boon_Dionysus_12",
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		PriorityDisplay = true,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
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
			},
		},
		LowHealthThresholdText =
		{
			-- Display variable only, to change the data value change the value below under "LowHealthThreshold"
			Threshold = 0.4,
			Text = "Hint_LowHealthDefenseTrait",
		},
		AddIncomingDamageModifiers =
		{
			LowHealthThreshold = 0.4,
			LowHealthDamageTakenMultiplier =
			{
				BaseValue = 0.9,
				MinMultiplier = 0.1,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "LowHealthDamageTakenMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "NegativePercentDelta",
				},
				{
					Key = "LowHealthThreshold",
					ExtractAs = "TooltipThreshold",
					Format = "Percent",
					SkipAutoExtract = true
				},
			}
		}
	},
	NoCollisionTrait =
	{
		Icon = "Keepsake_Shawl",
		EquipSound = "/SFX/Menu Sounds/KeepsakeNyxShawl",
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				UnitProperty = "CollideWithUnits",
				ChangeValue = false,
				ChangeType = "Absolute",
			}
		},
		PermanentNoUnitCollision = true,
	},

	MetaPointHealTrait =
	{
		Icon = "Keepsake_Shawl",
		EquipSound = "/SFX/Menu Sounds/KeepsakeNyxShawl",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "MetaPointHealTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		MetaPointHealMultiplier = { BaseValue = 0.5 },
		ExtractValues =
		{
			{
				Key = "MetaPointHealMultiplier",
				ExtractAs = "TooltipHealConversion",
				Format = "Percent",
			}
		}
	},

	BackstabAlphaStrikeTrait =
	{
		Icon = "Keepsake_Shawl",
		EquipSound = "/SFX/Menu Sounds/KeepsakeNyxShawl",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "BackstabAlphaStrikeTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		AddOutgoingDamageModifiers =
		{
			HitMaxHealthMultiplier = {
				BaseValue = 1.1,
				SourceIsMultiplier = true,
			},
			HitVulnerabilityMultiplier = {
				BaseValue = 1.1,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "HitMaxHealthMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	ShieldBossTrait =
	{
		Icon = "Keepsake_Acorn",
		EquipSound = "/SFX/Menu Sounds/KeepsakeEurydiceAcorn",
		InRackTitle = "ShieldBossTrait_Rack",
		InheritFrom = { "GiftTrait" },
		PreEquipWeapons = { "EurydiceDefenseApplicator" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 3,
			},
			Rare =
			{
				Multiplier = 4,
			},
			Epic =
			{
				Multiplier = 5,
			}
		},
		BossEncounterShieldHits = { BaseValue = 1 },

		ExtractValues =
		{
			{
				Key = "BossEncounterShieldHits",
				ExtractAs = "TooltipHits",
			},
		}
	},

	MegaRubbleTrait =
	{
		Icon = "Keepsake_Shackle",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSisyphusShackle",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "MegaRubbleTrait_Rack",
		PreEquipWeapons = WeaponSets.RubbleWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.RubbleWeapons,
				ProjectileProperty = "DamageLow",
				BaseValue = 3,
				ChangeType="MultiplyBase",
			},
			{
				WeaponNames = WeaponSets.RubbleWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			}
		},
		EnemyIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseValue = 3.0,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	DistanceDamageTrait =
	{
		Icon = "Keepsake_Memory",
		EquipSound = "/SFX/Menu Sounds/KeepsakeOrpheysDistantMemoryJar",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "DistanceDamageTrait_Rack",

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		AddOutgoingDamageModifiers =
		{
			DistanceThreshold = 500,
			DistanceMultiplier =
			{
				BaseValue = 1.1,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "DistanceMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	BloodAmmoTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "UseHealthForAmmo",
				ChangeValue = 5,
				ChangeType = "Add",
			},
		},
	},

	MaxHealthKeepsakeTrait =
	{
		Icon = "Keepsake_Collar",
		EquipSound = "/SFX/Menu Sounds/KeepsakeCerberusCollar",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "MaxHealthKeepsakeTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 25,
				AsInt = true,
				ChangeType = "Add",
				MaintainDelta = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	LifeOnKillTrait =
	{
		InheritFrom = { "GiftTrait" },
		DropOnKill = {
			Chance = 0.01,
			DropCap = 1,
			Name = "HealDropMinor",
			ExtractValues =
			{
				{
					Key = "Chance",
					ExtractAs = "TooltipDropChance",
					Format = "Percent",
				}
			}
		},
	},

	IncreasedWrathStockTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				LuaProperty = "SuperCost",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
		},
	},

	RetainMoneyOnDeathTrait =
	{
		Icon = "Keepsake_Purse",
		EquipSound = "/SFX/Menu Sounds/KeepsakeHypnosCoinPurse",
		InheritFrom = { "GiftTrait" },
		UnequippedKeepsakeTitle = "RetainMoneyOnDeathTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.25,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 1.75,
			}
		},
		RetainedMoneyOnDeath = { BaseValue = 100 },
		ExtractValues =
		{
			{
				Key = "RetainedMoneyOnDeath",
				ExtractAs = "TooltipRetainedMoney",
				Format = "RetainedMoney",
			}
		}
	},


	BonusMoneyTrait =
	{
		Icon = "Keepsake_Purse",
		EquipSound = "/SFX/Menu Sounds/KeepsakeHypnosCoinPurse",
		InheritFrom = { "GiftTrait" },
		UnequippedKeepsakeTitle = "BonusMoneyTrait_Rack",
		CustomNameWhileDead = "BonusMoneyTrait_Dead",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			}
		},
		BonusMoney = { BaseValue = 100 },
		ExtractValues =
		{
			{
				Key = "BonusMoney",
				ExtractAs = "TooltipMoney",
			}
		}
	},
	FreeHealthGateTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},

		},
		FreeHealthGates = true,
	},

	HealthAsAmmoTrait =
	{
		HealthCostPerAmmo = 10,
	},

	DefensiveRushTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DashDamageShield",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DashDamageShield",
				EffectProperty = "Modifier",
				ChangeValue = 0.75,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DashDamageShield",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
			},
		},
	},

	ForceZeusBoonTrait =
	{
		Icon = "Keepsake_Signet",
		EquipSound = "/SFX/Menu Sounds/KeepsakeZeusRing",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceZeusBoonTrait_Rack",
		ForceBoonName = "ZeusUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "ZeusUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	ForceDemeterBoonTrait =
	{
		Icon = "Keepsake_Cornucopia",
		EquipSound = "/SFX/Menu Sounds/KeepsakeDemeterHorn",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceDemeterBoonTrait_Rack",
		ForceBoonName = "DemeterUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "DemeterUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	ForceArtemisBoonTrait =
	{
		Icon = "Keepsake_Arrowhead",
		EquipSound = "/SFX/Menu Sounds/KeepsakeArtemisArrow",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceArtemisBoonTrait_Rack",
		ForceBoonName = "ArtemisUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "ArtemisUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	ForceAphroditeBoonTrait =
	{
		Icon = "Keepsake_Rose",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAphroditeRose",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceAphroditeBoonTrait_Rack",
		ForceBoonName = "AphroditeUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "AphroditeUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	ForceAresBoonTrait =
	{
		Icon = "Keepsake_Vial",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAresBloodVial",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceAresBoonTrait_Rack",
		ForceBoonName = "AresUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "AresUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	ForceAthenaBoonTrait =
	{
		Icon = "Keepsake_Pendant",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAthenaOwl",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceAthenaBoonTrait_Rack",
		ForceBoonName = "AthenaUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "AthenaUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	ForceDionysusBoonTrait =
	{
		Icon = "Keepsake_Goblet",
		EquipSound = "/SFX/Menu Sounds/KeepsakeDionysusCup",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceDionysusBoonTrait_Rack",
		ForceBoonName = "DionysusUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "DionysusUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	ForcePoseidonBoonTrait =
	{
		Icon = "Keepsake_Conch",
		EquipSound = "/SFX/Menu Sounds/KeepsakePoseidonShell",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForcePoseidonBoonTrait_Rack",
		ForceBoonName = "PoseidonUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "PoseidonUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	ChaosBoonTrait =
	{
		Icon = "Keepsake_Egg",
		EquipSound = "/SFX/Menu Sounds/KeepsakeChaosEgg",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ChaosBoonTrait_Rack",
		SecretDoorCostMultiplier =
		{
			BaseMin = 0,
			BaseMax = 0,
		},
		RarityBonus =
		{
			RequiredGod = "TrialUpgrade",
			RareBonus = { BaseValue = 0.2 },
			EpicBonus = 0.15,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		}
	},

	InfiniteAmmoTrait =
	{
		InfiniteAmmo = true,
	},

	TemporaryImprovedWeaponTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Jerky",
		Cost = 40,
		RemainingUses = 3,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.3,
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},
	TemporaryImprovedWeaponTrait_Patroclus =
	{
		InheritFrom = { "TemporaryImprovedWeaponTrait" },
		RemainingUses = 10,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.6,
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	TemporaryWeaponLifeOnKillTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Lamia",
		Cost = 25,
		RemainingUses = 3,
		UsesAsEncounters = true,
		DropOnKill = {
			Chance = 0.15,
			DropCap = 2,
			Name = "HealDropMinor",
			ExtractValues =
			{
				{
					Key = "Chance",
					ExtractAs = "TooltipDropChance",
					Format = "Percent",
				}
			}
		},
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipChambers",
			}
		}
	},

	TemporaryImprovedRangedTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Braid",
		Cost = 40,
		RemainingUses = 3,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.3,
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	TemporaryLastStandHealTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Jug",
		RequiredInactiveMetaUpgrade = "ExtraChanceMetaUpgrade",
		Cost = 50,
		RemainingUses = 20,
		UsesAsEncounters = true,
		LastStandHealFraction = 0.10,
		ExtractValues =
		{
			{
				Key = "LastStandHealFraction",
				ExtractAs = "TooltipHeal",
				Format = "Percent",
			}
		}
	},
	UpgradedTemporaryLastStandHealTrait =
	{
		InheritFrom = { "TemporaryLastStandHealTrait" },
		LastStandHealFraction = 0.5,
		RemainingUses = 15,
		ExtractValues =
		{
			{
				Key = "LastStandHealFraction",
				ExtractAs = "TooltipHeal",
				Format = "Percent",
			}
		}
	},
	TemporaryBonusDamageTrait =
	{
		InheritFrom = { "ShopTrait" },
		Cost = 40,
		RemainingUses = 3,
		UsesAsEncounters = true,
		PropertyChanges =
		{
			{
				UnitProperty = "DamageOutputMultiplier",
				ChangeValue = 0.50,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				}
			},
		},
	},

	TemporaryDoorHealTrait =
	{
		CustomNameWithMetaUpgrade =
		{
			MetaUpgradeName = "HealingReductionShrineUpgrade",
			Name = "TemporaryDoorHealTrait_Reduced",
		},
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Stein",
		RemainingUses = 3,
		UsesAsRooms = true,
		DoorHeal = 0.10,
		Cost = 45,
		ExtractValues =
		{
			{
				Key = "DoorHeal",
				ExtractAs = "TooltipHeal",
				Format = "PercentHeal",
			},
			{
				ExtractAs = "HealingReduction",
				Format = "TotalMetaUpgradeChangeValue",
				MetaUpgradeName = "HealingReductionShrineUpgrade"
			}
		},
	},
	TemporaryDoorHealTrait_Patroclus =
	{
		InheritFrom = { "TemporaryDoorHealTrait" },
		RemainingUses = 5,
		DoorHeal = 0.3,
	},

	TemporaryMoreAmmoTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Stone",
		Cost = 20,
		RemainingUses = 3,
		UsesAsEncounters = true,
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				ChangeValue = 1,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAmmo",
				}
			},
		},
	},

	TemporaryTempHealthTrait =
	{
		InheritFrom = { "ShopTrait" },
		Cost = 50,
		RemainingUses = 3,
		UsesAsEncounters = true,
	},

	TemporaryForcedChallengeSwitchTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Emblem",
		Cost = 30,
		RemainingUses = 1,
		ForceChallengeSwitch = true,
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredMaxDepth = 32,
	},

	TemporaryForcedSecretDoorTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Lamp",
		Cost = 40,
		RemainingUses = 1,
		ForceSecretDoor = true,
		RequiredTextLines = { "ChaosFirstPickUp", },
		RequiredMaxDepth = 32,
	},

	TemporaryMoveSpeedTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Vial",
		Cost = 10,
		RemainingUses = 3,
		UsesAsEncounters = true,
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},
		}
	},

	TemporaryBoonRarityTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Yarn",
		Cost = 70,
		RarityBonus =
		{
			RareBonus = 1,
			EpicBonus = 0.25,
			LegendaryBonus = 0.1,
		},
		RemainingUses = 1,
	},

	SuperTemporaryBoonRarityTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Nectar",
		Cost = 70,
		RarityBonus =
		{
			RareBonus = 1,
			EpicBonus = 0.25,
			LegendaryBonus = 0.1,
		},
		RemainingUses = 3,
	},
	-- Weapon Traits --
	TempSwordUpgrade =
	{
		Icon = "Weapon_Sword_09",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	TempSwordUpgrade2 =
	{
		Icon = "Weapon_Sword_09",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	-- Sword

	SwordCriticalTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_09",
		RequiredFalseTraits = { "SwordTwoComboTrait", "SwordHeavySecondStrikeTrait", "SwordConsecrationTrait" },
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 3.0,
			ValidWeapons = { "SwordWeapon3" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.40,
				BaseMax = 0.40,
			},
		},
	},

	SwordHealthBufferDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_06",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			HealthBufferDamageMultiplier = 4,
		},
	},

	SwordCriticalParryTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "SwordCriticalParryTrait_Tray",
		Icon = "WeaponEnchantment_Sword03",
		RequiredWeapon = "SwordWeapon",
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt01Attack2_ReturnToIdle_Loop",
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
		SwordPostParryCriticalAmount =
		{
			BaseValue = 0.15,
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordParry" },
				EffectName = "SwordPostParryCritical",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "SwordParry" },
				EffectName = "SwordPostParryCritical",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				}
			},
			-- animation changes
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01Charge1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01Attack1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01Attack2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01Attack3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01ParryFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01ParryCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		WeaponBinks =
		{
			"ZagreusSword01_Bink",
			"ZagreusSword01ReturnToIdle_Bink",
			"ZagreusSword01DashAttack_Bink",
			"ZagreusSword01Run_Bink",
			"ZagreusSword01RunStop_Bink",
			"ZagreusSword01Parry_Bink"
		},
		WeaponDataOverride =
		{
			SwordWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSword01_Bink",
					"ZagreusSword01ReturnToIdle_Bink",
					"ZagreusSword01DashAttack_Bink",
					"ZagreusSword01Run_Bink",
					"ZagreusSword01RunStop_Bink",
					"ZagreusSword01Parry_Bink"
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "SwordPostParryCriticalAmount",
				ExtractAs = "TooltipPercentChance",
				Format = "Percent",
			},
		}
	},

	SwordConsecrationTrait =
	{
		Icon = "WeaponEnchantment_Sword04",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapon = "SwordWeapon",
		AddOnFireWeapons = { "ConsecrationField" },
		LegalOnFireWeapons = { "SwordParry" },
		CustomTrayText = "SwordConsecrationTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt03ParryReturnToIdle",
		PostWeaponUpgradeScreenAngle = 300,
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
		WeaponBinks =
		{
			"ZagreusSwordArthurIdle_Bink",
			"ZagreusSwordArthurRun_Bink",
			"ZagreusSwordArthurRunStop_Bink",
			"ZagreusSwordArthurAttack1_Bink",
			"ZagreusSwordArthurAttack2_Bink",
			"ZagreusSwordArthurAttack3_Bink",
			"ZagreusSwordArthurAttackParry_Bink",
		},
		WeaponDataOverride =
		{
			SwordWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSwordArthurIdle_Bink",
					"ZagreusSwordArthurRun_Bink",
					"ZagreusSwordArthurRunStop_Bink",
					"ZagreusSwordArthurAttack1_Bink",
					"ZagreusSwordArthurAttack2_Bink",
					"ZagreusSwordArthurAttack3_Bink",
					"ZagreusSwordArthurAttackParry_Bink",
				},

				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.03, LerpTime = 0.0 },
					{ ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },

					--{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
					--{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
				},
			},

			SwordWeapon2 =
			{
				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.05, LerpTime = 0.0 },
					{ ScreenPreWait = 0.03, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.03, Fraction = 1.00, LerpTime = 0.07 },

					--{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
					--{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
				},

			},

			SwordWeapon3 =
			{
				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.01, LerpTime = 0.0 },
					{ ScreenPreWait = 0.05, Fraction = 0.15, LerpTime = 0.06 },
					{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },

					--{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
					--{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
				},
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
						{ Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" }
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyCharging" },
						{
							Name = "/Leftovers/SFX/AuraCharge" ,
							StoppedBy = { "TriggerRelease" }
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			SwordWeaponDash =
			{
				HitSimSlowCooldown = 0.2,
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteSpearThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			SwordParry =
			{
				HitSimSlowCooldown = 0.2,
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{

			-- Main Attack Changes / Excalibur
			{
				WeaponNames = { "SwordWeaponDash", "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- SwordWeaponDash
			{
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
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
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordArthurAttack1_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordArthurAttack1_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Arthur",
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
				ChangeValue = "SwordWeaponArthur1",
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
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ControlWindow",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
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
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = true,
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
				WeaponProperty = "Projectile",
				ChangeValue = "SwordWeaponArthur2",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "BarrelLength",
				ChangeValue = "0",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableArthur2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableArthurCancellable2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisable2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			-- SwordWeapon3
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ControlWindow",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordArthurAttack3_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Arthur",
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
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "CancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "SwordDisable3",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "SwordDisableAttackCancelable3",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "SwordDisableCancelable3",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "ArthurSwordDisable3",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "ArthurSwordDisableCancelable3",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "Projectile",
				ChangeValue = "SwordWeaponArthur3",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "BarrelLength",
				ChangeValue = 0,
				ExcludeLinked = true,
			},


			-- Sword Parry

			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt03ParryCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt03ParryFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Consecration Field
			{
				WeaponName = "ConsecrationField",
				EffectName = "ConsecrationSlow",
				EffectProperty = "Modifier",
				ChangeValue = 0.50,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ConsecrationField",
				EffectName = "ConsecrationDamageReduction",
				EffectProperty = "Modifier",
				BaseValue = 0.8,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			--[[
			{
				WeaponName = "ConsecrationField",
				EffectName = "DodgeBonus",
				EffectProperty = "DodgeChance",
				BaseValue = 0.10,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDodge",
					Format = "Percent",
				}
			},
			]]
			--[[
			{
				WeaponName = "ConsecrationField",
				EffectName = "ConsecrationDamage",
				EffectProperty = "Modifier",
				BaseValue = 1.07,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				}
			},
			]]

			{
				LuaProperty = "MaxHealth",
				ChangeValue = 50,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		}
	},

	SwordDoubleDashAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_07",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.3,
			ValidWeapons = { "SwordWeaponDash" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.15,
				BaseMax = 0.15,
			},
			]]
			{
				WeaponName = "SwordWeaponDash",
				EffectName = "SwordDisableDoubleDashAttack",
				EffectProperty = "Active",
				ChangeValue = true,
		},
			{
				WeaponName = "SwordWeaponDash",
				EffectName = "SwordDisableDoubleDashAttackCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
	},
		},
	},

	SwordThrustWaveTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_02",
		RequiredWeapon = "SwordWeapon",
		AddOnFireWeapons = { "SwordThrustWave" },
		LegalOnFireWeapons = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3", "SwordWeaponDash" },
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordThrustWave" },
				ProjectileProperty = "DamageLow",
				BaseValue = 25	,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordThrustWave" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	SwordSecondaryWaveTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_02",
		RequiredWeapon = "SwordWeapon",
		AddOnFireWeapons = { "SwordNovaWave" },
		LegalOnFireWeapons = { "SwordParry" },
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordNovaWave" },
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordNovaWave" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	SwordRandomExplosionTrait =
	{
		InheritFrom = { "WeaponTrait", "LimitedTimeTrait" },
		Icon = "Weapon_Sword_02",
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				EffectName = "SwordWeaponSpinExplosiveChargeWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeaponSpinExplosiveChargeWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordWeaponSpinExplosiveChargeWeapon" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	SwordThirdStrikeChargeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Boon_Zeus_05",
		RequiredWeapon = "SwordWeapon",
		RequiredFalseTraits = { "SwordTwoComboTrait" },
		WeaponDataOverride =
		{
			SwordWeapon3 =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.485,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 3.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordCharge3Hold",
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponName = "SwordDisable2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},


			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTriggerChargeAttack",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},


			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			]]
		},
	},

	SwordConsecutiveFirstStrikeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_01",
		RequiredFalseTraits = { "SwordHeavySecondStrikeTrait" },
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon",
				ProjectileName = "SwordWeapon",
				ProjectileProperty = "DamagePerConescutiveHit",
				ChangeValue = 10,
				ChangeType = "Absolute",
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponName = "SwordWeapon",
				ProjectileName = "SwordWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 2.5,
				ChangeType = "Absolute",
			},
		},
	},

	SwordTwoComboTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_01",
		RequiredFalseTraits = { "SwordHeavySecondStrikeTrait", "SwordCriticalTrait", "SwordThirdStrikeChargeTrait", "SwordConsecrationTrait" },
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "AddOnFire",
				ChangeValue = "SwordWeapon",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "SwordWeapon2",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.6,
				ChangeType = "Multiply",
			},
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2" },
				WeaponProperty = "ForceReleaseOnSwap",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = {"SwordWeapon", "SwordWeapon2", },
				ProjectileProperty = "DamageLow",
				ChangeValue = 25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = {"SwordWeapon", "SwordWeapon2", },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "RequestTriggerLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Cancelable",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "RequestTriggerLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Cancelable",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	SwordSecondaryAreaDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_08",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.2,
			ValidWeapons = { "SwordParry" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
			},
		},
	},

	SwordSecondaryDoubleAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_04",
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{

			{
				WeaponName = "SwordParry",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.85,
				ChangeType = "MultiplyBase",
			},
			--[[
			{
				WeaponName = "SwordParry",
				WeaponProperty = "NumProjectileWaves",
				ChangeValue = 2,
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
					SkipAutoExtract = true,
				},
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ProjectileWaveInterval",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "AdditionalWaveDamageMultiplier",
				BaseValue = 0.5,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format ="Percent"
				}
			},
			]]

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
			},
		},
	},


	SwordHeavySecondStrikeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_03",
		RequiredWeapon = "SwordWeapon",
		RequiredFalseTraits = { "SwordTwoComboTrait", "SwordCriticalTrait", "SwordConsecrationTrait" },
		SetupFunction =
		{
			Name = "PermanentSwitchWeapon",
			Args = "SwordWeapon2",
			RunOnce = true
		},
		ReplaceMeleeWeapon = "SwordWeapon2",
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "DamageLow",
				ChangeValue = 90,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "SwordWeapon2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "ControlWindow",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "AddControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "LockTrigger",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "CancelChargeOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.56,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.32,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordSelfSlow",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableHeavy",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 1300,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
		},

		WeaponDataOverride =
		{
			SwordWeapon2 =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/SFX/Player Sounds/WeaponSwing" },
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
	},

	SwordSecondaryNovaWaveTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_04",
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 1,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "Range",
				ChangeValue = 500,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "Speed",
				ChangeValue = 1000,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
		},
	},


	SwordSecondaryBlinkTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_04",
		RequiredWeapon = "SwordWeapon",
		RequiredFalseTraits = { "HermesSecondaryTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryBlink",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},

		WeaponDataOverride =
		{
			SwordParry =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavySpecialAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordParry" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
					},
				},
			},
		},
	},

	SwordCursedLifeStealTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_12",
		RequiredWeapon = "SwordWeapon",
		MaxHealthMultiplier = 0.4,
		AddOutgoingLifestealModifiers =
		{
			ValidWeapons = {"SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
			ValidMultiplier = 0.05,
			MaxLifesteal = 2,
			MinLifesteal = 2,
		},
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				ChangeValue = 0.4,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipHealthCurse",
					Format = "PercentDelta",
				}
			},
		},
		RequiredMinMaxHealthAmount = 10,
	},

	SwordSecondaryReflectionTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_08",
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParrySelfReflection",
				EffectProperty = "Duration",
				BaseValue = 3,
				ChangeType = "Multiply",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		},
	},

	SwordBackstabTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_10",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
			ExcludeLinked = true,
			HitVulnerabilityMultiplier = 3,
			ExtractValues =
			{
				{
					Key = "HitVulnerabilityMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	-- Bow
	BowLongRangeDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_02",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowDoubleShotTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "BowWeapon", "BowWeaponDash" },
			ExcludeLinked = true,
			DistanceThreshold = 650,
			DistanceMultiplier =
			{
				BaseValue = 3.0,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "DistanceMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	BowSlowChargeDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_03",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowTapFireTrait", "BowChainShotTrait", "BowBeamTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 4,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = { "BowWeapon", "BowWeaponDash" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
                ProjectileProperty = "DamageRadius",
                ChangeValue = 350,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecalGunTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
                ProjectileProperty = "DetonateSound",
                ChangeValue = "/SFX/Explosion1",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
		},
	},

	BowTapFireTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_04",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowPowerShotTrait", "BowSlowChargeDamageTrait", "BowBeamTrait" },
		WeaponDataOverride =
		{
			BowWeapon =
			{
				ChargeCameraMotion = { ZoomType = "None" },
				FireCameraMotion = { ZoomType = "None" },
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseWeaponOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.333333,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ClipSize",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 2.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowPenetrationTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTrait = "BowMarkHomingTrait",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "BowSplitShot" },
			HealthBufferDamageMultiplier = 2,
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowPowerShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_06",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowTapFireTrait", "BowBeamTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "BowWeapon", "BowWeaponDash" },
			PerfectChargeMultiplier = 2.0,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "PerfectChargeMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
	},

	BowSecondaryBarrageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_07",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowSecondaryFocusedFireTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 4,
				ChangeType = "Add",
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponName = "BowSplitShot",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 4,
				ChangeType = "Add",
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
		},
	},

	BowDoubleShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_08",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowTripleShotTrait", "BowLongRangeDamageTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "CENTER",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisablePerfectCharge",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisableCancelablePerfectCharge",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowDoubleShotDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowDoubleShotDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
		},
	},

	BowTripleShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_09",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTrait = "BowDoubleShotTrait",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.03,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowProjectileReturnTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Speed",
				ChangeValue = 3500,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ReturnToOwnerSpeed",
				ChangeValue = 3500,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "UnlimitedObstaclePenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "MultipleUnitCollisions",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowRandomExplosionTrait =
	{
		InheritFrom = { "WeaponTrait", "LimitedTimeTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "BowWeaponExplosiveChargeWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "BowWeaponExplosiveChargeWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "BowWeaponExplosiveChargeWeapon" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	BowSecondaryChargeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.7,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Range",
				ChangeValue = 0.1,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowSecondaryFocusedFireTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_11",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowSecondaryBarrageTrait", "BowBeamTrait", "BowMarkHomingTrait" },
		WeaponDataOverride =
		{
			BowSplitShot =
			{
				Sounds =
				{

					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusBowChargeup" ,
							Key = "SecondaryBowChargeup",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteRanged", },
						{ Name = "/Leftovers/SFX/AuraOn"},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.7,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 4.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Range",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowStartCancelMove",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeFocusedFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt01StartCancelMove",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt02StartCancelMove",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "BowSplitShot" },
				EffectName = "SplitShotDisableLong",
				EffectProperty = "Enabled",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
		},
	},

	BowHomingShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Speed",
				ChangeValue = 0.66,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowChainShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_10",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowDashFanTrait", "BowSlowChargeDamageTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "NumJumps",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "BounceWhenOutOfJumpTargets",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ExpireWhenOutOfJumps",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "JumpRange",
				ChangeValue = 525,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "JumpDamageMultiplier",
				ChangeValue = 1.15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta"
				},
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowDashFanTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowSlowChargeDamageTrait", "BowDoubleShotTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 450,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(12),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "LEFT",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.03,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRapidFire_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRapidFire_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRapidFire_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "BowWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},



	-- Shield

	ShieldDamageReductionTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_01",
		RequiredWeapon = "ShieldWeapon",
		AddIncomingDamageModifiers =
		{
			GlobalMultiplier =
			{
				BaseValue = 0.8,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "GlobalMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},

	ShieldDamageBarrierTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_02",
		RequiredWeapon = "ShieldWeapon",
		AddOnHitWeapons = { "ShieldBarrier" },
	},

	ShieldRevengeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_02",
		RequiredWeapon = "ShieldWeapon",
		AddOnHitWeapons = { "ShieldRevengeEmpower" },
		OnHitWeaponProperties = { IgnoreAutomatic = true },
	},

	ShieldRushBonusProjectileTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "ShieldRushBonusProjectileTrait_Tray",
		Icon = "WeaponEnchantment_Shield03",
		RequiredWeapon = "ShieldWeapon",
		PostWeaponUpgradeScreenAnimation = "ZagreusShieldAlt01Idle",
		PostWeaponUpgradeScreenAngle = 180,
		PreEquipWeapons = { "ShieldThrowProjectileBonusApplicator", "ChaosShieldThrow" },
		WeaponBinks =
		{
		  "ZagreusShield01QuickAttack_Bink",
		  "ZagreusShield01DashAttack_Bink",
		  "ZagreusShield01Attack_Bink",
		  "ZagreusShield01ThrowReceive_Bink",
		  "ZagreusShield01Idle_Bink",
		  "ZagreusShield01Run_Bink",
		  "ZagreusShield01RunStop_Bink",
		},
		WeaponDataOverride =
		{
			ShieldWeapon =
			{
				WeaponBinks =
				{
				  "ZagreusShield01QuickAttack_Bink",
				  "ZagreusShield01DashAttack_Bink",
				  "ZagreusShield01Attack_Bink",
				  "ZagreusShield01ThrowReceive_Bink",
				  "ZagreusShield01Idle_Bink",
				  "ZagreusShield01Run_Bink",
				  "ZagreusShield01RunStop_Bink",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ChaosShieldThrow",
				WeaponProperty = "NumProjectiles",
				BaseValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
						ExtractAs = "TooltipProjectiles",
				},
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShieldAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01Punch",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01PunchFast",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt01AttackCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusShieldAlt01AttackChargeCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01AttackFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01Throw",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "OnDeathFiredByAnimation",
				ChangeValue = "ZagreusShieldAlt01Catch",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	ShieldThrowEmpowerTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_02",
		RequiredWeapon = "ShieldWeapon",
		PreEquipWeapons = { "ShieldThrowEmpowerApplicator" },
		OnProjectileDeathFunction =
		{
			Name = "ShieldBounceEmpower",
			Args = { RequiredUnitsHit = 2 },
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrowEmpowerApplicator",
				EffectName = "ShieldThrowDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.3,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				}
			},
			{
				WeaponName = "ShieldThrowEmpowerApplicator",
				EffectName = "ShieldThrowDamageBonus",
				EffectProperty = "Duration",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	ShieldBounceEmpowerTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5,
				MaxMultiplier = 5,
			},
		},
		Icon = "WeaponEnchantment_Shield03",
		RequiredWeapon = "ShieldWeapon",
		PreEquipWeapons = { "ShieldThrowEmpowerApplicator" },
		OnProjectileDeathFunction =
		{
			Name = "ShieldBounceEmpower",
			Args = {}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrowEmpowerApplicator",
				EffectName = "ShieldThrowDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.25,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				}
			},
			{
				WeaponName = "ShieldThrowEmpowerApplicator",
				EffectName = "ShieldThrowDamageBonus",
				EffectProperty = "Duration",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	ShieldThrowCatchExplode =
	{
		InheritFrom = { "WeaponTrait" },

		Icon = "Weapon_Shield_07",
		RequiredWeapon = "ShieldWeapon",
		PreEquipWeapons = { "ShieldCatchBlast" },
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "SpawnCount",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldCatchBlast",
				ProjectileProperty = "DamageLow",
				BaseValue = 50,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldCatchBlast",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},
	ShieldRushProjectileTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_09",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldRushPunchTrait" },
		WeaponDataOverride =
		{
			ShieldWeaponRush =
			{
				FireScreenshake = { Distance = 0, Speed = 0, FalloffSpeed = 1200, Duration = 0.2 },
				Sounds =
				{
					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
							{ Name = "/VO/ZagreusEmotes/EmoteAttacking_BowPowerShot" },
							{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						},
						{ Name = "/VO/ZagreusEmotes/EmoteParrying" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldRush" },
						{ Name = "/Leftovers/SFX/AuraThrowSmall" },
					},
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteRangedCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmashSHIELD",
						Brick = "/SFX/MetalStoneClangSHIELD",
						Stone = "/SFX/MetalStoneClangSHIELD",
						Organic = "/SFX/MetalOrganicHitSHIELD",
						StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 5,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Speed",
				ChangeValue = 6000,
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Range",
				ChangeValue = 175,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "NumPenetrations",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireSelfInvulnerable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableAttack",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableMove",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ObstacleCollisionCheck",
				ChangeValue = "PolygonContainsPoint",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DeflectProjectiles",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 120,
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ProjectileDefenseAngle",
				ChangeValue = math.rad(100),
				ExcludeLinked = true,
			}
		}

	},
	ShieldThrowGrindTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_04",
		RequiredFalseTraits = { "ShieldThrowSingleTargetTrait", "ShieldThrowFastTrait" },
		RequiredWeapon = "ShieldWeapon",
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				RecallOnFailToFire = "ShieldThrow",
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageLow",
				BaseValue = 0.2,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveAllControlSwaps",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MultipleUnitCollisions",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 120,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "DisableOwnerForDuration",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Acceleration",
				ChangeValue = -1000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerSpeed",
				ChangeValue = 1600,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 200,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},


	ShieldThrowMultiHitTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_04",
		RequiredFalseTraits = { "ShieldThrowSingleTargetTrait", "ShieldThrowFastTrait", "ShieldTwoShieldTrait" },
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "NumJumps",
				ChangeValue = 999,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 900,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "TotalFuse",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 300,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldThrowFastTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_04",
		RequiredFalseTraits = { "ShieldTwoShieldTrait", "ShieldThrowGrindTrait", "ShieldThrowSingleTargetTrait" },
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "NumJumps",
				ChangeValue = 3.0,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipBounces",
				},
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "JumpSpeedMultiplier",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 0.45,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MaxSpeed",
				ChangeValue = 3500,
				ChangeType = "Absolute",
			},
		},
	},

	ShieldThrowSingleTargetTrait =
	{
		InheritFrom = { "WeaponTrait", "LimitedTimeTrait" },
		Icon = "Weapon_Shield_07",
		RequiredFalseTraits = { "ShieldThrowFastTrait", "ShieldTwoShieldTrait", "ShieldThrowElectiveCharge" },
		RequiredWeapon = "ShieldWeapon",
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteEvading" },
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Brick = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Stone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Organic = "/SFX/Player Sounds/ZagreusShieldRicochet",
						StoneObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						BrickObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						MetalObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
					},
				}
			}
		},
		PropertyChanges =
		{
			--[[
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "NumJumps",
				ChangeValue = 1,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 0.4,
				ChangeType = "Multiply"
			},
			]]
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 1.5,
				ChangeType = "MultiplyBase"
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "ShieldThrow",
				EffectName = "ShieldThrowDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute"
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 200,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "GuanYuFirecrackers_ExplosiveChargeWeapon",
				ChangeType = "Absolute",
			},
		},
	},

	ShieldThrowJumpDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_09",
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "JumpDamageMultiplierAddition",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageIncrease",
					Format = "Percent",
				},
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "MaxJumpDamageMultiplier",
				ChangeValue = 5.0,
				ChangeType = "Absolute",
			},
		},
	},

	ShieldTwoShieldTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "ShieldTwoShieldTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusShieldAlt02Idle",
		PostWeaponUpgradeScreenAngle = 180,
		RequiredWeapon = "ShieldWeapon",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.75,
				MaxMultiplier = 1.75,
			},
			Epic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
			Heroic =
			{
				MinMultiplier = 3.25,
				MaxMultiplier = 3.25,
			},
			Legendary =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
		},
		Icon = "WeaponEnchantment_Shield02",
		RequiredWeapon = "ShieldWeapon",
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				RecallOnFailToFire = "ShieldThrow",
				NotReadySound = "/SFX/Player Sounds/ZagreusShieldReturn",
			},
			ShieldWeapon =
			{
				WeaponBinks =
				{
					"ZagreusShield02QuickAttack_Bink",
					"ZagreusShield02DashAttack_Bink",
					"ZagreusShield02Attack_Bink",
					"ZagreusShield02ThrowReceive_Bink",
					"ZagreusShield02Idle_Bink",
					"ZagreusShield02Run_Bink",
					"ZagreusShield02RunStop_Bink",
				},
			},
		},
		WeaponBinks =
		{
			"ZagreusShield02QuickAttack_Bink",
			"ZagreusShield02DashAttack_Bink",
			"ZagreusShield02Attack_Bink",
			"ZagreusShield02ThrowReceive_Bink",
			"ZagreusShield02Idle_Bink",
			"ZagreusShield02Run_Bink",
			"ZagreusShield02RunStop_Bink",
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShieldMirage",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageLow",
				BaseValue = 0.5,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "MultiplyByBase",
					BaseType = "Projectile",
					BaseName = "ShieldThrow",
					BaseProperty = "DamageLow",
				},
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ClearWeaponBonusesOnHit",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveAllControlSwaps",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MultipleUnitCollisions",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "DisableOwnerForDuration",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "FinalJumpToOwner",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "SelfImpactVelocityMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 325,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Acceleration",
				ChangeValue = -75,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerSpeed",
				ChangeValue = 550,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "PenetrateJumpTargets",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 270,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "AddControlOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			-- Visual changes
			{
			WeaponName = "ShieldWeapon",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldAlt02Punch",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldWeaponDash",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldAlt02PunchFast",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldWeaponRush",
			WeaponProperty = "ChargeStartAnimation",
			ChangeValue = "ZagreusShieldAlt02AttackCharge",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldWeaponRush",
			WeaponProperty = "ChargeCancelGraphic",
			ChangeValue = "ZagreusShieldAlt02AttackChargeCancel",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldWeaponRush",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldAlt02AttackFire",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldThrow",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldAlt02Throw",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldThrow",
			ProjectileName = "ShieldThrow",
			ProjectileProperty = "OnDeathFiredByAnimation",
			ChangeValue = "ZagreusShieldAlt02Catch",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		},
	},

	ShieldThrowExplode =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_04",
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 350,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecal",
				ChangeType = "Absolute",
			},
		},
	},

	ShieldDashAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_05",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldChargeSpeedTrait", "ShieldRushPunchTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 3000,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponDash",
				EffectName = "ShieldDashAttackHalt",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
	},

	ShieldPerfectRushTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_08",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldChargeSpeedTrait", "ShieldRushPunchTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "ShieldWeaponRush" },
			PerfectChargeMultiplier = 5.0,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "PerfectChargeMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "PerfectChargeVelocityMultiplier",
				ChangeValue = 1.2,
				ChangeType = "Absolute",
			},
		},
	},

	ShieldChargeSpeedTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_05",
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			--[[
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
			},
			]]
		},
	},

	ShieldBashReflectTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_07",
		RequiredWeapon = "ShieldWeapon",
	},

	ShieldBashDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_06",
		RequiredWeapon = "ShieldWeapon",
		--[[
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.5,
			ValidWeapons = { "ShieldWeapon", "ShieldWeaponDash" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			},
		},
		]]
		PropertyChanges =
		{

			{
				WeaponNames = { "ShieldWeapon" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
				ExcludeLinked = true,
			},

				{
				WeaponNames = {  "ShieldWeapon" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeapon" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldDashAOETrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_01",
		RequiredWeapon = "ShieldWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.5,
			ValidWeapons = { "ShieldWeaponDash" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.723599, -- 30 degrees in radians
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "ProjectileOffset",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				EffectName = "ShieldDashReflect",
				EffectProperty = "AngleCoverage",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldSlowChargeDamage =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_08",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldRushPunchTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DamageLow",
				ChangeValue = 15,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	ShieldChargeHealthBufferTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_02",
		RequiredWeapon = "ShieldWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "ShieldWeaponRush" },
			HealthBufferDamageMultiplier = 5,
			ExtractValues =
			{
				{
					Key = "HealthBufferDamageMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	ShieldAttackChargeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait" },
		PropertyChanges =
		{

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon", },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldIdle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				WeaponNames = { "ShieldWeapon", },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt01Idle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponNames = { "ShieldWeapon", },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt02Idle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "ShieldChargeAttackTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldThrowElectiveCharge =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_12",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldThrowSingleTargetTrait", "ShieldRushBonusProjectileTrait", "ShieldTwoShieldTrait" },
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteRangedCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteRanged" },
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Brick = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Stone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Organic = "/SFX/Player Sounds/ZagreusShieldRicochet",
						StoneObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						BrickObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						MetalObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						BushObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.04,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldIdle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt01Idle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt02Idle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "ShieldChargeThrowTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},

		--[[
		@ attempt to make SFX work with this; it should have a charge-up sound and a fire sound; fire sound does not work; charge sound leaks on tap
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				Sounds =
				{
					ChargeSounds =
					{
						NotReadySound = "/Leftovers/SFX/OutOfAmmo2",

						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
						FireSounds =
						{
							{ Name = "/VO/ZagreusEmotes/EmoteRanged" },
							{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
							{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
						},
						ImpactSounds =
						{
							Invulnerable = "/SFX/SwordWallHitClank",
							Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
							Bone = "/SFX/Player Sounds/ZagreusShieldRicochet",
							Brick = "/SFX/Player Sounds/ZagreusShieldRicochet",
							Stone = "/SFX/Player Sounds/ZagreusShieldRicochet",
							Organic = "/SFX/Player Sounds/ZagreusShieldRicochet",
							StoneObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
							BrickObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
							MetalObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
							BushObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						},
					}
				},
			},
		},
		]]--
	},

	ShieldRushPunchTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_10",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldChargeSpeedTrait", "ShieldPerfectRushTrait", "ShieldSlowChargeDamage", "ShieldRushProjectileTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireRequestTriggerLock",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableAttack",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableMove",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableAttackPunch",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableMovePunch",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeVelocityMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 950,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 950,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 1600,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	-- Spear

	SpearMultiAttack =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			--[[
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "AddOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			{
				WeaponNames = {  "SpearWeapon3", },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "SpearWeapon3" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	SpearAutoAttack =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearSpinTravel", "SpearWeaveTrait" },
		PropertyChanges =
		{

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisable",
				EffectProperty = "Active",
				ChangeValue = false,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableCancelableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = false,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableCancelableAndLockRotation",
				EffectProperty = "Active",
				ChangeValue = false,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableCancelableAndLockTriggerFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableCancelableAndLockRotationFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.42,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "AddOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				WeaponProperty = "Enabled",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	SpearReachAttack =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_03",
		RequiredWeapon = "SpearWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
			ExcludeLinked = true,
			DistanceThreshold = 475,
			DistanceMultiplier =
			{
				BaseValue = 1.4,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "DistanceMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "Range",
				ChangeValue = 1.4,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.4,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
		},
	},

	SpearThrowFarRangeDamage =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_02",
		RequiredWeapon = "SpearWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "SpearWeaponThrow" },
			ExcludeLinked = true,
			DistanceThreshold = 525,
			DistanceMultiplier =
			{
				BaseValue = 2.5,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "DistanceMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	SpearThrowExplode =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_09",
		RequiredFalseTraits = { "SpearThrowCritical", "SpearThrowBounce", "SpearTeleportTrait", "SpearSpinTravel" },
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire4",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearWeaveTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 450,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageBonusToImpactedUnit",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecalGunTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
                WeaponName = "SpearWeaponThrow",
                ProjectileProperty = "DetonateSound",
                ChangeValue = "/SFX/Explosion1",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
		},
	},

	SpearThrowBounce =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_04",
		RequiredFalseTraits = { "SpearThrowExplode", "SpearSpinTravel" },
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "NumJumps",
				ChangeValue = 7,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "JumpDamageMultiplier",
				ChangeValue = 1.3,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "MaxJumpDamageMultiplier",
				ChangeValue = 3.0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "JumpRange",
				ChangeValue = 750,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "NoJumpTargetRandomSpread",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "JumpRequiresLos",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "PenetrateFinalJumpUnitRangeModifier",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "BounceWhenOutOfJumpTargets",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "ExpireWhenOutOfObstacleJumps",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	SpearThrowPenetrate =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_05",
		RequiredWeapon = "SpearWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "SpearWeaponThrow", "SpearWeaponThrowReturn", "SpearRushWeapon" },
			HealthBufferDamageMultiplier = 5,
		},
	},

	SpearThrowCritical =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_06",
		RequiredFalseTraits = { "SpearThrowExplode", "SpearSpinTravel" },
		RequiredWeapon = "SpearWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.5,
			ValidWeapons = { "SpearWeaponThrow", "SpearWeaponThrowReturn", "SpearRushWeapon" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrowReturn", "SpearRushWeapon" },
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.5,
				BaseMax = 0.5,
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipCriticalChance",
					Format = "Percent",
				}
			},
		},
	},

	SpearSpinDamageRadius =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_07",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTrait = "SpearAutoAttack",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 2.25,
			ValidWeapons = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.30,
				ChangeType = "Multiply",
			},
		},
	},

	SpearSpinChargeLevelTime =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_08",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTrait = "SpearAutoAttack",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearSpinDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearSpinDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearSpinDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearSpinDisableCancelableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
	},

	SpearSpinTravel =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 0.65/0.7,
				MaxMultiplier = 0.65/0.7,
			},
			Epic =
			{
				MinMultiplier = 0.60/0.7,
				MaxMultiplier = 0.60/0.7,
			},
			Heroic =
			{
				MinMultiplier = 0.55/0.7,
				MaxMultiplier = 0.55/0.7,
			},
			Legendary =
			{
				MinMultiplier = 0.50/0.7,
				MaxMultiplier = 0.50/0.7,
			},
		},
		Icon = "WeaponEnchantment_Spear04",
		PostWeaponUpgradeScreenAnimation = "ZagreusSpearAlt03ThrowFireReturn",
		RequiredWeapons = {"SpearWeapon", "SpearWeaponThrow",},
		RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinAura" },
		CustomTrayText = "SpearSpinTravel_Tray",
		WeaponBinks =
		{
			"ZagreusSpear03Run_Bink",
			"ZagreusSpear03RunStop_Bink",
			"ZagreusSpear03Spin_Bink",
			"ZagreusSpear03DashAttack_Bink",
			"ZagreusSpear03Throw_Bink",

			"ZagreusSpearLunarThrust1_Bink",
			"ZagreusSpearLunarThrust2_Bink",
			"ZagreusSpearLunarThrust3_Bink",

			"ZagreusSpearLunarThrustIdle_Bink",
			"ZagreusSpear03ReturnToIdle_Bink"
		},
		WeaponDataOverride =
		{
			SpearWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSpear03Run_Bink",
					"ZagreusSpear03RunStop_Bink",
					"ZagreusSpear03Spin_Bink",
					"ZagreusSpear03DashAttack_Bink",
					"ZagreusSpear03Throw_Bink",

					"ZagreusSpearLunarThrust1_Bink",
					"ZagreusSpearLunarThrust2_Bink",
					"ZagreusSpearLunarThrust3_Bink",

					"ZagreusSpearLunarThrustIdle_Bink",
					"ZagreusSpear03ReturnToIdle_Bink"
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},

			SpearWeapon2 =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

			SpearWeapon3 =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_ShieldThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

			SpearWeaponSpin =
			{
				HitSimSlowParameters = { },

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
						{ Name = "/Leftovers/SFX/AuraThrow" }
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},

					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
				},

			},

			SpearWeaponSpin2 =
			{
				HitSimSlowParameters = { },

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
						{ Name = "/Leftovers/SFX/AuraThrow" }
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},

					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
				},
			},

			SpearWeaponSpin3 =
			{
				HitSimSlowParameters = { },

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
						{ Name = "/Leftovers/SFX/AuraThrow" }
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},

					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
				},
			},

			SpearWeaponThrow =
			{

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
						{
							Name = "/VO/ZagreusEmotes/EmoteMartialSpearThrow",
							Cooldown = 0.5
						},
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/Leftovers/SFX/AuraCharge" ,
							StoppedBy = { "TriggerRelease" }
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/SwordWallHitClankSmall",
						BrickObstacle = "/SFX/SwordWallHitClankSmall",
						MetalObstacle = "/SFX/SwordWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},

		},
		MaxHealthMultiplier =
		{
			BaseValue = 0.3,
			SourceIsMultiplier = true,
		},
		AddOutgoingLifestealModifiers =
		{
			MaxLifesteal = 1,
			MinLifesteal = 1,
			ValidWeapons = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
			ValidMultiplier = 0.05
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Range",
				ChangeValue = 1000,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Speed",
				ChangeValue = 400,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin3" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.25,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin2" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.00,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "MultipleObstacleCollisions",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "NumBounces",
				ChangeValue = 99999,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.50,
				ChangeType = "Multiply",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 0.50,
				ChangeType = "Multiply",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "AttachedAnim",
				ChangeType = "Absolute",
				ChangeValue = "GuanYuSpin",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon3" },
				ProjectileProperty = "AttachedAnim",
				ChangeType = "Absolute",
				ChangeValue = "GuanYuThrust",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {"SpearWeapon2" },
				ProjectileProperty = "AttachedAnim",
				ChangeType = "Absolute",
				ChangeValue = "GuanYuThrust_Flip",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponSpin" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponSpin2" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
				{
				WeaponNames = { "SpearWeaponSpin2" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponSpin3" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin3" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Lunar Throw
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.4,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire4",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearWeaveTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 1.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.67,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnType",
				ChangeValue = "PROJECTILE",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDetonate",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnCount",
				ChangeValue = 0,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.08,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.5,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Range",
				ChangeValue = 900,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow", "SpearWeaponThrowReturn" },
				ProjectileProperty = "Speed",
				ChangeValue = 2500,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "GuanYuFirecrackers",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DetonateSound",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "CheckUnitImpact",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "SpearReturnPointAlt03",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt03",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			]]

			  -- GY Attack
			{
				LuaProperty = "MaxHealth",
				BaseValue = 0.3, -- Make sure to change MaxHealthMultiplier in this trait above if this is altered
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				MaintainDelta = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealthCurse",
					Format = "PercentDelta",
				}
			},

			--- Graphical changes
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireGraphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt03ThrowCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt03ThrowFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt03DashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt03DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt03SpinStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt03SpinStartChargeCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt03SpinAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearLunarThrust1_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearLunarThrust1_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon2" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearLunarThrust2_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearLunarThrust2_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.33,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				EffectName = "SpearLunarAerialSlow2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearLunarThrust3_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearLunarThrust3_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.52,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				EffectName = "SpearLunarAerialSlow3",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon2" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "Projectile",
				ChangeValue = "SpearWeaponLunarThree",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponNames = { "SpearWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearLunarDashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearLunarDashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

		},
		RequiredMinMaxHealthAmount = 10,
	},

	SpearSpinAura =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_07",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinChargeLevelTime", "SpearSpinTravel" },
		WeaponDataOverride =
		{
			SpearWeaponSpin =
			{
				HitSimSlowParameters = { },
			},

			SpearWeaponSpin2 =
			{
				HitSimSlowParameters = { },
			},

			SpearWeaponSpin3 =
			{
				HitSimSlowParameters = { },
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				WeaponProperty = "BarrelLength",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360Continuous"
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.2,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.6,
				ChangeType = "Multiply",
			},
		},
	},

	SpearSpinChargeExplosions =
	{
		InheritFrom = { "WeaponTrait", "LimitedTimeTrait" },
		Icon = "Weapon_Spear_07",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearAutoAttack" },
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearWeaponSpinExplosiveChargeWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpinExplosiveChargeWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeaponSpinExplosiveChargeWeapon" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},


	SpearSpinDoubleStrike =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_07",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearAutoAttack" },
		WeaponDataOverride =
		{
			SpearWeaponSpin =
			{
				{ ScreenPreWait = 0.06, Fraction = 0.01, LerpTime = 0 },
				{ ScreenPreWait = 0.01, Fraction = 0.30, LerpTime = 0.1 },
				{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
			},

			SpearWeaponSpin2 =
			{
				{ ScreenPreWait = 0.06, Fraction = 0.01, LerpTime = 0 },
				{ ScreenPreWait = 0.01, Fraction = 0.30, LerpTime = 0.1 },
				{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
			},

			SpearWeaponSpin3 =
			{
				{ ScreenPreWait = 0.06, Fraction = 0.01, LerpTime = 0 },
				{ ScreenPreWait = 0.01, Fraction = 0.30, LerpTime = 0.1 },
				{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.22,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageLow",
				BaseValue = 60,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeTime",
				BaseValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire4",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.8,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearWeaveTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				LuaProperty = "MaxHealth",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealthCurse",
				}
			},
		},
		RequiredMinMaxHealthAmount = 10,
	},

	SpearDashMultiStrike =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_10",
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponDash" },
				EffectName = "SpearDashDisableLong",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "RushWeapon" },
				WeaponProperty = "WeaponRange",
				ChangeValue = 0.8,
				ChangeType = "Multiply",
			},
		},
	},

	SpearThrowElectiveCharge =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_02",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearThrowExplode"},
		WeaponDataOverride =
		{
			SpearWeaponThrow =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteRangedCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},

					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
						{
							Name = "/VO/ZagreusEmotes/EmoteSpearThrow",
							Cooldown = 0.5
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/SwordWallHitClankSmall",
						BrickObstacle = "/SFX/SwordWallHitClankSmall",
						MetalObstacle = "/SFX/SwordWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 3.34,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "Range",
				ChangeValue = 0.3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "SpearChargeThrowTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			]]
		},
	},

	SpearAttackPhalanx =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "CENTER",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	SpearAttackEscalate =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 5.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 5.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	-- Gun

	GunMinigunTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_01",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunInfiniteAmmoTrait", "GunShotgunTrait", "GunSniperTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = 6,
				ChangeType = "Add",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.6,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Scatter",
				ChangeValue = 32,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ScatterCap",
				ChangeValue = 32,
				ChangeType = "Absolute",
			},
		},
	},
	GunSlowGrenade =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_10",
		RequiredWeapon = "GunWeapon",

		AddOnFireWeapons = { "GunSlowWeapon" },
		LegalOnFireWeapons = { "GunGrenadeToss" },
		AddOnFireWeaponArgs = { UseTargetLocation = true },
		PropertyChanges =
		{
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "Type",
				ChangeValue = "STRAIGHT",
			},
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 2200,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "DetonateLineOfSightFromOwner",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 800,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunGrenadeDropTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "UseStartLocation",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunGrenadeDropTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "UseStartLocation",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunGrenadeDropTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},
		},
	},
	GunShotgunTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_02",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunSniperTrait", "GunInfiniteAmmoTrait", "GunMinigunTrait", "GunConsecutiveFireTrait" },
		PropertyChanges =
		{

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "Cooldown",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AphroditeWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AphroditeWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ZeusWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ZeusWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ExpandBlastDuringDetonation",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "CheckUnitImpact",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "BlastSpeed",
				ChangeValue = 3400,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Speed",
				ChangeValue = 3400,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.06,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "RequireHitCenter",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 420,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 410,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			GunWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},
		},

		WeaponDataOverride =
		{
			GunWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},

			GunWeaponDash =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},

			SniperGunWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},
		},
	},

	GunSniperTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_03",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunShotgunTrait", "GunInfiniteAmmoTrait", "GunMinigunTrait" },
		WeaponDataOverride =
		{
			GunWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},

			GunWeaponDash =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = -11,
				ChangeType = "Add",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunIdleLoop",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 7.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLine",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			--[[
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			]]

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	GunDashAmmoTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_04",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunManualReloadTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeaponDash" },
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		},
	},

	GunExplodingSecondaryTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_12",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunGrenadeDropTrait" },
		WeaponDataOverride =
		{
			GunGrenadeToss =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusGunGrenadeReloading" },
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteRangedNew" },
						{ Name = "/SFX/Player Sounds/ZagreusGunGrenadeLaunchFire" },
						{ Name = "/SFX/HeatCollectionPickup" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},

		PropertyChanges =
		{
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Type",
				ChangeValue = "STRAIGHT",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeRocket",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "CheckUnitImpact",
				ChangeValue = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "ObstacleCollisionCheck",
				ChangeValue = "PolygonContainsPoint",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "OffsetZ",
				ChangeValue = 60,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "null",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Speed",
				ChangeValue = 800,
				ChangeType = "Add"
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Range",
				ChangeValue = 1000,
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 360,
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "DamageLow",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "AutoLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = 90,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1020,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunFire",
			},
			{
				TraitName = "GunGrenadeSelfEmpowerTrait",
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunAlt02Fire",
			},
			{
				TraitName = "GunManualReloadTrait",
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunAlt01Fire",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunFire",
			},
			{
				TraitName = "GunGrenadeSelfEmpowerTrait",
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt02Fire",
			},
			{
				TraitName = "GunManualReloadTrait",
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt01Fire",
			},
		}
	},

	GunHeavyBulletTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_04",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunArmorPenerationTrait" },
		PropertyChanges =
		{
			--[[
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			]]
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				EffectName = "OnHitSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 275,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecalGunTrait",
				ChangeType = "Absolute",
			},
			{
                WeaponNames = { "GunWeapon", "GunWeaponDash" },
                ProjectileProperty = "DetonateSound",
                ChangeValue = "/SFX/Explosion1",
                ChangeType = "Absolute",
            },
		},
	},

	GunHomingBulletTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_10",
		RequiredWeapon = "GunWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "AdjustRateAcceleration",
				ChangeValue = 25,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 2000,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "MaxSpeed",
				ChangeValue = 2000,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Acceleration",
				ChangeValue = 4000,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},
		},
	},

	GunInfiniteAmmoTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_09",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunShotgunTrait", "GunSniperTrait", "GunMinigunTrait", "GunConsecutiveFireTrait" },
		WeaponDataOverride =
		{
			GunWeapon =
			{
				LowAmmoSoundThreshold = -1,
			},
			GunWeaponDash =
			{
				LowAmmoSoundThreshold = -1,
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "TriggerTapIgnoresCooldown",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = -1,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunBaseUpgradeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = -1,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ClipSize",
				ChangeValue = 3,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.035,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Spread",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ClipRegenInterval",
				ChangeValue = 0.60,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FullClipRegen",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Scatter",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ScatterCap",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "CanCancelDisables",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

		},
	},

	GunArmorPenerationTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_08",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunHeavyBulletTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
			HealthBufferDamageMultiplier = 1.5,
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},

	},

	GunGrenadeClusterTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_05",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunGrenadeFastTrait", "GunGrenadeDropTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 5,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 12,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "LEFT",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.13,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 350,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageLow",
				ChangeValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamagePenalty",
					Format = "NegativePercentDelta",
				},
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "UnpauseAnimation",
				ChangeValue = "GunGrenade",
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeClusterDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
	},

	GunGrenadeProjectileSpeedTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_05",
		RequiredWeapon = "GunWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Speed",
				ChangeValue = 1700,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Gravity",
				ChangeValue = 5000,
				ChangeType = "Absolute",
			},
		},
	},

	GunGrenadeSelfEmpowerTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "GunGrenadeSelfEmpowerTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusGunAlt02ReloadEnd",
		PostWeaponUpgradeScreenAngle = 210,
		RequiredWeapon = "GunWeapon",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		Icon = "WeaponEnchantment_Gun02",
		RequiredWeapon = "GunWeapon",
		WeaponBinks =
		{
			"ZagreusGun02_Bink",
			"ZagreusGun02Run_Bink",
			"ZagreusGun02GrenadeToss_Bink",
			"ZagreusGun02Stop_Bink",
			"ZagreusGun02FireEmpty_Bink",
		},
		WeaponDataOverride =
		{
			GunWeapon =
			{
				IdleReloadAnimation = "ZagreusGunAlt02ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt02RunReload",
				WeaponBinks =
				{
					"ZagreusGun02_Bink",
					"ZagreusGun02Run_Bink",
					"ZagreusGun02GrenadeToss_Bink",
					"ZagreusGun02Stop_Bink",
					"ZagreusGun02FireEmpty_Bink",
				},
			},
			GunWeaponDash =
			{
				IdleReloadAnimation = "ZagreusGunAlt02ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt02RunReload",
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "GunGrenadeToss", "GunBombWeapon" },
				EffectName = "ZagreusOnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponNames = { "GunGrenadeToss", "GunBombWeapon" },
				EffectName = "GrenadeSelfDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "GunGrenadeToss", "GunBombWeapon" },
				EffectName = "GrenadeSelfDamageOutput",
				EffectProperty = "Modifier",
				BaseValue = 0.12,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				}
			},
			{
				WeaponNames = { "GunWeapon", },
				WeaponProperty = "PreFireAnimation",
				ChangeValue = "ZagreusGunAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon",  },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon",  },
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunAlt02FireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeaponDash",  },
				WeaponProperty = "PreFireAnimation",
				ChangeValue = "ZagreusGunAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeaponDash", },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeaponDash", },
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunAlt02FireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunAlt02GrenadeTossCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt02GrenadeTossFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	GunGrenadeDropTrait  =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_06",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunGrenadeFastTrait", "GunGrenadeClusterTrait", "GunExplodingSecondaryTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ManualAiming",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Range",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "AutoAdjustForTarget",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Gravity",
				ChangeValue = 1200,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "AffectsSelf",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageLow",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			--[[
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic2",
				ChangeValue = "GunGrenadeTossFirecrackerSpawner",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]


			--[[
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Speed",
				ChangeValue = 300,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Range",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "AutoAdjustForTarget",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "LaunchAngle",
				ChangeValue = 30,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "SelfDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			]]
		},
	},

	GunGrenadeFastTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_07",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunGrenadeClusterTrait", "GunGrenadeDropTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.06,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "TriggerTapIgnoresCooldown",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ClipSize",
				ChangeValue = 3,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ClipRegenInterval",
				ChangeValue = 1.5,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FullClipRegen",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableCancelableFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
		},
	},

	GunConsecutiveFireTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunShotgunTrait", "GunInfiniteAmmoTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				ProjectileName = "GunWeapon",
				ProjectileProperty = "DamagePerConescutiveHit",
				ChangeValue = 1,
				ChangeType = "Absolute",
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponName = "GunWeapon",
				ProjectileName = "GunWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
			},

		},
	},

	-- Fist Weapon

	FistHeavyAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "FistWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.1,
			ValidWeapons = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "FistWeapon",
				ProjectileName = "FistWeapon",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			--[[
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
			},
			]]
		},
	},

	FistReachAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_07",
		RequiredWeapon = "FistWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.20,
			ValidWeapons = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "FistWeapon",
				ProjectileName = "FistWeapon",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "FistWeapon",
				ProjectileName = "FistWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 650,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "FistWeapon",
				WeaponProperty = "AutoLockRange",
				ChangeValue = 650,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "FistWeapon",
				ProjectileName = "FistWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 4000,
				ChangeType = "Absolute",
			},
						{
				WeaponName = "FistWeapon",
				ProjectileName = "FistWeapon",
				ProjectileProperty = "Acceleration",
				ChangeValue = -24000,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxBase_Reach",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AphroditeWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAphrodite_Reach",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAres_Reach",
				ChangeType = "Absolute"
			},
						{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAthena_Reach",
				ChangeType = "Absolute"
			},
			{
				TraitName = "ArtemisWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxArtemis_Reach",
				ChangeType = "Absolute"
			},
						{
				TraitName = "DemeterWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxDemeter_Reach",
				ChangeType = "Absolute"
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxDionysus_Reach",
				ChangeType = "Absolute"
			},
						{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxPoseidon_Reach",
				ChangeType = "Absolute"
			},
			{
				TraitName = "ZeusWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxZeus_Reach",
				ChangeType = "Absolute"
			},

		},
	},

	FistChargeAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_02",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistAttackFinisherTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "FistWeapon" },
			PerfectChargeMultiplier = 1.5,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "PerfectChargeMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
		WeaponDataOverride =
		{
			FistWeapon =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusBowChargeup" ,
							Key = "FistWeaponCharge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
					},
					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
						},
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist5" },
						{ Name = "/SFX/Player Sounds/ZagreusFistWhoosh" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/FistImpactSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactSmall",
						Brick = "/SFX/FistImpactSmall",
						Stone = "/SFX/FistImpactSmall",
						Organic = "/SFX/FistImpactSmall",
						StoneObstacle = "/SFX/FistImpactSmall",
						BrickObstacle = "/SFX/FistImpactSmall",
						MetalObstacle = "/SFX/FistImpactSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			FistWeapon2 =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusBowChargeup" ,
							Key = "FistWeapon2Charge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist2" },
						{ Name = "/SFX/Player Sounds/ZagreusFistWhoosh" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/FistImpactSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactSmall",
						Brick = "/SFX/FistImpactSmall",
						Stone = "/SFX/FistImpactSmall",
						Organic = "/SFX/FistImpactSmall",
						StoneObstacle = "/SFX/FistImpactSmall",
						BrickObstacle = "/SFX/FistImpactSmall",
						MetalObstacle = "/SFX/FistImpactSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusFistRun",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "CancelChargeOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "FistChargeAttackTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "FistChargeAttackTrait2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "BlockMoveInput",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "BelowMinChargeCooldown",
				ChangeValue = 0.02,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLineShield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "SelfVelocity",
				ChangeValue = 300,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 1800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeVelocityMultiplier",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "FistWeapon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistDisable2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistDisableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistChargeDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistChargeDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistChargeDisable2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistChargeDisableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusHeavyPunch_Fire1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			--[[
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistFlurryPunch_Complete",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistSelfSlowCharge",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = false,
				Type = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistFlurryHalt",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistFlurryDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistFlurryDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistFlurrySelfSlowCharge",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
		},
	},

	FistDashAttackHealthBufferTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_01",
		RequiredWeapon = "FistWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "FistWeaponDash", "FistWeaponDash" },
			HealthBufferDamageMultiplier = 10,
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponDash", "FistWeaponDash" },
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	-- Experimental Stuff
	FistKillTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_06",
		RequiredWeapon = "FistWeapon",
		OnEnemyDeathWeapon =
		{
			Weapon = "FistKillBuff",
			RequiredKillWeapons = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
		},
		PropertyChanges =
		{

		},
	},

	FistKillNovaTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "FistWeapon",
		OnEnemyDeathWeapon =
		{
			Weapon = "FistKillNova",
			RequiredKillWeapons = { "FistWeaponDash" },
			FireAtDeathLocation = true,
		},
		PropertyChanges =
		{

		},
	},

	FistConsecutiveAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_09",
		RequiredWeapon = "FistWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponDash" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.18,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponDash" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "DamagePerConescutiveHit",
				ChangeValue = 5,
				ChangeType = "Absolute",
			},
		},
	},

	FistAttackFinisherTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_08",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistChargeAttackTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.6,
			ValidWeapons = { "FistWeaponDash" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "FistWeaponDash",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "CooldownWeaponSlotThree",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	FistDoubleDashSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_03",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistSpecialFireballTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.5,
			ValidWeapons = { "FistWeaponSpecialDash" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.04,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 450,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecalGunTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
                WeaponNames = { "FistWeaponSpecialDash" },
                ProjectileProperty = "DetonateSound",
                ChangeValue = "/SFX/Explosion1",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
		},
	},

	FistDoubleSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "FistWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.42,
				ChangeType = "Absolute",
			},
		},
	},

	FistAreaSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "FistWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 380,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistFxUppercut",
				ChangeType = "Absolute",
			},
		},
	},

	FistChargeSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_11",
		RequiredFalseTraits = { "FistTeleportSpecialTrait", "FistVacuumTrait", "FistSpecialFireballTrait" },
		RequiredWeapon = "FistWeapon",
		WeaponDataOverride =
		{
			FistWeaponSpecial =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteRangedCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},

					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist2" },
						{ Name = "/SFX/Player Sounds/ZagreusFistWhoosh" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/FistImpactSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactSmall",
						Brick = "/SFX/FistImpactSmall",
						Stone = "/SFX/FistImpactSmall",
						Organic = "/SFX/FistImpactSmall",
						StoneObstacle = "/SFX/FistImpactSmall",
						BrickObstacle = "/SFX/FistImpactSmall",
						MetalObstacle = "/SFX/FistImpactSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistFlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "FistChargeUppercutTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeVelocityMultiplier",
				ChangeValue = 3.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "SelfVelocity",
				ChangeValue = 400,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 1200,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLineShield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "FistChargeFocusedFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "BlastDuration",
				ChangeValue = 0.22,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialFireHalt",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	FistSpecialFireballTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_10",
		RequiredFalseTraits = { "FistTeleportSpecialTrait", "FistChargeSpecialTrait", "FistVacuumTrait", "FistDoubleDashSpecialTrait" },
		RequiredWeapon = "FistWeapon",
		WeaponDataOverride =
		{
			FistWeaponSpecial =
			{
				HitSimSlowParameters =
				{
						{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
						{ ScreenPreWait = 0.02, Fraction = 0.3, LerpTime = 0 },
						{ ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.07 },
				},
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteHeavyCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},

					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
						},
						{ Name = "/Leftovers/SFX/AuraThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
						{
							Name = "/VO/ZagreusEmotes/EmoteAttacking_FistKick",
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/SwordWallHitClankSmall",
						BrickObstacle = "/SFX/SwordWallHitClankSmall",
						MetalObstacle = "/SFX/SwordWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "FistWeapon" },
			PerfectChargeMultiplier = 1.2,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "PerfectChargeMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "Projectile",
				ChangeValue = "FistFireball",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 900,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AutoLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = 120,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MaxCharge",
				ChangeValue = 5.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistGrab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistGrab_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "FistChargeSpecialTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = -1,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "PerfectChargeSpeedMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 1.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "Range",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLineShield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "FistChargeFocusedFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "BlastDuration",
				ChangeValue = 0.22,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialFireHalt",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	FistSpecialLandTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_12",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistWeaveTrait" },
		PreEquipWeapons = { "FistWeaponLandAreaAttack" },
		AddOnFireWeapons = { "FistWeaponLandAreaAttack" },
		LegalOnFireWeapons = { "FistWeaponSpecial" },
		ExcludeLinked = true,
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DamageLow",
				BaseValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	FistSpecialWaveTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "FistWeapon",
		PreEquipWeapons = { "FistNovaWave" },
		AddOnFireWeapons = { "FistNovaWave" },
		LegalOnFireWeapons = { "FistWeaponSpecial" },
		PropertyChanges =
		{
			{
				WeaponNames = { "FistNovaWave" },
				ProjectileProperty = "DamageLow",
				BaseValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistNovaWave" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},


	FistTeleportSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_05",
		PreEquipWeapons = {"FistSpecialMiniDash"},
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistVacuumTrait", "FistChargeSpecialTrait" },
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			FunctionName = "CheckTeleportToNearbyEnemy",
			FunctionArgs =
			{
				Range = 600,
				AutoLockArc = 40,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistFlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistFlashKick_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.22,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	FistVacuumTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		Icon = "WeaponEnchantment_Fist03",
		PostWeaponUpgradeScreenAnimation = "ZagreusFistAlt02Grab_ReturnToIdle",
		PostWeaponUpgradeScreenAngle = 208,
		PreEquipWeapons = { "FistSpecialVacuum" },
		CustomTrayText = "FistVacuumTrait_Tray",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistVacuumTrait", "FistTeleportSpecialTrait" },
		RequiredWeapons = { "FistWeapon", "FistWeaponSpecial" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5,
				MaxMultiplier = 5,
			},
		},
		WeaponBinks =
		{
			"ZagreusFistAlt02Idle_Bink",
			"ZagreusFistAlt02Run_Bink",
			"ZagreusFistAlt02RunStop_Bink",
			"ZagreusFistAlt02FlurryPunch_Bink",
			"ZagreusFistAlt02FlashKick_Bink",
			"ZagreusFistAlt02Grab_Bink",
			"ZagreusFistAlt02AerialUpperCut_Bink",
			"ZagreusFistAlt02DashUpperCut_Bink",
			"ZagreusFistAlt02DashHayMaker_Bink",
		},
		WeaponDataOverride =
		{
			FistWeapon =
			{
				WeaponBinks =
				{
					"ZagreusFistAlt02Idle_Bink",
					"ZagreusFistAlt02Run_Bink",
					"ZagreusFistAlt02RunStop_Bink",
					"ZagreusFistAlt02FlurryPunch_Bink",
					"ZagreusFistAlt02FlashKick_Bink",
					"ZagreusFistAlt02Grab_Bink",
					"ZagreusFistAlt02AerialUpperCut_Bink",
					"ZagreusFistAlt02DashUpperCut_Bink",
					"ZagreusFistAlt02DashHayMaker_Bink",
				}
			},
		},
		AddRush =
		{
			FunctionName = "FistVacuumRush",
			FunctionArgs =
			{
				Duration = 0.2,
			},
			RunOnce = true,
		},
		OnWeaponChargeFunctions =
		{
			ValidWeapons = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			FunctionName = "CheckVacuumNearbyEnemy",
			FunctionArgs =
			{
				Range = 800,				-- Vacuum distance
				DistanceBuffer = 130,		-- Space to leave between player and enemy
				RushDistanceBuffer = 300,
				AutoLockArc = 60,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistSpecialVacuum" },
				EffectName = "MarkTargetFist",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistSpecialVacuum" },
				EffectName = "MarkTargetFist",
				EffectProperty = "Modifier",
				BaseValue = 0.08,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				},
				DeriveSource = "DeriveSource"
			},

			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02Grab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.24,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Charge4",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire4",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Charge5",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire5",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02DashHayMaker_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02DashHayMaker_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02DashHayMaker_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02AerialUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02DashUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlashKick_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02Grab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02Grab_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	FistThrowSpecial =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		PreEquipWeapons = {"FistSpecialMiniDash"},
		RequiredWeapon = "FistWeapon",
		OnWeaponChargeFunctions =
		{
			ValidWeapons = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			FunctionName = "CheckGrappleToNearbyEnemy",
			FunctionArgs =
			{
				Range = 200,					-- Finds a unit within this range to throw
				ThrowRange = 800,				-- Seeks a unit within this range to throw to
				OverThrowDistance = 250,		-- Additional impulse so the unit slams into the target unit
				MinForce = 2000,					-- Minimum force to apply
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 2200,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 2200,
				ChangeType = "Absolute",
			},
		},

	},


	-- Combo Traits
	AutoRetaliateTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "AutoRetaliateTrait",
		Icon = "Zeus_Ares_01",
		SetupFunction =
		{
			Name = "AutoRetaliateSetup",
			Args =
			{
				Range = 300,
				IntervalData = { Min = 3.5, Max = 3.5 },
			},
			RunOnce = true
		},
	},

	AresHomingTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "AresHomingTrait",
		Icon = "Artemis_Ares_01",
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MaxAdjustRate",
				BaseValue = 15,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipSeekPower",
					Format = "SeekDuration",
					BaseName = "AresProjectile",
					DecimalPlaces = 1,
				}
			},
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Speed",
				BaseValue = 15,
				ChangeType = "Add",
			},
		}
	},

	CurseSickTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Ares_Aphrodite_01",
		RequiredFalseTrait = "CurseSickTrait",
		PropertyChanges =
		{
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAlt",
				ChangeValue = "ReduceDamageOutput",
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAlt",
				ChangeValue  = "ReduceDamageOutput",
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAlt",
				ChangeValue  = "ReduceDamageOutput",
			},
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAltMultiplier",
				ChangeValue = 0.25,
				DeriveSource = "DeriveSource",
				ExtractValue =
				{
					ExtractAs = "TooltipMultiplier",
					Format = "Percent",
				}
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAltMultiplier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAltMultiplier",
				ChangeValue  = "ReduceDamageOutput",
				DeriveValueFrom = "DeriveSource",
			},
		},
	},

	ReboundingAthenaCastTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Athena_Zeus_01",
		RequiredFalseTrait = "ReboundingAthenaCastTrait",
		PropertyChanges =
		{
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "AllowRepeatedJumpHit",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MultipleUnitCollisions",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "ExcludeLastHitThing",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "NumJumps",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipBounces",
				}
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "ExpireWhenOutOfJumps",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "JumpRange",
				ChangeValue = 450,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MaxSpeed",
				ChangeValue = 800,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
		}
	},

	SlowProjectileTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "SlowProjectileTrait",
		Icon = "Aphrodite_Athena_01",

		EnemyPropertyChanges =
		{
			{
				UnitProperty = "ProjectileSpeedMultiplier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "ProjectileSpeedDecrease",
					Format = "NegativePercentDelta",
				}
			},
		}
	},

	TriggerCurseTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "TriggerCurseTrait",
		Icon = "Athena_Ares_01",
		AddOutgoingDamageModifiers =
		{
			TriggerEffectAddition = { BaseValue = 50 },
			TriggerEffectName = "DelayedDamage",
			ExtractValues =
			{
				{
					Key = "TriggerEffectAddition",
					ExtractAs = "TooltipDamageBonus",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRetaliateTrait",
				WeaponName = "MagicShieldRetaliate",
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRetaliateTrait",
				WeaponName = "MagicShieldRetaliate",
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
		},
	},

	ImprovedPomTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Aphrodite_Poseidon_01",
		RequiredFalseTrait = "ImprovedPomTrait",
		PomLevelBonus = 1
	},

	RaritySuperBoost =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Dionysus_Poseidon_01",
		RequiredFalseTrait = "RaritySuperBoost",
		ReplaceUpgradedRarityTable =
		{
			Common = "Epic",
			Rare = "Epic",
			Epic = "Heroic",
		},
		RarityBonus =
		{
			RareBonus = 0,
			EpicBonus = 1,
			LegendaryBonus = 0,
		},
	},

	BonusAmmoDropTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "BonusAmmoDropTrait",
		BonusAmmoDrop = 1
	},

	LightningCloudTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "LightningCloudTrait",
		PreEquipWeapons = { "ZeusDionysusCloudStrike" },
		Icon = "Zeus_Dionysus_01",
		AmmoDeathWeapon =
		{
			ValidProjectileName = "DionysusLobProjectile",
			WeaponName = "ZeusDionysusCloudStrike",
			Interval = 0.5,
			Duration = 5,
			Range = 400,
		},
		PropertyChanges =
		{
			{
				WeaponName = "ZeusDionysusCloudStrike",
				ProjectileName = "ZeusDionysusCloudStrike",
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponName = "ZeusDionysusCloudStrike",
				ProjectileName = "ZeusDionysusCloudStrike",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
		}
	},

	CriticalBoltTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Artemis_Zeus_01",
		RequiredFalseTrait = "CriticalBoltTrait",
		AddOnDamageWeapons = { "LightningStrikeCrit" },
		OnDamageWeaponProperties = { FireFromVictimLocation = true, CritOnly = true },
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeCrit",
				ProjectileProperty = "DamageLow",
				BaseValue = 20,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningStrikeCrit",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	},

	ImpactBoltTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "ImpactBoltTrait",
		Icon = "Poseidon_Zeus_01",
		OnImpactWeapons =
		{
			FireFromVictimLocation = true,
			RequireImpactMin = 1000,
			Weapon = "LightningStrikeImpact"
		},
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeImpact",
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningStrikeImpact",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	},

	ZeusReflectSparkTrait =
	{
		InheritFrom = { "SynergyTrait" },
		OnProjectileReflectWeapons = { "ZeusReflectChainLightning" },
		PropertyChanges =
		{
			{
				WeaponName = "ZeusReflectChainLightning",
				ProjectileProperty = "DamageLow",
				BaseMin = 35,
				BaseMax = 35,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ChangeType = "Add",
			},
			{
				WeaponName = "ZeusReflectChainLightning",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	ArtemisReflectBuffTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "ArtemisReflectBuffTrait",
		Icon = "Artemis_Athena_01",
		OnProjectileReflectWeapons = { "ArtemisReflectBuff" },
		PropertyChanges =
		{
			{
				WeaponName = "ArtemisReflectBuff",
				EffectName = "ReflectCritChance",
				EffectProperty = "Duration",
				BaseValue = 2.0,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
			{
				WeaponName = "ArtemisReflectBuff",
				EffectName = "ReflectCritChance",
				EffectProperty = "CritAddition",
				BaseValue = 0.20,
				ExtractValue =
				{
					ExtractAs = "TooltipCriticalChance",
					Format = "Percent",
				}
			},
		}
	},

	PoseidonAphroditeTouchTrait =
	{
		InheritFrom = { "SynergyTrait" },
		PreEquipWeapons = { "PoseidonAphroditeTouchWeapon" },
		PropertyChanges =
		{
			{
				UnitProperty = "ContinuousWeapon",
				ChangeValue = "PoseidonAphroditeTouchWeapon",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "PoseidonAphroditeTouchWeapon",
				ProjectileName = "PoseidonAphroditeTouchWeapon",
				ProjectileProperty = "DamageLow",
				BaseValue = 10,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponName = "PoseidonAphroditeTouchWeapon",
				ProjectileName = "PoseidonAphroditeTouchWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	DionysusAphroditeStackIncreaseTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "DionysusAphroditeStackIncreaseTrait",
		Icon = "Dionysus_Aphrodite_01",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				BaseValue = 3,
				ChangeType = "Add",
				AsInt = true,
				MinMultiplier = 0.335,
				ExtractValue =
				{
					ExtractAs = "TooltipStackBoost",
				},
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
		}
	},

	HomingLaserTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "HomingLaserTrait",
		Icon = "Demeter_Artemis_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.1,
				SourceIsMultiplier = true,
			},
			RequiredTrait = "DemeterRangedTrait",
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "AutoAdjustForTarget",
				ChangeValue = true
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = math.rad(70)
			}
		},
	},

	IceStrikeArrayTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Demeter_Dionysus_01",
		RequiredFalseTrait = "IceStrikeArrayTrait",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.5,
				SourceIsMultiplier = true,
			},
			RequiredTrait = "DionysusRangedTrait",
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Type",
				ChangeValue = "INSTANT",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.3,
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 0,
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 100,
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "DionysusField",
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Graphic",
				ProjectileName = "DionysusField",
				ChangeValue = "DemeterIceStrikeIndicator",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Graphic",
				ProjectileName = "DionysusLobProjectile",
				ChangeValue = "DemeterPoseidonIceSpark",
				ExcludeLinked = true,
			},
		}
	},

	BlizzardOrbTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Poseidon_Demeter_01",
		RequiredFalseTrait = "BlizzardOrbTrait",
		PropertyChanges =
		{
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "SpawnType",
				ChangeValue = "PROJECTILE",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "SpawnOnDetonate",
				ChangeValue = "IceSpark",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "SpawnCount",
				ChangeValue = 2,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.5,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DetonateSound",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 100,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 0.3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "RangedWeapon",
				ProjectileName = "IceSpark",
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponName = "RangedWeapon",
				ProjectileName = "IceSpark",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	JoltDurationTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Demeter_Zeus_01",
		RequiredFalseTrait = "JoltDurationTrait",
	},

	HeartsickCritDamageTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "HeartsickCritDamageTrait",
		Icon = "Artemis_Aphrodite_01",
		AddOnEffectWeapons =
		{
			EffectName = "ReduceDamageOutput",
			Weapon = "HeartsickCritWeapon",
		},
		PropertyChanges =
		{
			{
				WeaponName = "HeartsickCritWeapon",
				EffectName = "CritVulnerability",
				EffectProperty = "CritMultiplierVulnerabilityAddition",
				BaseValue = 1.5,
				ExtractValue =
				{
					ExtractAs = "TooltipVulnerability",
					Format = "PercentDelta",
				}
			},
		},
	},

	ChainCurseTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
		},
		PropertyChanges =
		{
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "NumJumps",
				BaseValue = 1,
				ChangeType = "Add",
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipJumps",
				},
				DeriveSource = "JumpSource",
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "NumJumps",
				DeriveValueFrom = "JumpSource"
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "NumJumps",
				DeriveValueFrom = "JumpSource"
			},
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "JumpRange",
				ChangeValue = 400,
				BaseMax = 400,
				AsInt = true,
				DeriveSource = "RangeSource",
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "JumpRange",
				DeriveValueFrom = "RangeSource"
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "JumpRange",
				DeriveValueFrom = "RangeSource"
			},
		},
	},

	-- Weapon Enchantments
	FistBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Fist01",
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "FistBaseUpgradeTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Rare =
			{
				MinMultiplier = 1.50,
				MaxMultiplier = 1.50,
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
			},
			Legendary =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon", "FistWeaponSpecial" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.95,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
			},
			{
				LifeProperty = "DodgeChance",
				BaseValue = 0.05,
				ChangeType = "Add",
				DataValue = false,
				ExtractValue =
				{
					ExtractAs = "TooltipChance",
					Format = "Percent"
				},
			},
		}
	},

	FistWeaveTrait =
	{
		Icon = "WeaponEnchantment_Fist02",
		CustomTrayText = "FistWeaveTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusFistAlt01FlashKick_ReturnToIdle",
		PostWeaponUpgradeScreenAngle = 208,
		RequiredWeapons = { "FistWeapon", "FistWeaponSpecial" },
		RequiredFalseTrait = "FistWeaveTrait",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5,
				MaxMultiplier = 5,
			},
		},
		BonusSpecialHits = {
			BaseValue = 1,
		},
		ExtractValues =
		{
			{
                Key = "BonusSpecialHits",
                ExtractAs = "TooltipHits",
            },
		},
		WeaponBinks =
		{
			"ZagreusFistAlt01Idle_Bink",
			"ZagreusFistAlt01Run_Bink",
			"ZagreusFistAlt01RunStop_Bink",
			"ZagreusFistAlt01FlurryPunch_Bink",
			"ZagreusFistAlt01FlashKick_Bink",
			"ZagreusFistAlt01Grab_Bink",
			"ZagreusFistAlt01AerialUpperCut_Bink",
			"ZagreusFistAlt01DashUpperCut_Bink",
			"ZagreusFistAlt01DashHayMaker_Bink",
		},
		WeaponDataOverride =
		{
			FistWeapon =
			{
				WeaponBinks =
				{
					"ZagreusFistAlt01Idle_Bink",
					"ZagreusFistAlt01Run_Bink",
					"ZagreusFistAlt01RunStop_Bink",
					"ZagreusFistAlt01FlurryPunch_Bink",
					"ZagreusFistAlt01FlashKick_Bink",
					"ZagreusFistAlt01Grab_Bink",
					"ZagreusFistAlt01AerialUpperCut_Bink",
					"ZagreusFistAlt01DashUpperCut_Bink",
					"ZagreusFistAlt01DashHayMaker_Bink",
				}
			},

			FistWeaponSpecial =
			{
				HitSimSlowCooldown = 0.02,
				HitSimSlowParameters =
				{

					{ ScreenPreWait = 0.02, Fraction = 0.02, LerpTime = 0.0 },
					--{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0.03 },
					{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
				},

			},

			FistWeaponSpecialDash =
			{
				HitSimSlowCooldown = 0.02,
				HitSimSlowParameters =
				{

					{ ScreenPreWait = 0.02, Fraction = 0.02, LerpTime = 0.0 },
					--{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0.03 },
					{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Charge4",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire4",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Charge5",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire5",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01DashHayMaker_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01DashHayMaker_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01AerialUpperCut_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01AerialUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01DashUpperCut_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01DashUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlashKick_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01Grab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01Grab_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	SwordBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Sword01",
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "SwordBaseUpgradeTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Rare =
			{
				MinMultiplier = 1.0335,
				MaxMultiplier = 1.0335,
			},
			Epic =
			{
				MinMultiplier = 1.067,
				MaxMultiplier = 1.067,
			},
			Heroic =
			{
				MinMultiplier = 1.1175,
				MaxMultiplier = 1.1175,
			},
			Legendary =
			{
				MinMultiplier = 1.134,
				MaxMultiplier = 1.134,
			},
		},
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				BaseValue = 1.1,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "WeaponRange",
				ChangeValue = 1.1,
				ChangeType = "Multiply",
			},
		}
	},
	BowBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Bow01",
		CustomTrayText = "BowBaseUpgradeTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},

		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.02,
				BaseMax = 0.02,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
				}
			},


		},
	},
	SpearBaseUpgradeTrait =
      {
            Icon = "WeaponEnchantment_Spear01",
            CustomTrayText = "SpearBaseUpgradeTrait_Tray",
            InheritFrom = { "WeaponEnchantmentTrait" },
            RarityLevels =
            {
                  Common =
                  {
                        MinMultiplier = 1.00,
                        MaxMultiplier = 1.00,
                  },
                  Rare =
                  {
                        MinMultiplier = 1.375,
                        MaxMultiplier = 1.375,
                  },
                  Epic =
                  {
                        MinMultiplier = 1.75,
                        MaxMultiplier = 1.75,
                  },
                  Heroic =
                  {
                        MinMultiplier = 2.125,
                        MaxMultiplier = 2.125,
                  },
                  Legendary =
                  {
                        MinMultiplier = 2.5,
                        MaxMultiplier = 2.5,
                  },
            },
            AddOutgoingDamageModifiers =
            {
                  ValidWeaponMultiplier =
                  {
                        BaseValue = 1.1,
                        SourceIsMultiplier = true,
                  },
                  ValidWeapons = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                  ExtractValues =
                  {
                        {
                              Key = "ValidWeaponMultiplier",
                              ExtractAs = "TooltipDamage",
                              Format = "PercentDelta",
                        },
                  }
            },
            PropertyChanges =
            {
                  {
                        WeaponNames = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                        ProjectileProperty = "Range",
                        BaseValue = 1.1,
                        SourceIsMultiplier = true,
                        ChangeType = "MultiplyBase",
                        ExcludeLinked = true,
                  },
                  {
                        WeaponNames = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                        ProjectileProperty = "Speed",
                        BaseValue = 1.1,
                        SourceIsMultiplier = true,
                        ChangeType = "MultiplyBase",
                        ExcludeLinked = true,
                  },
            },
      },
	ShieldBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Shield01",
		CustomTrayText = "ShieldBaseUpgradeTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
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
				MinMultiplier = 1.66,
				MaxMultiplier = 1.66,
			},
			Legendary =
			{
				MinMultiplier = 2.00,
				MaxMultiplier = 2.00,
			},
		},
		AddIncomingDamageModifiers =
		{
			GlobalMultiplier =
			{
				BaseValue = 0.95,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "GlobalMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},
	GunBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Gun01",
		CustomTrayText = "GunBaseUpgradeTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
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
			},
			Legendary =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeapon" },
				WeaponProperty = "MaxAmmo",
				BaseValue = 4,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAmmo",
					--Format = "PercentDelta",
				}
			},
		},
	},

	DislodgeAmmoTrait =
	{
		Icon = "WeaponEnchantment_Sword02",
		CustomTrayText = "DislodgeAmmoTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt02Attack2_ReturnToIdle_Loop",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
			},
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		DislodgeAmmoProperties =
		{
			ValidWeapons = { "SwordParry" },
			ForceMin = 300,
			ForceMax = 420
		},
		DroppedAmmoForceMultiplier = 5,
		WeaponBinks =
		{
			"ZagreusSword02_Bink",
			"ZagreusSword02ReturnToIdle_Bink",
			"ZagreusSword02DashAttack_Bink",
			"ZagreusSword02Run_Bink",
			"ZagreusSword02RunStop_Bink",
			"ZagreusSword02Parry_Bink"
		},
		WeaponDataOverride =
		{
			SwordWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSword02_Bink",
					"ZagreusSword02ReturnToIdle_Bink",
					"ZagreusSword02DashAttack_Bink",
					"ZagreusSword02Run_Bink",
					"ZagreusSword02RunStop_Bink",
					"ZagreusSword02Parry_Bink"
				},
			},
			RangedWeapon =
			{
				NotReadyAmmoInEnemyText = "RetrieveAmmoOrDislodgeFromEnemy",
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02Charge1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02Attack1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02Attack2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02Attack3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02ParryFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02ParryCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	SwordAmmoWaveTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
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
				MinMultiplier = 1.6,
				MaxMultiplier = 1.6,
			},
			Legendary =
			{
				MinMultiplier = 1.8,
				MaxMultiplier = 1.8,
			},
		},
		Icon = "Weapon_Sword_03",
		PreEquipWeapons = { "AmmoWaveEffectApplicator" },
		StoredAmmoWaveWeapon =
		{
			Name = "SwordWeaponWave",
			ValidWeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3", "SwordWeaponDash" },
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeaponWave" },
				ProjectileProperty = "DamageLow",
				BaseValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordWeaponWave" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	GunManualReloadTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "GunManualReloadTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusGunAlt01ReloadEnd",
		RequiredWeapon = "GunWeapon",
		PostWeaponUpgradeScreenAngle = 210,
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
			},
			Legendary =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
		},
		Icon = "WeaponEnchantment_Gun03",
		RequiredWeapon = "GunWeapon",
		PreEquipWeapons = { "ManualReloadEffectApplicator", "SniperGunWeapon", "SniperGunWeaponDash" },

		WeaponBinks =
		{
			"ZagreusGun01_Bink",
			"ZagreusGun01Run_Bink",
			"ZagreusGun01GrenadeToss_Bink",
			"ZagreusGun01Stop_Bink",
			"ZagreusGun01FireEmpty_Bink",
		},
		WeaponDataOverride =
		{
			GunWeapon =
			{
				IdleReloadAnimation = "ZagreusGunAlt01ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt01RunReload",
				WeaponBinks =
				{
					"ZagreusGun01_Bink",
					"ZagreusGun01Run_Bink",
					"ZagreusGun01GrenadeToss_Bink",
					"ZagreusGun01Stop_Bink",
					"ZagreusGun01FireEmpty_Bink",
				}
			},
			GunWeaponDash =
			{
				IdleReloadAnimation = "ZagreusGunAlt01ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt01RunReload",
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "DamageLow",
				BaseValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "SniperGunWeapon", "SniperGunWeaponDash" },
				WeaponProperty = "Enabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "GunWeapon", "SniperGunWeapon" },
				WeaponProperty = "PreFireAnimation",
				ChangeValue = "ZagreusGunAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "SniperGunWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "SniperGunWeapon" },
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunAlt01FireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeaponDash", "SniperGunWeaponDash" },
				WeaponProperty = "PreFireAnimation",
				ChangeValue = "ZagreusGunAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeaponDash", "SniperGunWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeaponDash", "SniperGunWeaponDash" },
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunAlt01FireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunAlt01GrenadeTossCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt01GrenadeTossFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	GunLoadedGrenadeTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.125,
				MaxMultiplier = 1.125,
			},
			Epic =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,
			},
			Heroic =
			{
				MinMultiplier = 1.375,
				MaxMultiplier = 1.375,
			},
			Legendary =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
		},
		Icon = "Weapon_Gun_06",
		RequiredWeapon = "GunWeapon",
		PreEquipWeapons = { "GunBombWeapon" },
		PropertyChanges =
		{
			-- bomb propertyies
			{
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ExcludeProjectileName = "GunGrenadeSelfDamage",
			},
			{
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ExcludeLinked = true,
			},
			-- change arc to drop a bomb instead of explode
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnCap",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "FizzleOldSpawnsOnDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "DamageLow",
				BaseValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "DamageRadius",
				BaseValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "HideDetonateGraphic",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "DetonateSound",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnsInheritGroups",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SkipSpawnsIfBlocked",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnGroup",
				ChangeValue = "Standing",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnType",
				ChangeValue = "UNIT",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnOnDetonate",
				ChangeValue = "GunBombUnit",
				ExcludeLinked = true,
			},
		},
	},
	BowMarkHomingTrait =
	{
		Icon = "WeaponEnchantment_Bow02",
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "BowMarkHomingTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusBowAlt01DashFireEndLoop",
		PostWeaponUpgradeScreenAngle = 205,
		RequiredWeapon = "BowWeapon",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.333,
				MaxMultiplier = 1.333,
			},
			Epic =
			{
				MinMultiplier = 1.666,
				MaxMultiplier = 1.666,
			},
			Heroic =
			{
				MinMultiplier = 2.00,
				MaxMultiplier = 2.00,
			},
			Legendary =
			{
				MinMultiplier = 2.333,
				MaxMultiplier = 2.333,
			},
		},
		WeaponBinks =
		{
			"ZagreusBow01Dash_Bink",
			"ZagreusBow01_Bink",
			"ZagreusBow01Run_Bink",
			"ZagreusBow01RunStop_Bink",
			"ZagreusBow01RapidFire_Bink"
		},
		WeaponDataOverride =
		{
			BowWeapon =
			{
				WeaponBinks =
				{
					"ZagreusBow01Dash_Bink",
					"ZagreusBow01_Bink",
					"ZagreusBow01Run_Bink",
					"ZagreusBow01RunStop_Bink",
					"ZagreusBow01RapidFire_Bink"
				}
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "MarkTarget",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "NumProjectiles",
				BaseValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
				},
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt01DashStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt01DashFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusBowAlt01StartCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt01Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt01RapidFire_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt01RapidFire_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseProjectiles",
				External = true,
				BaseType = "Weapon",
				BaseName = "BowSplitShot",
				BaseProperty = "NumProjectiles",
			}
		}
	},

	BowLoadAmmoTrait =
	{
		Icon = "WeaponEnchantment_Bow03",
		CustomTrayText = "BowLoadAmmoTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PreEquipWeapons = { "LoadAmmoApplicator" },
		RequiredWeapons = { "RangedWeapon", "BowWeapon" },
		PostWeaponUpgradeScreenAnimation = "ZagreusBowAlt02DashFireEndLoop",
		PostWeaponUpgradeScreenAngle = 205,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.66,
				MaxMultiplier = 1.66,
			},
			Epic =
			{
				MinMultiplier = 2.33,
				MaxMultiplier = 2.33,
			},
			Heroic =
			{
				MinMultiplier = 2.66,
				MaxMultiplier = 2.66,
			},
			Legendary =
			{
				MinMultiplier = 3.66,
				MaxMultiplier = 3.66,
			},
		},
		WeaponBinks =
		{
			"ZagreusBow02Dash_Bink",
			"ZagreusBow02_Bink",
			"ZagreusBow02Run_Bink",
			"ZagreusBow02RunStop_Bink",
			"ZagreusBow02RapidFire_Bink"
		},
		WeaponDataOverride =
		{
			BowWeapon =
			{
				WeaponBinks =
				{
					"ZagreusBow02Dash_Bink",
					"ZagreusBow02_Bink",
					"ZagreusBow02Run_Bink",
					"ZagreusBow02RunStop_Bink",
					"ZagreusBow02RapidFire_Bink"
				}
			},
		},
		SetupFunction =
		{
			Name = "SetupAmmoLoad",
			Args =
			{
				MaxCount = 99,
				ExtractValues =
				{
					{
						Key = "MaxCount",
						ExtractAs = "TooltipCount",
					},
				}
			},
			RunOnce = true,
		},

		AmmoReclaimTimeDivisor =
		{
			BaseValue = 1.6,
			SourceIsMultiplier = true,
		},
		OverrideWeaponFireNames =
		{
			RangedWeapon = "nil",
			LoadAmmoApplicator = "RangedWeapon",
		},
		ExtractValues =
		{
			{
				Key = "AmmoReclaimTimeDivisor",
				ExtractAs = "TooltipAmmo",
				Format = "AmmoDelayDivisor",
				DecimalPlaces = 2.0,
			},
			{
				ExtractAs = "TooltipTotalAmmoDelay",
				Format = "ExistingAmmoDropDelay",
				SkipAutoExtract = true,
				DecimalPlaces = 2.0,
			}
		},

		PropertyChanges =
		{
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "IgnoreOwnerAttackDisabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "AllowMultiFireRequest",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "SetCompleteAngleOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "IgnoreForceCooldown",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt02DashStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt02DashFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusBowAlt02StartCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt02Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt02RapidFire_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt02RapidFire_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	BowStoredChargeTrait =
	{
		Icon = "WeaponEnchantment_Bow03",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapons = { "BowWeapon" },
		RequiredFalseTrait = "BowStoredChargeTrait",
		LoadPackages = "AresUpgrade",
		PropertyChanges =
		{
			{
				WeaponName = "MaxChargeBowWeapon",
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "MaxChargeBowWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ChargeBowWeapon1",
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ChargeBowWeapon1",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon" },
				WeaponProperty = "ProjectileWaveInterval",
				ChangeValue = 0,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
				{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = 360,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Type",
				ChangeValue = "SKY",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 230,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "UseStartLocation",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(20),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffsetStartDistance",
				ChangeValue = 180,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffset",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "AscentEndZ",
				ChangeValue = 1800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "LEFT",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleResetCount",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNova",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue =  0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},


	BowBeamTrait =
	{
		Icon = "WeaponEnchantment_Bow03",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapons = { "BowWeapon" },
		RequiredFalseTrait = "BowBeamTrait",
		--LoadPackages = "AresUpgrade",
		RequiredFalseTraits = { "BowTapFireTrait", "BowSlowChargeDamageTrait", "BowPowerShotTrait", "BowSecondaryFocusedFireTrait" },
		PropertyChanges =
		{

			--[[
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Type",
				ChangeValue = "BEAM",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			--[[
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "Projectile",
				ChangeValue = "DemeterProjectile",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			--[[
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Type",
				ChangeValue = "BEAM",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DrawAsBeam",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "TipFx",
				ChangeValue = "DemeterLaserTipFlare",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "DemeterLaser",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 1000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "OnlyChargeOnce",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseWeaponOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.7,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ClipSize",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FullClipRegen",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ClipRegenOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "Cooldown",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowBeamFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "BowWeaponDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "BowWeaponDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "BowBeamDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileName = "BowWeapon",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamagePerConescutiveHit",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Type",
				ChangeValue = "SKY",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "UseStartLocation",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "AscentEndZ",
				ChangeValue = 1800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ReloadTime",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "SkipAscent",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRun",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRun",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "BlockMoveInput",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "CancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNova",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue =  0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				EffectName = "SplitShotDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				EffectName = "SplitShotDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(20),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "Spread",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffsetStartDistance",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffset",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "LEFT",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleResetCount",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileName = "BowWeapon",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileName = "Spread",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	ShieldBlockEmpowerTrait =
	{
		Icon = "Weapon_Shield_08",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PreEquipWeapons = { "BlockEmpowerApplicator"},
		OnBlockDamageFunctionName = "AddBlockEmpower",
		PropertyChanges =
		{
			{
				WeaponName = "BlockEmpowerApplicator",
				EffectName = "BlockDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.1,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				}
			},
			{
				WeaponName = "BlockEmpowerApplicator",
				EffectName = "BlockDamageBonus",
				EffectProperty = "Duration",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	SpearWeaveTrait =
	{
		Icon = "WeaponEnchantment_Spear03",
		CustomTrayText = "SpearWeaveTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusSpearAlt02ThrowFireReturn",
		PostWeaponUpgradeScreenAngle = 230,
		RequiredWeapons = { "SpearWeapon", "SpearWeaponThrow" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5,
				MaxMultiplier = 5,
			},
		},
		WeaponBinks =
		{
			"ZagreusSpear02Run_Bink",
			"ZagreusSpear02RunStop_Bink",
			"ZagreusSpear02_Bink",
			"ZagreusSpear02ReturnToIdle_Bink",
			"ZagreusSpear02Spin_Bink",
			"ZagreusSpear02DashAttack_Bink",
			"ZagreusSpear02Throw_Bink",
			"ZagreusSpear02ThrowReceive_Bink"
		},
		WeaponDataOverride =
		{
			SpearWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSpear02Run_Bink",
					"ZagreusSpear02RunStop_Bink",
					"ZagreusSpear02_Bink",
					"ZagreusSpear02ReturnToIdle_Bink",
					"ZagreusSpear02Spin_Bink",
					"ZagreusSpear02DashAttack_Bink",
					"ZagreusSpear02Throw_Bink",
					"ZagreusSpear02ThrowReceive_Bink"
				}
			},
		},
		PropertyChanges =
		{
			--[[
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponThrow", "SpearWeaponDash", "SpearWeaponThrowReturn" },
				EffectName = "ClearMarkTargetSpin",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "MarkTargetSpin",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "MarkTargetSpin",
				EffectProperty = "Modifier",
				BaseValue = 0.30,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02ThrowFireReturn",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02ThrowCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02ThrowFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02DashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02Charge1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02Attack1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02Attack2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02Attack3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "SpearReturnPointAlt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrowInvisibleReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },

			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02SpinStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt02SpinStartChargeCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02SpinAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	SpearTeleportTrait =
	{
		Icon = "WeaponEnchantment_Spear02",
		CustomTrayText = "SpearTeleportTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusSpearAlt01AttackReturnToIdle",
		PostWeaponUpgradeScreenAngle = 230,
		RequiredWeapon = "SpearWeaponThrow",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.50,
				MaxMultiplier = 1.50,
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
			},
			Legendary =
			{
				MinMultiplier = 3.00,
				MaxMultiplier = 3.00,
			},
		},
		PreEquipWeapons = { "SpearRushWeapon", "SpearWeaponThrowInvisibleReturn", },
		WeaponBinks =
		{
			"ZagreusSpear01Run_Bink",
			"ZagreusSpear01RunStop_Bink",
			"ZagreusSpear01_Bink",
			"ZagreusSpear01ReturnToIdle_Bink",
			"ZagreusSpear01Spin_Bink",
			"ZagreusSpear01DashAttack_Bink",
			"ZagreusSpear01Throw_Bink",
			"ZagreusSpear01ThrowReceive_Bink"

		},
		WeaponDataOverride =
		{
			SpearWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSpear01Run_Bink",
					"ZagreusSpear01RunStop_Bink",
					"ZagreusSpear01_Bink",
					"ZagreusSpear01ReturnToIdle_Bink",
					"ZagreusSpear01Spin_Bink",
					"ZagreusSpear01DashAttack_Bink",
					"ZagreusSpear01Throw_Bink",
					"ZagreusSpear01ThrowReceive_Bink"
				}
			},
			SpearRushWeapon =
			{
				FireRumbleParameters =
				{
					{ ScreenPreWait = 0.1, LeftFraction = 0.17, Duration = 0.17 },
				},

				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.30, LerpTime = 0.06 },
					{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.06 },

					--{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.30, LerpTime = 0.06 },
					--{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.06 },
				},

				HitRumbleParameters =
				{
					{ ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Shield" },
						{ Name = "/SFX/Player Sounds/ZagreusDash" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },

					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/ArrowMetalBoneSmash",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

		},
		PropertyChanges =
		{
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "SpearRushWeapon",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "AddControlOnFire",
				ChangeValue = "SpearWeaponThrowReturn",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "Control",
				ChangeValue = "Attack2",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "AlternateControl",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt01",
				ExcludeLinked = true,
			},
			  {
				WeaponName = "SpearWeaponThrowInvisibleReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			{
				WeaponName = "SpearRushWeapon" ,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearRushWeapon" ,
				WeaponProperty = "Enabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearRushWeapon" ,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearRushWeapon" ,
				WeaponProperty = "BlinkDetonateOnInterval",
				ChangeValue = 130,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearRushWeapon" ,
				EffectName = "SpearRushBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.5,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				},
				DeriveSource = "DeriveSource"
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Range",
				ChangeValue = 0.9,
				ChangeType = "Multiply",
			},

			  {
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01ThrowFireReturn",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01ThrowCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01ThrowFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01DashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "SpearReturnPointAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearRushWeapon",
				WeaponProperty = "FireToObstacle",
				ChangeValue = "SpearReturnPointAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01Charge1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01Attack1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon2",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01Attack2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01Attack3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01SpinStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt01SpinStartChargeCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01SpinAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			}
	},
	-- Chaos Curses
	ChaosCurseDeathWeaponTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_01",
		AddEnemyOnDeathWeapons =
		{
			{
				Weapon = "EnemyDeathWeapon"
			}
		},
	},

	ChaosCurseNoMoneyTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
		BlockMoney = true,
	},

	ChaosCurseAmmoUseDelayTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_04",
		RequiredInactiveMetaUpgrade = "ReloadAmmoMetaUpgrade",
		AmmoDropUseDelay =
		{
			BaseMin = 10,
			BaseMax = 15,
			ToNearest = 0.25,
		},
	},

	ChaosCurseHiddenRoomReward =
	{
		InheritFrom = { "ChaosCurseTrait" },
		Icon = "Boon_Chaos_Curse_05",
		HiddenRoomReward = true,
		UsesAsRooms = true,
		RemainingUses =
		{
			BaseMin = 4,
			BaseMax = 5,
			AsInt = true,
		}
	},

	ChaosCurseDamageTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_07",
		AddIncomingDamageModifiers =
		{
			NonTrapDamageTakenMultiplier =
			{
				BaseMin = 1.2,
				BaseMax = 1.5,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "NonTrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageCurse",
					Format = "PercentDelta",
				},
			}
		}
	},

	ChaosCurseTrapDamageTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_03",
		AddIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseMin = 3.0,
				BaseMax = 5.0,
			SourceIsMultiplier = true,
		},
		UsesRequireSpawnMultiplier = true,
		ExtractValues =
		{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		}
	},

	ChaosCurseHealthTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_02",
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseMin = -49,
				BaseMax = -25,
				MaintainDelta = true,
				ChangeType = "Add",
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealthCurse",
				}
			},
		},
		RequiredMinMaxHealthAmount = 50,
	},

	ChaosCurseMoveSpeedTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_09",
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				BaseMin = 0.40,
				BaseMax = 0.60,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},
		}
	},

	ChaosCurseSpawnTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_08",
		SpawnMultiplier =
		{
			BaseMin = 1.3,
			BaseMax = 1.8,
			SourceIsMultiplier = true,
		},
		UsesRequireSpawnMultiplier = true,
		ExtractValues =
		{
			{
				Key = "SpawnMultiplier",
				ExtractAs = "TooltipSpawnMultiplier",
				Format = "PercentDelta",
			},
		}
	},

	ChaosCursePrimaryAttackTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_10",
		DamageOnFireWeapons =
		{
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			Damage =
			{
				BaseMin = 3,
				BaseMax = 5,
				AsInt = true,
			},
			ExtractValues =
			{
				{
					Key = "Damage",
					ExtractAs = "TooltipDamage",
				},
			}
		},
	},

	ChaosCurseSecondaryAttackTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_13",
		DamageOnFireWeapons =
		{
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			ExcludeLinked = true,
			Damage =
			{
				BaseMin = 3,
				BaseMax = 5,
				AsInt = true,
			},
			ExtractValues =
			{
				{
					Key = "Damage",
					ExtractAs = "TooltipDamage",
				},
			}
		},
	},

	ChaosCurseCastAttackTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_12",
		DamageOnFireWeapons =
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			Damage =
			{
				BaseMin = 3,
				BaseMax = 5,
				AsInt = true,
			},
			ExtractValues =
			{
				{
					Key = "Damage",
					ExtractAs = "TooltipDamage",
				},
			}
		},
	},
	ChaosCurseDashAttackTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_11",
		DamageOnFireWeapons =
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			Damage =
			{
				BaseMin = 2,
				BaseMax = 3,
				AsInt = true,
			},
			ExtractValues =
			{
				{
					Key = "Damage",
					ExtractAs = "TooltipDamage",
				},
			}
		},
	},

	-- Chaos Blessings
	ChaosBlessingMeleeTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_01",
		CustomName = "ChaosBlessingMeleeTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.4, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	ChaosBlessingRangedTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_02",
		CustomName = "ChaosBlessingRangedTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.4, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	ChaosBlessingAmmoTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_03",
		CustomName = "ChaosBlessingAmmoTrait_Complete",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Epic =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				BaseMin = 1,
				BaseMax = 1,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipCapacity",
				}
			},
		},
	},

	ChaosBlessingMaxHealthTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_04",
		CustomName = "ChaosBlessingMaxHealthTrait_Complete",
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseMin = 30,
				BaseMax = 40,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	ChaosBlessingBoonRarityTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_10",
		CustomName = "ChaosBlessingBoonRarityTrait_Complete",
		RarityBonus =
		{
			RareBonus =
			{
				BaseMin = 0.11,
				BaseMax = 0.20,
			},
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
	},

	ChaosBlessingTroveTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_09",
		CustomName = "ChaosBlessingTroveTrait_Complete",
		ChallengeRewardIncrease =
			{
				BaseMin = 1.5,
				BaseMax = 3.0,
				SourceIsMultiplier = true,
			},
		ExtractValues =
		{
			{
				Key = "ChallengeRewardIncrease",
				ExtractAs = "TooltipTroveRewardIncrease",
				Format = "PercentDelta",
			},
		}
	},

	ChaosBlessingMoneyTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_05",
		CustomName = "ChaosBlessingMoneyTrait_Complete",
		MoneyMultiplier =
			{
				BaseMin = 1.3,
				BaseMax = 1.5,
				ToNearest = 0.05,
				SourceIsMultiplier = true,
			},
		ExtractValues =
		{
			{
				Key = "MoneyMultiplier",
				ExtractAs = "TooltipMoneyRewardIncrease",
				Format = "PercentDelta",
			},
		}
	},

	ChaosBlessingMetapointTrait = {
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_06",
		CustomName = "ChaosBlessingMetapointTrait_Complete",
		MetaPointMultiplier =
			{
				BaseMin = 2.0,
				BaseMax = 2.5,
				SourceIsMultiplier = true,
			},
		ExtractValues =
		{
			{
				Key = "MetaPointMultiplier",
				ExtractAs = "TooltipMetaPointRewardIncrease",
				Format = "PercentDelta",
			},
		}
	},

	-- unused
	ChaosBlessingSecretTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_11",
		SecretDoorCostMultiplier =
			{
				BaseMin = 0.1,
				BaseMax = 0.3,
			},
		ExtractValues =
		{
			{
				Key = "SecretDoorCostMultiplier",
				ExtractAs = "TooltipCostChange",
				Format = "NegativePercentDelta",
			},
		}
	},

	ChaosBlessingHealTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_07",
		DummyTrait = true,
		HealOnAcquire =
		{
			BaseMin = 30,
			BaseMax = 60,
			AsInt = true,
		},
		ExtractValues =
		{
			{
				Key = "HealOnAcquire",
				ExtractAs = "TooltipHeal",
			},
		}
	},

	ChaosBlessingExtraChanceTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		RequiredOneOfTraits =  { "ChaosBlessingMeleeTrait", "ChaosBlessingRangedTrait", "ChaosBlessingAmmoTrait", "ChaosBlessingMaxHealthTrait", "ChaosBlessingBoonRarityTrait", "ChaosBlessingMoneyTrait", "ChaosBlessingMetapointTrait", "ChaosBlessingSecondaryTrait", "ChaosBlessingDashAttackTrait" },
		ChanceToPlay = 0.20,
		RarityLevels =
		{
			Legendary =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
		},
		Icon = "Boon_Chaos_Blessing_08",
		DummyTrait = true,
		AddLastStand =
		{
			Icon = "ExtraLifeChaos",
			WeaponName = "LastStandMetaUpgradeShield",
			HealFraction = 0.5,
			IncreaseMax = true,
		}
	},

	ChaosBlessingSecondaryTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_12",
		CustomName = "ChaosBlessingSecondaryTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.6, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	ChaosBlessingDashAttackTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_13",
		CustomName = "ChaosBlessingDashAttackTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.4, BaseMax = 1.6, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroDashWeapons,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	-- Bouldy Blessings
	BouldyBlessing =
	{
		Icon = "Boon_Bouldy"
	},

	BouldyBlessing_Armor =
	{
		InheritFrom = { "BouldyBlessing" },
		AddIncomingDamageModifiers =
		{
			NonTrapDamageTakenMultiplier =
			{
				BaseMin = 0.95,
				BaseMax = 0.99,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "NonTrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},
	BouldyBlessing_Attack =
	{
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseMin = 1.01,
				BaseMax = 1.05,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	BouldyBlessing_Special =
	{
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseMin = 1.01,
				BaseMax = 1.05,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	BouldyBlessing_Ranged =
	{
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseMin = 1.01,
				BaseMax = 1.10,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	BouldyBlessing_Speed =
	{
		InheritFrom = { "BouldyBlessing" },
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				BaseMin = 1.01,
				BaseMax = 1.1,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},
		}
	},
	BouldyBlessing_Money =
	{
		InheritFrom = { "BouldyBlessing" },
		MoneyMultiplier =
		{
			BaseMin = 1.01,
			BaseMax = 1.10,
			ToNearest = 0.01,
			SourceIsMultiplier = true,
		},
		ExtractValues =
		{
			{
				Key = "MoneyMultiplier",
				ExtractAs = "TooltipMoneyRewardIncrease",
				Format = "PercentDelta",
			},
		}
	},
	BouldyBlessing_None =
	{
		InheritFrom = { "BouldyBlessing" },
	},
}
