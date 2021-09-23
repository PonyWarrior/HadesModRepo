if AspectFusion.Config.Enabled then
    TraitData.UltraSwordTrait =
	{
		Icon = "Weapon_Sword_15",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapon = "SwordWeapon",
		AddOnFireWeapons = { "ConsecrationField" },
		LegalOnFireWeapons = { "SwordParry" },
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt03ParryReturnToIdle",
		PostWeaponUpgradeScreenAngle = 300,
		Frame = "MetaUpgrade",
        CustomRarityName = "Fusion",
		CustomRarityColor = {3, 94, 252, 255},
		OnProjectileDeathFunction =
		{
			Name = "ConsecrationFieldDeath",
		},
        -- Nemesis
        SwordPostParryCriticalAmount =
        {
            BaseValue = 0.30,
        },
        -- Poseidon
        AddOutgoingDamageModifiers =
        {
            ValidWeaponMultiplier =
            {
                BaseValue = 1.50,
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

				HitSimSlowCooldown = 0.3,
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
				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.05, LerpTime = 0.0 },
					{ ScreenPreWait = 0.03, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.03, Fraction = 1.00, LerpTime = 0.07 },

					--{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
					--{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
				},
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Sword" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
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

			SwordWeapon3 =
			{
				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.01, LerpTime = 0.0 },
					{ ScreenPreWait = 0.02, Fraction = 0.15, LerpTime = 0.06 },
					{ ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.07 },

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
            -- Poseidon
            RangedWeapon =
            {
                NotReadyAmmoInEnemyText = "RetrieveAmmoOrDislodgeFromEnemy",
            }
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
			-- {
			-- 	WeaponNames = { "SwordWeaponDash" },
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 0.20,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
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
			-- 	WeaponNames = { "SwordWeapon" },
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 0.25,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
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
			-- {
			-- 	WeaponNames = { "SwordWeapon2" },
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 0.35,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
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
			-- {
			-- 	WeaponNames = { "SwordWeapon3" },
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 0.50,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
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

			-- {
			-- 	WeaponNames = { "SwordParry" },
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 0.5,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },

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
				ChangeValue = 0.6,
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
				ChangeValue = 0.10,
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
				ChangeValue = 1.07,
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
				MaintainDelta = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},

            -- Zagreus aspect start

            {
                WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
                WeaponProperty = "ChargeTime",
                ChangeValue = 0.85,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon" },
                EffectName = "SwordDisableHeavy",
                EffectProperty = "Duration",
                ChangeValue = 0.85,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
    
            {
                WeaponNames = { "SwordWeapon" },
                EffectName = "SwordDisableCancelableAndLockTrigger",
                EffectProperty = "Duration",
                ChangeValue = 0.85,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon2" },
                EffectName = "SwordDisableCancelableAndLockTrigger2",
                EffectProperty = "Duration",
                ChangeValue = 0.85,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon3" },
                EffectName = "SwordDisable3",
                EffectProperty = "Duration",
                ChangeValue = 0.85,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon3" },
                EffectName = "SwordDisableAttackCancelable3",
                EffectProperty = "Duration",
                ChangeValue = 0.85,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                UnitProperty = "Speed",
                ChangeValue = 1.03,
                ChangeType = "Multiply",
                SourceIsMultiplier = true,
            },

            -- Nemesis aspect

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
		},
	}

    TraitData.UltraFistTrait =
    {
        Icon = "Weapon_Fist_16",
        InheritFrom = { "WeaponEnchantmentTrait" },
        PostWeaponUpgradeScreenAnimation = "ZagreusFistAlt03FlashKick_ReturnToIdle",
        PostWeaponUpgradeScreenAngle = 208,
        RequiredWeapons = { "FistWeapon", "FistWeaponSpecial" },
        RequiredFalseTrait = "FistWeaveTrait",
        Frame = "MetaUpgrade",
        CustomRarityName = "Fusion",
		CustomRarityColor = {3, 94, 252, 255},
        -- Talos
        PreEquipWeapons = {"RushRuptureWeapon", "FistDetonationWeapon", "MarkRuptureApplicator", "FistSpecialVacuum"},
        WeaponBinks =
        {
            "ZagreusFistAlt03Idle_Bink",
            "ZagreusFistAlt03ClawL_Bink",
            "ZagreusFistAlt03ClawR_Bink",
            "ZagreusFistAlt03AerialUpperCut_Bink",
            "ZagreusFistAlt03DashAttack_Bink",
            "ZagreusFistAlt03Dash_Bink",
            "ZagreusFistAlt03Run_Bink",
            "ZagreusFistAlt03RunStop_Bink",
            "ZagreusFistAlt03FlashKick_Bink",
            "ZagreusFistAlt03Grab_Bink",
            "ZagreusFistAlt03DashUpperCut_Bink",
            "ZagreusFistAlt03DashUpperClaw_Bink",
        },
        WeaponDataOverride =
        {
            -- FistWeapon =
            -- {
            --     WeaponBinks =
            --     {
            --         "ZagreusFistAlt03Idle_Bink",
            --         "ZagreusFistAlt03ClawL_Bink",
            --         "ZagreusFistAlt03ClawR_Bink",
            --         "ZagreusFistAlt03AerialUpperCut_Bink",
            --         "ZagreusFistAlt03DashAttack_Bink",
            --         "ZagreusFistAlt03Dash_Bink",
            --         "ZagreusFistAlt03Run_Bink",
            --         "ZagreusFistAlt03RunStop_Bink",
            --         "ZagreusFistAlt03FlashKick_Bink",
            --         "ZagreusFistAlt03Grab_Bink",
            --         "ZagreusFistAlt03DashUpperCut_Bink",
            --         "ZagreusFistAlt03DashUpperClaw_Bink",
            --     },

            --     HitSimSlowCooldown = 0.2,
            --     HitSimSlowParameters =
            --     {
            --         { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
            --         { ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
            --         { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
            --     },

            --     Sounds =
            --     {
            --         FireSounds =
            --         {
            --             { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
            --             { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
            --         },
            --         ImpactSounds =
            --         {
            --             Invulnerable = "/SFX/SwordWallHitClank",
            --             Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            --             Bone = "/SFX/MetalBoneSmash",
            --             Brick = "/SFX/MetalStoneClang",
            --             Stone = "/SFX/MetalStoneClang",
            --             Organic = "/SFX/StabSplatterSmall",
            --             StoneObstacle = "/SFX/SwordWallHitClank",
            --             BrickObstacle = "/SFX/SwordWallHitClank",
            --             MetalObstacle = "/SFX/SwordWallHitClank",
            --             BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            --         },
            --     },

            -- },

            -- FistWeapon2 =
            -- {	
            --     HitSimSlowCooldown = 0.2,
            --     HitSimSlowParameters =
            --     {
            --         { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
            --         { ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
            --         { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
            --     },
            --     Sounds =
            --     {
            --         FireSounds =
            --         {
            --             { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
            --             { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
            --         },
            --         ImpactSounds =
            --         {
            --             Invulnerable = "/SFX/SwordWallHitClank",
            --             Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            --             Bone = "/SFX/MetalBoneSmash",
            --             Brick = "/SFX/MetalStoneClang",
            --             Stone = "/SFX/MetalStoneClang",
            --             Organic = "/SFX/StabSplatterSmall",
            --             StoneObstacle = "/SFX/SwordWallHitClank",
            --             BrickObstacle = "/SFX/SwordWallHitClank",
            --             MetalObstacle = "/SFX/SwordWallHitClank",
            --             BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            --         },
            --     },
            -- },

            -- FistWeapon3 =
            -- {
            --     HitSimSlowCooldown = 0.2,
            --     HitSimSlowParameters =
            --     {
            --         { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
            --         { ScreenPreWait = 0.02, Fraction = 0.70, LerpTime = 0.0 },
            --         { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
            --     },

            --     Sounds =
            --     {
            --         FireSounds =
            --         {
            --             { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
            --             { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
            --         },
            --         ImpactSounds =
            --         {
            --             Invulnerable = "/SFX/SwordWallHitClank",
            --             Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            --             Bone = "/SFX/MetalBoneSmash",
            --             Brick = "/SFX/MetalStoneClang",
            --             Stone = "/SFX/MetalStoneClang",
            --             Organic = "/SFX/StabSplatterSmall",
            --             StoneObstacle = "/SFX/SwordWallHitClank",
            --             BrickObstacle = "/SFX/SwordWallHitClank",
            --             MetalObstacle = "/SFX/SwordWallHitClank",
            --             BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            --         },
            --     },

            -- },

            -- FistWeapon4 =
            -- {
            --     HitSimSlowCooldown = 0.2,
            --     HitSimSlowParameters =
            --     {
            --         { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
            --         { ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
            --         { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
            --     },

            --     Sounds =
            --     {
            --         FireSounds =
            --         {
            --             { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
            --             { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
            --         },
            --         ImpactSounds =
            --         {
            --             Invulnerable = "/SFX/SwordWallHitClank",
            --             Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            --             Bone = "/SFX/MetalBoneSmash",
            --             Brick = "/SFX/MetalStoneClang",
            --             Stone = "/SFX/MetalStoneClang",
            --             Organic = "/SFX/StabSplatterSmall",
            --             StoneObstacle = "/SFX/SwordWallHitClank",
            --             BrickObstacle = "/SFX/SwordWallHitClank",
            --             MetalObstacle = "/SFX/SwordWallHitClank",
            --             BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            --         },
            --     },

            -- },

            -- FistWeapon5 =
            -- {
            --     HitSimSlowCooldown = 0.2,
            --     HitSimSlowParameters =
            --     {
            --         { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
            --         { ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
            --         { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
            --     },

            --     Sounds =
            --     {
            --         FireSounds =
            --         {
            --             { Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist5" },
            --             { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
            --         },
            --         ImpactSounds =
            --         {
            --             Invulnerable = "/SFX/SwordWallHitClank",
            --             Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            --             Bone = "/SFX/MetalBoneSmash",
            --             Brick = "/SFX/MetalStoneClang",
            --             Stone = "/SFX/MetalStoneClang",
            --             Organic = "/SFX/StabSplatterSmall",
            --             StoneObstacle = "/SFX/SwordWallHitClank",
            --             BrickObstacle = "/SFX/SwordWallHitClank",
            --             MetalObstacle = "/SFX/SwordWallHitClank",
            --             BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
            --         },

            --     },

            -- },

            FistWeaponSpecial =
            {
                Sounds =
                {
                    ChargeSounds =
                    {
                        { Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
                    },
                    FireSounds =
                    {
                        { Name = "/VO/ZagreusEmotes/EmoteHeavyFistSpecial" },
                        { Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
                    },
                    ImpactSounds =
                    {
                        Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                        Bone = "/SFX/FistImpactBig",
                        Brick = "/SFX/FistImpactBig",
                        Stone = "/SFX/FistImpactBig",
                        Organic = "/SFX/FistImpactBig",
                        StoneObstacle = "/SFX/FistImpactSmall",
                        BrickObstacle = "/SFX/FistImpactSmall",
                        MetalObstacle = "/SFX/FistImpactSmall",
                        BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                    },
                },
            },

            FistWeaponDash =
            {
                Sounds =
                {
                    FireSounds =
                    {
                        { Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist2" },
                        { Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
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

            FistWeaponSpecialDash =
            {
                HitSimSlowCooldown = 0.2,
                HitSimSlowParameters =
                {
                    { ScreenPreWait = 0.04, Fraction = 0.02, LerpTime = 0.0 },
                    { ScreenPreWait = 0.06, Fraction = 0.10, LerpTime = 0.03 },
                    { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.1 },
                },

                Sounds =
                {
                    FireSounds =
                    {
                        { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashUpper" },
                        { Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
                        { Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
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

            RushWeapon =
            {
                Sounds =
                {
                    FireSounds =
                    {
                        { Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist1" },
                        { Name = "/SFX/Enemy Sounds/Exalted/ExaltedDash" },
                    },
                },
            },

        },
        -- Talos
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
        -- Demeter
        BonusSpecialHits = {
            BaseValue = 5,
        },
        OnEnemyDamagedFunction = 
        {
            Name = "CheckFistDetonation",
        },
        AddOutgoingDamageModifiers =
        {
            -- Somewhat hacky but ensures detonateion isn't boosted by own status effect @alice
            ValidWeaponMultiplier = 0.75,
            Additive = true,
            ValidEffects = { "FistDetonationDamage" },
        },
        PropertyChanges =
        {
            -- FistDetonationWeapon
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "FistDetonationDamage",
                EffectProperty = "Amount",
                BaseValue = 400,
                ChangeType = "Add",
                ExtractValue =
                {
                    ExtractAs = "TooltipDamage",
                },
            },
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "MarkRuptureTarget",
                EffectProperty = "Modifier",
                ChangeValue = 0.5,
                ChangeType = "Add",
                ExtractValue =
                {
                    ExtractAs = "TooltipDamageBonus",
                    Format = "Percent",
                },
            },
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "DetonationDamageTaken",
                EffectProperty = "Modifier",
                ChangeValue = 0.25,
                ChangeType = "Add",
                ExtractValue =
                {
                    ExtractAs = "TooltipDamageTaken",
                    Format = "Percent",			
                },
            },
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "MarkRuptureTarget",
                EffectProperty = "Duration",
                ChangeValue = 4,
                ChangeType = "Absolute",
                ExtractDuration = "ExtractDuration",
                ExtractValue =
                {
                    ExtractAs = "TooltipDuration",
                },
            },
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "DetonationSlow",
                EffectProperty = "Duration",
                DeriveValueFrom = "ExtractDuration"
            },
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "FistDetonationDamage",
                EffectProperty = "Duration",
                ChangeValue = 3.95, -- Should be 0.05 lower than duration defined above.
                ChangeType = "Absolute",
            },
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "DetonationDamageTaken",
                EffectProperty = "Duration",
                DeriveValueFrom = "ExtractDuration"
            },
            -- Dash Weapon Changes
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                WeaponProperty = "WeaponRange",
                ChangeValue = 0.75,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                WeaponProperty = "ClipSize",
                ChangeValue = 2,
                ChangeType = "Add",
                ExcludeLinked = true,
                {
                    ExtractAs = "TooltipBonusDashes",
                }
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                WeaponProperty = "ClipRegenInterval",
                ChangeValue = 1.2,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                WeaponProperty = "BlinkDuration",
                ChangeValue = 0.8,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                WeaponProperty = "IgnoreTriggerLockDuringCooldown",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                WeaponProperty = "FullyAutomatic",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                WeaponProperty = "Cooldown",
                ChangeValue = 0.17,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                EffectName = "RushWeaponInvulnerable",
                EffectProperty = "Duration",
                ChangeValue = 0.8,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                EffectName = "RushWeaponImmuneToForce",
                EffectProperty = "Duration",
                ChangeValue = 0.8,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                EffectName = "RushWeaponDisableMove",
                EffectProperty = "Duration",
                ChangeValue = 0.8,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                EffectName = "RushWeaponSelfGrip",
                EffectProperty = "Active",
                ChangeValue = false,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                EffectName = "RushWeaponSelfSlow",
                EffectProperty = "Active",
                ChangeValue = false,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                EffectName = "RushWeaponDisableRotation",
                EffectProperty = "Active",
                ChangeValue = false,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },

            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                ProjectileProperty = "DamageLow",
                ChangeValue = 0,
                ChangeType = "Add",
                ExcludeLinked = true,
            },
            {
                WeaponNames = WeaponSets.HeroRushWeapons,
                ProjectileProperty = "DamageHigh",
                ChangeValue = 0,
                ChangeType = "Add",
                ExcludeLinked = true,
            },

            -- Gilgamesh Dash
            {
                WeaponNames = { "RushWeapon" },
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusFistAlt03DashNoCollide",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "RushWeapon" },
                WeaponProperty = "UnblockedBlinkFx",
                ChangeValue = "null",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },

            -- Gilgamesh Attack
            -- {
            --     WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
            --     WeaponProperty = "Projectile",
            --     ChangeValue = "FistWeaponClawL",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2", "FistWeapon4" },
            --     WeaponProperty = "Projectile",
            --     ChangeValue = "FistWeaponClawR",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },

            -- {
            --     WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
            --     WeaponProperty = "ChargeStartAnimation",
            --     ChangeValue = "ZagreusFistAlt03ClawL_Start",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
            --     WeaponProperty = "FireGraphic",
            --     ChangeValue = "ZagreusFistAlt03ClawL_Fire",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2", "FistWeapon4" },
            --     WeaponProperty = "ChargeStartAnimation",
            --     ChangeValue = "ZagreusFistAlt03ClawR_Start",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2", "FistWeapon4" },
            --     WeaponProperty = "FireGraphic",
            --     ChangeValue = "ZagreusFistAlt03ClawR_Fire",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },

            -- {
            --     WeaponNames = { "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
            --     WeaponProperty = "ControlWindow",
            --     ChangeValue = 0.5,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },

            -- {
            --     WeaponNames = { "FistWeapon" },
            --     WeaponProperty = "ChargeTime",
            --     ChangeValue = 0.21,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },

            -- {
            --     WeaponNames = { "FistWeapon2", },
            --     WeaponProperty = "ChargeTime",
            --     ChangeValue = 0.14,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },

            -- {
            --     WeaponNames = { "FistWeapon3", },
            --     WeaponProperty = "ChargeTime",
            --     ChangeValue = 0.14,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },

            -- {
            --     WeaponNames = { "FistWeapon4" },
            --     WeaponProperty = "ChargeTime",
            --     ChangeValue = 0.13,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },

            -- {
            --     WeaponNames = { "FistWeapon5" },
            --     WeaponProperty = "ChargeTime",
            --     ChangeValue = 0.12,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            
            -- {
            --     WeaponNames = { "FistWeapon" },
            --     EffectName = "FistDisable",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon" },
            --     EffectName = "FistDisableAndLockTrigger",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2" },
            --     EffectName = "FistDisable2",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2" },
            --     EffectName = "FistDisableAndLockTrigger2",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon3" },
            --     EffectName = "FistDisable3",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon3" },
            --     EffectName = "FistDisableAndLockTrigger3",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon4" },
            --     EffectName = "FistDisable4",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon4" },
            --     EffectName = "FistDisableAndLockTrigger4",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon5" },
            --     EffectName = "FistDisable5",
            --     EffectProperty = "Duration",
            --     ChangeValue = 3.0,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },

            -- {
            --     WeaponNames = { "FistWeapon5" },
            --     EffectName = "FistDetonateMoveDisable",
            --     EffectProperty = "Active",
            --     ChangeValue = true,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            
            -- {
            --     WeaponNames = { "FistWeapon" },
            --     EffectName = "FistSelfSelfSlowFire",
            --     EffectProperty = "Modifier",
            --     ChangeValue = 0.1,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon" },
            --     EffectName = "FistSelfSlowCharge",
            --     EffectProperty = "Modifier",
            --     ChangeValue = 0.05,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon" },
            --     EffectName = "FistSelfSlowCharge",
            --     EffectProperty = "Duration",
            --     ChangeValue = 1.5,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon" },
            --     EffectName = "FistSelfSelfSlowFire",
            --     EffectProperty = "Duration",
            --     ChangeValue = 1.5,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2" },
            --     EffectName = "FistSwordSelfSlowFire2",
            --     EffectProperty = "Modifier",
            --     ChangeValue = 0.1,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2" },
            --     EffectName = "FistSelfSlowCharge2",
            --     EffectProperty = "Modifier",
            --     ChangeValue = 0.05,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2" },
            --     EffectName = "FistSelfSlowCharge2",
            --     EffectProperty = "Duration",
            --     ChangeValue = 1.5,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2" },
            --     EffectName = "FistSwordSelfSlowFire2",
            --     EffectProperty = "Duration",
            --     ChangeValue = 1.5,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon3" },
            --     EffectName = "FistSwordSelfSlowFire3",
            --     EffectProperty = "Modifier",
            --     ChangeValue = 0.1,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon3" },
            --     EffectName = "FistSelfSlowCharge3",
            --     EffectProperty = "Modifier",
            --     ChangeValue = 0.05,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon3" },
            --     EffectName = "FistSelfSlowCharge3",
            --     EffectProperty = "Duration",
            --     ChangeValue = 1.5,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon3" },
            --     EffectName = "FistSwordSelfSlowFire3",
            --     EffectProperty = "Duration",
            --     ChangeValue = 1.5,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon4" },
            --     EffectName = "FistSwordSelfSlowFire4",
            --     EffectProperty = "Modifier",
            --     ChangeValue = 0.1,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon4" },
            --     EffectName = "FistSelfSlowCharge4",
            --     EffectProperty = "Modifier",
            --     ChangeValue = 0.05,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon4" },
            --     EffectName = "FistSelfSlowCharge4",
            --     EffectProperty = "Duration",
            --     ChangeValue = 1.5,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon4" },
            --     EffectName = "FistSwordSelfSlowFire4",
            --     EffectProperty = "Duration",
            --     ChangeValue = 1.5,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- --[[
            -- {
            --     WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
            --     WeaponProperty = "ChargeCancelMovement",
            --     ChangeValue = true,
            --     ChangeType = "Aboslute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
            --     WeaponProperty = "BlockMoveInput",
            --     ChangeValue = true,
            --     ChangeType = "Aboslute",
            --     ExcludeLinked = true,
            -- },
            -- ]]


            -- {
            --     WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
            --     WeaponProperty = "FireFx",
            --     ChangeValue = "ClawSwipe",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeapon2", "FistWeapon4" },
            --     WeaponProperty = "FireFx",
            --     ChangeValue = "ClawSwipeFlipped",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            --fff

            -- Gilgamesh Dash Attack
            {
                WeaponNames = { "FistWeaponDash" },
                WeaponProperty = "Projectile",
                ChangeValue = "FistWeaponClawDash",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                WeaponProperty = "ChargeStartAnimation",
                ChangeValue = "ZagreusFistAlt03DashAttack_Charge",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusFistAlt03DashAttack_Fire",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                WeaponProperty = "ChargeTime",
                ChangeValue = 0.08,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                EffectName = "FistDashDisable",
                EffectProperty = "Duration",
                ChangeValue = 1.5,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                EffectName = "FistDashDisable3",
                EffectProperty = "Duration",
                ChangeValue = 1.5,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                EffectName = "FistDashDisable",
                EffectProperty = "RequestTriggerLock",
                ChangeValue = false,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                EffectName = "FistDashDisable3",
                EffectProperty = "RequestTriggerLock",
                ChangeValue = false,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            --[[
            {
                WeaponNames = { "FistWeaponDashClaw" },
                ProjectileProperty = "DamageLow",
                ChangeValue = 2.0,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                ProjectileProperty = "DamageHigh",
                ChangeValue = 2.0,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            ]]
            {
                WeaponNames = { "FistWeaponClawDash" },
                ProjectileProperty = "StartFx",
                ChangeValue = "ClawSwipeFlippedDash",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },			

            -- Gilgamesh Special

            {
                WeaponNames = { "FistWeaponSpecial" },
                WeaponProperty = "ChargeStartAnimation",
                ChangeValue = "ZagreusFistAlt03AerialUpperCut_Start",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecial" },
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusFistAlt03AerialUpperCut_Fire",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecial" },
                WeaponProperty = "FireFx",
                ChangeValue = "ClawSwipeUppercut",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            --[[
            {
                WeaponNames = { "FistWeaponSpecial" },
                WeaponProperty = "ChargeTime",
                ChangeValue = 1.23,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecial" },
                ProjectileProperty = "DamageLow",
                ChangeValue = 1.68,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecial" },
                ProjectileProperty = "DamageHigh",
                ChangeValue = 1.68,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            ]]

            -- Gilgamesh Dash Special

            {
                WeaponNames = { "FistWeaponSpecialDash" },
                WeaponProperty = "ChargeTime",
                ChangeValue = 0.17,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                EffectName = "FistDashDisable",
                EffectProperty = "RequestTriggerLock",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponDash" },
                EffectName = "FistDashDisable3",
                EffectProperty = "RequestTriggerLock",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecialDash" },
                WeaponProperty = "ChargeStartAnimation",
                ChangeValue = "ZagreusFistAlt03DashUpperCut_Start",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecialDash" },
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusFistAlt03DashUpperCut_Fire",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },

            {
                WeaponNames = { "FistWeaponSpecialDash" },
                EffectName = "FistSpecialDashDisable",
                EffectProperty = "Duration",
                ChangeValue = 1.4,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecialDash" },
                EffectName = "FistSpecialDashDisable2",
                EffectProperty = "Duration",
                ChangeValue = 1.4,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecialDash" },
                EffectName = "FistSpecialDashDisable3",
                EffectProperty = "Duration",
                ChangeValue = 2.0,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },

            {
                TraitName = "FistTeleportSpecialTrait",
                WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
                WeaponProperty = "ChargeStartAnimation",
                ChangeValue = "ZagreusFistAlt03FlashKick_Start",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                TraitName = "FistTeleportSpecialTrait",
                WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusFistAlt03FlashKick_Fire",
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
                ChangeValue = "ZagreusFistAlt03Grab_Fire",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },

            {
                WeaponNames = { "FistWeaponSpecialDash" },
                WeaponProperty = "FireFx",
                ChangeValue = "ClawSwipeUppercutSpecial",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },

            --[[
            {
                WeaponNames = { "FistWeaponSpecialDash" },
                ProjectileProperty = "DamageLow",
                ChangeValue = 1.25,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecialDash" },
                ProjectileProperty = "DamageHigh",
                ChangeValue = 1.25,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            ]]

            --[[
            {
                TraitName = "FistHeavyAttackTrait",
                WeaponName = "FistWeapon2",
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusFistAlt02DashHayMaker_Fire",
                ChangeType = "Absolute",
            },
            {
                TraitName = "FistHeavyAttackTrait",
                WeaponName = "FistWeapon3",
                WeaponProperty = "ChargeStartAnimation",
                ChangeValue = "ZagreusFistAlt02Grab_Start",
                ChangeType = "Absolute",
            },
            {
                TraitName = "FistHeavyAttackTrait",
                WeaponName = "FistWeapon3",
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusFistAlt02Grab_Fire",
                ChangeType = "Absolute",
            },
            ]]

            -- Zagreus Aspect

            {
                LifeProperty = "DodgeChance",
                ChangeValue = 0.15,
                ChangeType = "Add",
                DataValue = false,
                ExtractValue =
                {
                    ExtractAs = "TooltipChance",
                    Format = "Percent"
                },
            },

            -- Talos Aspect

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
                BaseValue = 0.40,
                ChangeType = "Add",
                ExtractValue =
                {
                    ExtractAs = "TooltipDamage",
                    Format = "Percent"
                },
                DeriveSource = "DeriveSource"
            },
            {
                WeaponNames = { "FistSpecialVacuum" },
                EffectName = "MarkTargetFist",
                EffectProperty = "Duration",
                ChangeValue = 6,
                ChangeType = "Absolute",
                ExtractValue =
                {
                    ExtractAs = "TooltipDuration",
                    SkipAutoExtract = true,
                },
                DeriveSource = "DeriveSource"
            },
            {
                WeaponNames = { "FistSpecialVacuum" },
                ProjectileProperty = "DamageLow",
                ChangeValue = 20,
                ExtractValue =
                {
                    ExtractAs = "TooltipPullDamage",
                    SkipAutoExtract = true,
                },
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistSpecialVacuum" },
                ProjectileProperty = "DamageHigh",
                DeriveValueFrom = "DamageLow",
                ExcludeLinked = true,
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
                WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
                WeaponProperty = "AutoLock",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
                WeaponProperty = "AutoLockArcDistance",
                ChangeValue = 220,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
                WeaponProperty = "AutoLockRange",
                ChangeValue = 800,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
        }
    }

    -- Boon animation changes
    ModUtil.LoadOnce(function ()
        for traitName, traitData in pairs(TraitData) do
            local propertiesCopy = {}
            if traitData.PropertyChanges ~= nil then
                for _, property in pairs(traitData.PropertyChanges) do
                    if property.TraitName ~= nil and property.TraitName == "SwordConsecrationTrait" then
                        local propertyCopy = property
                        propertyCopy.TraitName = "UltraSwordTrait"
                        table.insert(traitData.PropertyChanges, propertyCopy)
                    end
                end
            end
        end
    end)

    
end