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