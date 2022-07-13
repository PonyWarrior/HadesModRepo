if AspectFusion.Config.Enabled then
    TraitData.UltraSwordTrait =
	{
		Icon = "Ultra_Sword",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapon = "SwordWeapon",
		AddOnFireWeapons = { "ConsecrationField" },
		LegalOnFireWeapons = { "SwordParry" },
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt03ParryReturnToIdle",
		PostWeaponUpgradeScreenAngle = 300,
		Frame = "Fusion",
        CustomRarityName = "Boon_Fusion",
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
			{
				WeaponNames = { "SwordWeapon3" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 80,
				ChangeType = "Absolute",
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
            {
				WeaponName = "ConsecrationField",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
            {
				WeaponName = "RushWeapon",
				WeaponProperty = "CancelAttachedProjectiles",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
            {
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "SwordWeapon2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
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
			
			-- {
			-- 	WeaponName = "ConsecrationField",
			-- 	EffectName = "ConsecrationDamage",
			-- 	EffectProperty = "Modifier",
			-- 	ChangeValue = 1.15,
			-- 	SourceIsMultiplier = true,
			-- 	ChangeType = "Multiply",
			-- 	ExtractValue =
			-- 	{
			-- 		ExtractAs = "TooltipDamage",
			-- 		Format = "PercentDelta",
			-- 	}
			-- },
			
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
                ChangeValue = 1.15,
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
            -- Charged third slash
            {
                WeaponNames = { "SwordWeapon3" },
                WeaponProperty = "FireOnRelease",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon3" },
                WeaponProperty = "FullyAutomatic",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon3" },
                WeaponProperty = "ChargeTime",
                ChangeValue = 0.8,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon3" },
                WeaponProperty = "MinChargeToFire",
                ChangeValue = 0,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon3" },
                WeaponProperty = "ChargeDamageMultiplier",
                ChangeValue = 3.75,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SwordWeapon3" },
                WeaponProperty = "MinChargeStartFx",
                ChangeValue = "BowChargeFocusedFire",
                ChangeType = "Absolute",
                ExcludeLinked = true,
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
        Frame = "Fusion",
        CustomRarityName = "Boon_Fusion",
		CustomRarityColor = {3, 94, 252, 255},
        -- Talos
        PreEquipWeapons = {"RushRuptureWeapon", "FistDetonationWeapon", "MarkRuptureApplicator", "FistSpecialVacuum"
        ,"UltraRushRuptureWeapon", "UltraFistDetonationWeapon", "UltraMarkRuptureApplicator"},
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
            },
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "DetonationDamageTaken",
                EffectProperty = "Modifier",
                ChangeValue = 0.25,
                ChangeType = "Add",
            },
            {
                WeaponName = "FistDetonationWeapon",
                EffectName = "MarkRuptureTarget",
                EffectProperty = "Duration",
                ChangeValue = 4,
                ChangeType = "Absolute",
                ExtractDuration = "ExtractDuration",
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

            -- Ultra detonation

            {
                WeaponName = "UltraFistDetonationWeapon",
                EffectName = "UltraFistDetonationDamage",
                EffectProperty = "Amount",
                BaseValue = 200,
                ChangeType = "Add",
                ExtractValue =
                {
                    ExtractAs = "TooltipDamage",
                },
            },
            {
                WeaponName = "UltraFistDetonationWeapon",
                EffectName = "UltraMarkRuptureTarget",
                EffectProperty = "Modifier",
                ChangeValue = 0.0,
                ChangeType = "Add",
            },
            {
                WeaponName = "UltraFistDetonationWeapon",
                EffectName = "DetonationDamageTaken",
                EffectProperty = "Modifier",
                ChangeValue = 1.0,
                ChangeType = "Add",
            },
            {
                WeaponName = "UltraFistDetonationWeapon",
                EffectName = "UltraMarkRuptureTarget",
                EffectProperty = "Duration",
                ChangeValue = 4,
                ChangeType = "Absolute",
                ExtractDuration = "ExtractDuration",
            },
            {
                WeaponName = "UltraFistDetonationWeapon",
                EffectName = "DetonationSlow",
                EffectProperty = "Duration",
                DeriveValueFrom = "ExtractDuration"
            },
            {
                WeaponName = "UltraFistDetonationWeapon",
                EffectName = "UltraFistDetonationDamage",
                EffectProperty = "Duration",
                ChangeValue = 3.95, -- Should be 0.05 lower than duration defined above.
                ChangeType = "Absolute",
            },
            {
                WeaponName = "UltraFistDetonationWeapon",
                EffectName = "DetonationDamageTaken",
                EffectProperty = "Duration",
                DeriveValueFrom = "ExtractDuration"
            },
            -- Dash Weapon Changes
            -- {
            --     WeaponNames = WeaponSets.HeroRushWeapons,
            --     WeaponProperty = "WeaponRange",
            --     ChangeValue = 0.75,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
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
            -- {
            --     WeaponNames = WeaponSets.HeroRushWeapons,
            --     WeaponProperty = "ClipRegenInterval",
            --     ChangeValue = 1.2,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = WeaponSets.HeroRushWeapons,
            --     WeaponProperty = "BlinkDuration",
            --     ChangeValue = 0.8,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
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
            -- {
            --     WeaponNames = WeaponSets.HeroRushWeapons,
            --     EffectName = "RushWeaponInvulnerable",
            --     EffectProperty = "Duration",
            --     ChangeValue = 0.8,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = WeaponSets.HeroRushWeapons,
            --     EffectName = "RushWeaponImmuneToForce",
            --     EffectProperty = "Duration",
            --     ChangeValue = 0.8,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = WeaponSets.HeroRushWeapons,
            --     EffectName = "RushWeaponDisableMove",
            --     EffectProperty = "Duration",
            --     ChangeValue = 0.8,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
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
            
            -- {
            --     WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
            --     WeaponProperty = "ChargeTime",
            --     ChangeValue = 1.23,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
            --     ProjectileProperty = "DamageLow",
            --     ChangeValue = 1.68,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
            --     ProjectileProperty = "DamageHigh",
            --     ChangeValue = 1.68,
            --     ChangeType = "Multiply",
            --     ExcludeLinked = true,
            -- },
            

            -- Gilgamesh Dash Special

            -- {
            --     WeaponNames = { "FistWeaponSpecialDash" },
            --     WeaponProperty = "ChargeTime",
            --     ChangeValue = 0.17,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
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
                BaseValue = 0.50,
                ChangeType = "Add",
                DeriveSource = "DeriveSource"
            },
            {
                WeaponNames = { "FistSpecialVacuum" },
                EffectName = "MarkTargetFist",
                EffectProperty = "Duration",
                ChangeValue = 6,
                ChangeType = "Absolute",
                DeriveSource = "DeriveSource"
            },
            {
                WeaponNames = { "FistSpecialVacuum" },
                ProjectileProperty = "DamageLow",
                ChangeValue = 20,
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
    
            -- {
            --     WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
            --     WeaponProperty = "ChargeTime",
            --     ChangeValue = 0.24,
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
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

    TraitData.UltraShieldTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		Icon = "Weapon_Shield_15",
		RequiredWeapons = { "ShieldWeapon", "RangedWeapon" },
		PostWeaponUpgradeScreenAnimation = "ZagreusShieldBeowulfIdle",
		PostWeaponUpgradeScreenAngle = 180,
		PreEquipWeapons = { "SelfLoadAmmoApplicator", "ShieldThrowProjectileBonusApplicator", "ChaosShieldThrow" },
        Frame = "Fusion",
        CustomRarityName = "Boon_Fusion",
		CustomRarityColor = {3, 94, 252, 255},
        AmmoDropData =
		{
			AmmoDropForceMin = 160,
			AmmoDropForceMax = 190,
			AmmoDropUpwardForceMin = 1000,
			AmmoDropUpwardForceMax = 1030,
		},
		AnimDefinitions =
		{
			Default =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf",
					DissipateGraphic = "ShieldRush3DBeowulf-Out",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf",
					DissipateGraphic = "ShieldRush3DBeowulf-Out",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax",
				},
			},

			ArtemisWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Artemis",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Artemis",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Artemis",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Artemis",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Artemis",
				},
			},

			AphroditeWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Aphrodite",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Aphrodite",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Aphrodite",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Aphrodite",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Aphrodite",
				},
			},

			AresWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Ares",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Ares",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Ares",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Ares",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Ares",
				},
			},

			AthenaWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Athena",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Athena",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Athena",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Athena",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Athena",
				},
			},


			DemeterWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Demeter",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Demeter",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Demeter",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Demeter",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Demeter",
				},
			},

			DionysusWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Dionysus",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Dionysus",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Dionysus",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Dionysus",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Dionysus",
				},
			},

			PoseidonWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Poseidon",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Poseidon",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Poseidon",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Poseidon",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Poseidon",
				},
			},

			ZeusWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Zeus",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Zeus",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Zeus",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Zeus",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Zeus",
				},
			},


		},
		OverrideWeaponFireNames =
		{
			RangedWeapon = "nil",
			SelfLoadAmmoApplicator = "RangedWeapon",
		},
		OnProjectileDeathFunction =
		{
			Name = "ShieldFireClear",
			Args = {
				Interval = 0.17,
			},
		},
		SetupFunction =
		{
			Name = "SetupSelfAmmoLoad",
			Args = { Duration = 3 },
			RunOnce = true,
		},
		AddIncomingDamageModifiers =
		{
			GlobalMultiplier = 1.10,
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "ShieldWeaponRush" },
			LoadedAmmoMultiplier = { BaseValue = 2.0, SourceIsMultiplier = true },
			ExcludeLinked = true,
		},
		WeaponBinks =
		{
			"ZagreusShieldBeowulfQuickAttack_Bink",
			"ZagreusShieldBeowulfDashAttack_Bink",
			"ZagreusShieldBeowulfAttack_Bink",
			"ZagreusShieldBeowulfHeavyBullRush_Bink",
            -- zeus shield throws
            "ZagreusShield02ThrowReceive_Bink",
            "ZagreusShield02HeavyThrow_Bink",
            --
			"ZagreusShieldBeowulfIdle_Bink",
			"ZagreusShieldBeowulfRun_Bink",
			"ZagreusShieldBeowulfRunStop_Bink",
			"ZagreusShieldHeavyPound_Bink",
			"ZagreusShieldHeavyThrowNoCatch_Bink",
		},
		WeaponDataOverride =
		{
            -- ShieldWeapon = { Sounds = {}},
			ShieldWeapon =
			{
				WeaponBinks =
				{
					"ZagreusShieldBeowulfQuickAttack_Bink",
					"ZagreusShieldBeowulfDashAttack_Bink",
					"ZagreusShieldBeowulfAttack_Bink",
					"ZagreusShieldBeowulfHeavyBullRush_Bink",
                    -- zeus shield throws
                    "ZagreusShield02ThrowReceive_Bink",
                    "ZagreusShield02HeavyThrow_Bink",
                    "ZagreusShieldHeavyThrowNoCatch_Bink",
                    --
					"ZagreusShieldBeowulfIdle_Bink",
					"ZagreusShieldBeowulfRun_Bink",
					"ZagreusShieldBeowulfRunStop_Bink",
					"ZagreusShieldHeavyPound_Bink",
					"ZagreusShieldHeavyThrowNoCatch_Bink",
				},

				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{

					{ ScreenPreWait = 0.03, Fraction = 0.02, LerpTime = 0 },
					{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0 },
					{ ScreenPreWait = 0.03, Fraction = 1.00, LerpTime = 0 },
				},

				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/VO/ZagreusEmotes/EmoteCharging_Bow",
							StoppedBy = { "ChargeCancel", "Fired" }
						}
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyShieldAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
						{ Name = "" },

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
            -- Zeus shield throws
            ShieldThrowDash =
            {
                RecallWeaponsOnFailToFire = {"ShieldThrow", "ChaosShieldThrow", "ShieldThrowDash"},
            },
            ShieldThrow =
            {
                RecallWeaponsOnFailToFire = {"ShieldThrow", "ChaosShieldThrow", "ShieldThrowDash"},
                NotReadySound = "/SFX/Player Sounds/ZagreusShieldReturn",
    
                Sounds =
                {
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
                        Bone = "/SFX/Player Sounds/ElectricZapSmall",
                        Brick = "/SFX/Player Sounds/ElectricZapSmall",
                        Stone = "/SFX/Player Sounds/ElectricZapSmall",
                        Organic = "/SFX/Player Sounds/ElectricZapSmall",
                        StoneObstacle = "/SFX/Player Sounds/ElectricZapSmall",
                        BrickObstacle = "/SFX/Player Sounds/ElectricZapSmall",
                        MetalObstacle = "/SFX/Player Sounds/ElectricZapSmall",
                        BushObstacle = "/SFX/Player Sounds/ElectricZapSmall",
                    },
                },
            },
			ShieldWeaponDash =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_ShieldThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
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
			ShieldWeaponRush =
			{
				Sounds =
				{
					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
							{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						},
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyShieldRush" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldRush" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyShieldBlock" },
						{ Name = "/SFX/Player Sounds/ZagreusHeavyShieldStomp" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "ShieldWeaponRush",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
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
			}
		},
		BaseLoadedRushScale = 1.20,
		LoadedRushRarityMultiplier = 1,
		PropertyChanges =
		{
            -- Beowulf
			-- Slow heavy shield Rush
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "ShieldRushDamage",
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "ShieldRushDamage"
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeVelocityMultiplier",
				ChangeValue = 4.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 600,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldWeaponHalt",
				EffectProperty = "Duration",
				ChangeValue = 0.18,
				ChangeType = "Absolute",
			},
			]]

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.6,
				ChangeType = "Multiply",
			},
			-- {
			-- 	WeaponName = "ShieldWeaponRush",
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 1.5,
			-- 	ChangeType = "Multiply",
			-- },
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldBeowulfHeavyBullRush_Charge",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusShieldBeowulfAttackChargeCancel",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldBeowulfHeavyBullRush_Fire",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldSelfInvulnerableRush",
				EffectProperty = "AngleCoverage",
				ChangeValue = math.rad(225),
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldSelfReflectRush",
				EffectProperty = "AngleCoverage",
				ChangeValue = math.rad(225),
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldSelfInvulnerableRush",
				EffectProperty = "AngleCoverageOffset",
				ChangeValue = -math.rad(45),
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldSelfReflectRush",
				EffectProperty = "AngleCoverageOffset",
				ChangeValue = -math.rad(45),
				ChangeType = "Absolute",
			},

			-- Main attack

			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 0.16,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	WeaponProperty = "MinChargeToFire",
			-- 	ChangeValue = 1.0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	WeaponProperty = "BlockMoveInput",
			-- 	ChangeValue = true,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	EffectName = "ShieldDisableAttack",
			-- 	EffectProperty = "DisableMove",
			-- 	ChangeValue = true,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			-- {
			-- 	WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
			-- 	ProjectileProperty = "ImpactVelocity",
			-- 	ChangeValue = 1800,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
			-- 	ProjectileProperty = "ImpactVelocityCap",
			-- 	ChangeValue = 1800,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			--[[
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldBeowulfHeavyThrow_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	EffectName = "ShieldSelfSlowFire",
			-- 	EffectProperty = "Duration",
			-- 	ChangeValue = 0.5,
			-- 	ChangeType = "Multiply",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	EffectName = "ShieldDisableAttack",
			-- 	EffectProperty = "Duration",
			-- 	ChangeValue = 1.45,
			-- 	ChangeType = "Multiply",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeaponRush",
			-- 	WeaponProperty = "ControlWindow",
			-- 	ChangeValue = 1.45,
			-- 	ChangeType = "Multiply",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	WeaponProperty = "ChargeStartAnimation",
			-- 	ChangeValue = "ZagreusShieldHeavyPound_Charge",
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	WeaponProperty = "FireGraphic",
			-- 	ChangeValue = "ZagreusShieldHeavyPound_Fire",
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 220,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.11,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
            --fff
            -- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	WeaponProperty = "FireGraphic",
			-- 	ChangeValue = "null",
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
            -- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	ProjectileProperty = "DetonateGraphic",
			-- 	ChangeValue = "null",
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	ProjectileProperty = "DamageLow",
			-- 	ChangeValue = 0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	ProjectileProperty = "DamageHigh",
			-- 	ChangeValue = 0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
            -- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	ProjectileProperty = "DamageRadius",
			-- 	ChangeValue = 0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
            -- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	EffectName = "ShieldDisableAttack",
			-- 	EffectProperty = "Duration",
			-- 	BaseValue = 0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
            -- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	EffectName = "ShieldDisableAttackFast",
			-- 	EffectProperty = "Duration",
			-- 	BaseValue = 0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
            -- {
			-- 	WeaponName = "ShieldWeapon",
			-- 	EffectName = "ShieldSelfSlowFire",
			-- 	EffectProperty = "Duration",
			-- 	ChangeValue = 0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
            --fff

			-- Dash attack

			-- {
			-- 	WeaponName = "ShieldWeaponDash",
			-- 	WeaponProperty = "ChargeTime",
			-- 	ChangeValue = 0.12,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeaponDash",
			-- 	WeaponProperty = "MinChargeToFire",
			-- 	ChangeValue = 1.0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponName = "ShieldWeaponDash",
			-- 	EffectName = "ShieldSelfSlowFireBeowulf",
			-- 	EffectProperty = "Active",
			-- 	ChangeValue = true,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },

			--  {
			-- 	WeaponName = "ShieldWeaponDash",
			-- 	WeaponProperty = "ChargeStartAnimation",
			-- 	ChangeValue = "ZagreusShieldBeowulfPunchFast_Charge",
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
		 	--  },
            --  {
			-- 	WeaponName = "ShieldWeaponDash",
			-- 	WeaponProperty = "SelfVelocity",
			-- 	ChangeValue = 0,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
		 	--  },

			 {
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldBeowulfPunchFast",
				ChangeType = "Absolute",
				ExcludeLinked = true,
		 	 },
			-- Changes to make ranged weapon instant fire
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "IgnoreOwnerAttackDisabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ClearFireRequestOnChargeCancel",
				ChangeValue = false,
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
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
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
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 300
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "RangedWeapon",
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry"
            },

            -- Animations
            --[[
           {
			WeaponName = "ShieldWeapon",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldBeowulfPunch",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  ]]

		--   {
		-- 	WeaponName = "ShieldThrow",
		-- 	ProjectileName = "ShieldThrow",
		-- 	ProjectileProperty = "OnDeathFiredByAnimation",
		-- 	ChangeValue = "ZagreusShieldBeowulfCatch",
		-- 	ChangeType = "Absolute",
		-- 	ExcludeLinked = true,
		--   },

		-- 	{
		-- 		WeaponNames = { "ShieldThrow" },
		-- 		ProjectileName = "ShieldThrow",
		-- 		ProjectileProperty = "Graphic",
		-- 		ChangeValue = "ProjectileShieldAlt03",
		-- 		ChangeType = "Absolute",
		-- 		ExcludeLinked = true,
		-- 	},

			-- vfx

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3DBeowulf",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3DBeowulf-Out",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

            -- Zagreus Aspect

            {
                WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
                ProjectileProperty = "DamageLow",
                ChangeValue = 15,
                ChangeType = "Add",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
                ProjectileProperty = "DamageHigh",
                ChangeValue = 15,
                ChangeType = "Add",
                ExcludeLinked = true,
            },

            -- Zeus Aspect

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
                BaseValue = 30,
                ChangeType = "Absolute",
            },
            {
                WeaponName = "ShieldThrow",
                ProjectileName = "ShieldThrow",
                ProjectileProperty = "DamageHigh",
                BaseValue = 30,
                ChangeType = "Absolute",
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
                ChangeValue = 320,
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
            {
                WeaponName = "ShieldThrow",
                ProjectileName = "ShieldThrow",
                EffectName = "OnHitStun",
                EffectProperty = "Duration",
                ChangeValue = 0.5,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            -- Zeus Chaos

            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "Projectile",
                ChangeValue = "UltraShieldThrow",
                ChangeType = "Absolute",
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "GroupName",
                ChangeValue = "Standing",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "DamageLow",
                BaseValue = 30,
                ChangeType = "Absolute",
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "DamageHigh",
                BaseValue = 30,
                ChangeType = "Absolute",
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "ClearWeaponBonusesOnHit",
                ChangeValue = true,
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "RemoveControlOnFire",
                ChangeValue = "null",
                ChangeType = "Absolute",
            },
    
            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "RemoveControlOnFire3",
                ChangeValue = "null",
                ChangeType = "Absolute",
            },
    
            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "RemoveAllControlSwaps",
                ChangeValue = "null",
                ChangeType = "Absolute",
            },
            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "RemoveControlOnFire",
                ChangeValue = "null",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "MultipleUnitCollisions",
                ChangeValue = false,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "IgnoreCoverageAngles",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "UseVulnerability",
                ChangeValue = false,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
                ChangeValue = 10,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "DisableOwnerForDuration",
                ChangeValue = 0,
                ChangeType = "Absolute",
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileProperty = "SelfImpactVelocityMultiplier",
                ChangeValue = 0,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "Speed",
                ChangeValue = 325,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "Acceleration",
                ChangeValue = -75,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "ReturnToOwnerSpeed",
                ChangeValue = 550,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "PenetrateJumpTargets",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "MultiDetonate",
                ChangeValue = true,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "Fuse",
                ChangeValue = 0.3,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "ShieldThrowTrailMirage",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "DamageRadius",
                ChangeValue = 320,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "DamageRadiusScaleX",
                ChangeValue = 0.9,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "DamageRadiusScaleY",
                ChangeValue = 0.5,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            -- {
            --     WeaponName = "ChaosShieldThrow",
            --     ProjectileName = "UltraShieldThrow",
            --     ProjectileProperty = "AddControlOnDeath",
            --     ChangeValue = "null",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            -- {
            --     WeaponName = "ChaosShieldThrow",
            --     ProjectileName = "UltraShieldThrow",
            --     ProjectileProperty = "AddControlOnDeath2",
            --     ChangeValue = "null",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                EffectName = "OnHitStun",
                EffectProperty = "Duration",
                ChangeValue = 0.5,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusShieldAlt02Throw",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                ProjectileName = "UltraShieldThrow",
                ProjectileProperty = "OnDeathFiredByAnimation",
                ChangeValue = "ZagreusShieldAlt02Catch",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            }, 
            -- Chaos Aspect
            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "NumProjectiles",
                ChangeValue = 5,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "ChaosShieldThrow",
                WeaponProperty = "ProjectileAngleOffset",
                ChangeValue = math.rad(72),
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
		}
	}

    TraitData.UltraSpearTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		Icon = "Weapon_Spear_07",
        Frame = "Fusion",
        CustomRarityName = "Boon_Fusion",
		CustomRarityColor = {3, 94, 252, 255},
        PostWeaponUpgradeScreenFunctionName = "RemoveSpearTeleport",
        PostWeaponUpgradeScreenAnimation = "ZagreusSpearAlt03ThrowFireReturn",
		RequiredWeapons = {"SpearWeapon", "SpearWeaponThrow",},
        PreEquipWeapons = { "SpearRushWeapon", "SpearWeaponThrowInvisibleReturn", "GunBombWeapon" },
		RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinAura" },
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
			"ZagreusSpear03ReturnToIdle_Bink",
			"ZagreusSpear03ThrowReceive_Bink",
		},
		WeaponDataOverride =
		{
            -- Guan Yu spins
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
							Key = "SpearWeaponSpinTravel",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
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
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "SpearWeaponSpin2Travel",
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
							Key = "SpearWeaponSpin3Travel",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
				},
			},
            -- Achilles
            SpearWeaponThrow =
            {
                Sounds =
                {
                    ChargeSounds =
                    {
                        { Name = "/VO/ZagreusEmotes/EmoteHeavyBowCharge",
                            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" },
                        },
                        {
                            Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
                            StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" },
                            SetPitchToPropertyValue = "ChargeTime",
                        },
                    },
                    FireSounds =
                    {
                        { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldThrow" },
                        { Name = "/SFX/Player Sounds/ZagreusDash" },
                        { Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
                    },
                },
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
                        { Name = "/VO/ZagreusEmotes/EmoteAttacking_DashUppercut" },
                        { Name = "/SFX/Enemy Sounds/Hades/HadesDash" },
                        { Name = "/Leftovers/World Sounds/QuickSnap" },
                    },
                    ImpactSounds =
                    {
                        Invulnerable = "/SFX/SwordWallHitClank",
                        Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                        Bone = "/SFX/FistImpactSmall",
                        Brick = "/SFX/FistImpactSmall",
                        Stone = "/SFX/FistImpactSmall",
                        Organic = "/SFX/FistImpactSmall",
                    },
                },
            },
		},
        OnWeaponFiredFunctions =
        {
            ValidWeapons = { "SpearWeaponThrow" },
            FunctionName = "CheckSpearTeleportBuffer",
        },
		MaxHealthMultiplier =
		{
			BaseValue = 0.50,
			SourceIsMultiplier = true,
		},
        AddOutgoingDamageModifiers =
        {
              ValidWeaponMultiplier =
              {
                BaseValue = 1.25,
                SourceIsMultiplier = true,
              },
              ValidWeapons = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
        },
		AddOutgoingLifestealModifiers =
		{
			MaxLifesteal = 1,
			MinLifesteal = 1,
			ValidWeapons = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
			ValidMultiplier = 0.05
		},
		RequiredMinMaxHealthAmount = 10,
		PropertyChanges =
		{
            --Achilles
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
                WeaponNames = { "SpearWeaponThrowReturn" },
                WeaponProperty = "AllowExternalForceRelease",
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
                ChangeValue = 0.07,
                ChangeType = "Add",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SpearWeaponThrow", },
                WeaponProperty = "RemoveControlOnCharge",
                ChangeValue = "SpearWeaponSpin",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SpearWeaponThrow" },
                WeaponProperty = "MinChargeToFire",
                ChangeValue = 0.04,
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
    
            -- Achilles Aspect Changes
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
                BaseValue = 1.5,
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
                WeaponProperty = "ChargeCancelGraphic",
                ChangeValue = "ZagreusSpearAlt01ThrowFireReturnToIdle",
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
                ProjectileProperty = "SpawnType",
                ChangeValue = "OBSTACLE",
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
            -- Guan yu
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "Range",
				ChangeValue = 1000,
				ChangeType = "Add",
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "Speed",
				ChangeValue = 400,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.25,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "SpearWeaponSpin3" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.25,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin2" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.00,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 0.75,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "MultipleObstacleCollisions",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "NumBounces",
				ChangeValue = 99999,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "AttachedAnim",
				ChangeType = "Absolute",
				ChangeValue = "GuanYuSpin",
				ExcludeLinked = true,
			},
            {
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DamageLow",
				ChangeType = "Absolute",
				ChangeValue = "50",
				ExcludeLinked = true,
			},
            {
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DamageHigh",
				ChangeType = "Absolute",
				ChangeValue = "50",
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
                LuaProperty = "MaxHealth",
                BaseValue = 0.50, -- Make sure to change MaxHealthMultiplier in this trait above if this is altered
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                MaintainDelta = true,
                ExtractValue =
                {
                    ExtractAs = "TooltipHealthCurse",
                    Format = "PercentDelta",
                }
            },

            -- Zagreus

            {
                WeaponNames = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                ProjectileProperty = "Range",
                BaseValue = 1.25,
                SourceIsMultiplier = true,
                ChangeType = "MultiplyBase",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                ProjectileProperty = "Speed",
                BaseValue = 1.25,
                SourceIsMultiplier = true,
                ChangeType = "MultiplyBase",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                WeaponProperty = "ChargeTime",
                BaseValue = 0.75,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },

            -- Hades

            {
                WeaponNames = { "SpearWeaponSpin" },
                ProjectileProperty = "DamageRadius",
                ChangeValue = 1.475,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SpearWeaponSpin2" },
                ProjectileProperty = "DamageRadius",
                ChangeValue = 1.375,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "SpearWeaponSpin3" },
                ProjectileProperty = "DamageRadius",
                ChangeValue = 1.275,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
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
                BaseValue = 1.5,
                ChangeType = "Add",
                DeriveSource = "DeriveSource"
            },
            --fff
            {
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageHigh",
                ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
            {
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageRadius",
                ChangeValue = 300,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
            -- {
			-- 	WeaponNames = { "SpearWeaponSpin3" },
			-- 	ProjectileProperty = "SpawnsInheritGroups",
			-- 	ChangeValue = false,
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "SpearWeaponSpin3" },
			-- 	ProjectileProperty = "SkipSpawnsIfBlocked",
			-- 	ChangeValue = true,
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "SpearWeaponSpin3" },
			-- 	ProjectileProperty = "SpawnGroup",
			-- 	ChangeValue = "Standing",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "SpearWeaponSpin3" },
			-- 	ProjectileProperty = "SpawnType",
			-- 	ChangeValue = "UNIT",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "SpearWeaponSpin3" },
			-- 	ProjectileProperty = "SkipSpawnsIfBlocked",
			-- 	ChangeValue = "false",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "SpearWeaponSpin3" },
			-- 	ProjectileProperty = "SpawnOnDetonate",
			-- 	ChangeValue = "ZagreusTombStone",
			-- 	ExcludeLinked = true,
			-- },
		},
	}

    TraitData.UltraBowTrait =
	{
        Frame = "Fusion",
        CustomRarityName = "Boon_Fusion",
		CustomRarityColor = {3, 94, 252, 255},
		Icon = "Weapon_Bow_14",
		InheritFrom = { "WeaponEnchantmentTrait" },
        PreEquipWeapons = { "LoadAmmoApplicator" },
        RequiredWeapons = { "BowWeapon" },
		PostWeaponUpgradeScreenAnimation = "ZagreusBowRamaHeavyShotFireEnd",
		PostWeaponUpgradeScreenAngle = 205,
		WeaponBinks =
		{
			"ZagreusBowRama_Bink",
			"ZagreusBowRamaRun_Bink",
			"ZagreusBowRamaRunStop_Bink",
			"ZagreusBowRamaRapidFire_Bink",
			"ZagreusBowRamaRapidLoop_Bink",
			"ZagreusBowRamaHeavyShot_Bink",
			"ZagreusBowRamaDashShot_Bink",
		},
		WeaponDataOverride =
		{
			BowWeapon =
			{
				FireScreenshake = { Distance = 3, Speed = 400, FalloffSpeed = 1200, Duration = 0.25 },

				WeaponBinks =
				{
					"ZagreusBowRamaDash_Bink",
					"ZagreusBowRama_Bink",
					"ZagreusBowRamaRun_Bink",
					"ZagreusBowRamaRunStop_Bink",
					"ZagreusBowRamaRapidFire_Bink",
					"ZagreusBowRamaRapidLoop_Bink",
					"ZagreusBowRamaHeavyShot_Bink",
					"ZagreusBowRamaDashShot_Bink",
				},

				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.03, LerpTime = 0.0 },
					{ ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },
				},

				Sounds =
				{
					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
							{ Name = "/VO/ZagreusEmotes/EmoteHeavyBowPowerAttack" },
							{ Name = "/SFX/Player Sounds/ZagreusBowFireRamaSitar" },
						},
						ImperfectChargeSounds =
						{
							{ Name = "/VO/ZagreusEmotes/EmoteHeavyBowAttack"},
							{ Name = "/SFX/Player Sounds/ZagreusBowFireRamaSitar" },
						},
						LoadedSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusBloodshotFire" },
						},
						{ Name = "/Leftovers/SFX/AuraOn"},
					},
					ChargeSounds =
					{
						{
							Name = "/VO/ZagreusEmotes/EmoteHeavyBowCharge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
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
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},
			BowWeaponDash =
			{
				FireScreenshake = { Distance = 3, Speed = 300, FalloffSpeed = 1200, Duration = 0.15 },

				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.03, LerpTime = 0.0 },
					{ ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },
				},
			},
			BowSplitShot =
			{
				FireRumbleParameters =
				{
					{ ScreenPreWait = 0.02, RightFraction = 0.225, Duration = 0.16 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyBowFlurry", },
						{ Name = "/SFX/Player Sounds/ZagreusSplitShotRamaSitar"},
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
        SetupFunction =
        {
            Name = "SetupAmmoLoad",
            Args =
            {
                MaxCount = 99,
            },
            RunOnce = true,
        },
        AmmoReclaimTimeDivisor =
        {
            -- basically instant, required for demeter flare
            BaseValue = 999,
            SourceIsMultiplier = true,
        },
        OverrideWeaponFireNames =
        {
            RangedWeapon = "nil",
            LoadAmmoApplicator = "RangedWeapon",
        },
		BondDamageShareData =
		{
			Multiplier = {	BaseValue = 0.6 },
			WeaponNames = { "BowWeapon", "BowWeaponDash"} ,
			AlliedDamageMultiplier = 0.1,
		},
		PropertyChanges =
		{
            -- Zagreus
            {
                WeaponNames = { "BowWeapon", "BowWeaponDash" },
                ProjectileProperty = "CriticalHitChance",
                BaseMin = 0.15,
                BaseMax = 0.15,
                ChangeType = "Add",
            },
            -- Rama
			{
				WeaponNames = { "BowSplitShot" },
				EffectName = "MarkBondTarget",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			-- main shot modifications
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash"},
				ProjectileProperty = "Scale",
				ChangeValue = 3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipWidth",
					Format = "PercentDelta",
					SkipAutoExtract = true,
				}
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash"},
				ProjectileProperty = "ExtentScale",
				ChangeValue = 2,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "PerfectChargeDamageMultiplier",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 1.15,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisable",
				EffectProperty = "Duration",
				ChangeValue = 1.3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisableCancelable",
				EffectProperty = "Duration",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			-- {
			-- 	WeaponNames = { "BowSplitShot" },
			-- 	ProjectileProperty = "NoJumpTargetRandomSpread",
			-- 	ChangeValue = 90,
			-- 	ChangeType = "Absolute",
			-- },
			-- {
			-- 	WeaponNames = { "BowSplitShot" },
			-- 	WeaponProperty = "AutoLock",
			-- 	ChangeValue = true,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "BowSplitShot" },
			-- 	WeaponProperty = "AutoLockRange",
			-- 	ChangeValue = 1000,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "BowSplitShot" },
			-- 	WeaponProperty = "AutoLockArcDistance",
			-- 	ChangeValue = math.rad(90),
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "BowSplitShot" },
			-- 	ProjectileProperty = "NumJumps",
			-- 	ChangeValue = 1,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- 	ExtractValue =
			-- 	{
			-- 		ExtractAs = "BonusJumps",
			-- 		SkipAutoExtract = true,
			-- 	}
			-- },
			-- {
			-- 	WeaponNames = { "BowSplitShot" },
			-- 	ProjectileProperty = "BounceWhenOutOfJumpTargets",
			-- 	ChangeValue = true,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "BowSplitShot" },
			-- 	ProjectileProperty = "JumpRange",
			-- 	ChangeValue = 500,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
			-- {
			-- 	WeaponNames = { "BowSplitShot" },
			-- 	ProjectileProperty = "Fuse",
			-- 	ChangeValue = 0.75,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },
            --fff
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
                ChangeValue = 0.07,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "BowSplitShot" },
                WeaponProperty = "ChargeStartAnimation",
                ChangeValue = "ZagreusBowRamaRapidLoop_Start",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "BowSplitShot" },
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusBowRamaRapidLoop_Fire",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponNames = { "BowSplitShot" },
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNova-UltraBow",
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
				WeaponProperty = "AutoLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = math.rad(90),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
            {
            	WeaponNames = { "BowSplitShot" },
            	WeaponProperty = "ProjectileAngleOffset",
            	ChangeValue = math.rad(45),
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
                ChangeValue = 500,
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
                WeaponProperty = "ChargeTime",
                ChangeValue = 0.18,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisable",
				EffectProperty = "Duration",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableFast",
				EffectProperty = "Duration",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableCancelable",
				EffectProperty = "Duration",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableFastCancelable",
				EffectProperty = "Duration",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
            -- {
            -- 	WeaponNames = { "BowSplitShot" },
            -- 	WeaponProperty = "ProjectileAngleResetCount",
            -- 	ChangeValue = 1,
            -- 	ChangeType = "Absolute",
            -- 	ExcludeLinked = true,
            -- },
            {
                WeaponName = "BowSplitShot",
                WeaponProperty = "ProjectileSpacing",
                ChangeValue = 0,
                ChangeType = "Absolute",
                ExcludeLinked = true
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
                WeaponName = "BowSplitShot",
                ProjectileProperty = "DamageLow",
                ChangeValue = 30,
                ChangeType = "Absolute",
                ExcludeLinked = true
            },
            {
                WeaponName = "BowSplitShot",
                ProjectileProperty = "DamageHigh",
                DeriveValueFrom = "DamageLow",
                ExcludeLinked = true
            },
            --fff
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ClipSize",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRamaHeavyShotStart",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRamaHeavyShotFire",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusBowRamaHeavyShotStartCancel",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRamaDashShot_Start",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRamaDashShot_Fire",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusBowRamaDashShot_Cancel",
				ChangeType = "Absolute",
			},
            -- Chiron
            {
                WeaponNames = { "BowWeapon", "BowWeaponDash" },
                EffectName = "MarkTarget",
                EffectProperty = "Active",
                ChangeValue = true,
            },
            -- Hera
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "IgnoreOwnerAttackDisabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ClearFireRequestOnChargeCancel",
				ChangeValue = false,
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
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
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
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 300
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "RangedWeapon",
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry"
            },
		},
    ExtractValues =
    {
      {
        ExtractAs = "TooltipBondDuration",
        SkipAutoExtract = true,
        External = true,
        BaseType = "Effect",
        WeaponName = "SwordWeapon",
        BaseName = "MarkBondTarget",
        BaseProperty = "Duration",
      },
    }
	}

    TraitData.UltraGunTrait =
	{
        Frame = "Fusion",
        CustomRarityName = "Boon_Fusion",
		CustomRarityColor = {3, 94, 252, 255},
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusGunLuciferReload_End",
		PostWeaponUpgradeScreenAngle = 210,
		Icon = "Weapon_Gun_Lucifer_01",
		RequiredWeapon = "GunWeapon",
		PreEquipWeapons = { "GunBombWeapon", "GunBombImmolation", "ManualReloadEffectApplicator", "UltraSniperGunWeapon"  },
        AddOnFireWeapons = { "UltraGunWeapon" },
		LegalOnFireWeapons = { "GunWeapon" },
		--InfiniteAmmo = true,
		WeaponBinks =
		{
			"ZagreusGunLucifer_Bink",
			"ZagreusGunLuciferIdle_Bink",
			"ZagreusGunLuciferRun_Bink",
			"ZagreusGunLuciferStop_Bink",
			"ZagreusGunLuciferFireEmpty_Bink",
			"ZagreusGunLuciferGrenadeToss_Bink",
		},
		WeaponDataOverride =
		{
			GunWeapon =
			{
				CancelUnitHitFlash = true,
				RapidDamageType = true,
				CancelUnitShake = true,
				CancelArmorUnitShake = true,
				CancelArmorSpark = true,
				DashWeapon = nil,
				IdleReloadAnimation = "ZagreusGunLuciferReload_Start",
				MovingReloadAnimation = "ZagreusGunLuciferRunReload",
				WeaponBinks =
				{
					"ZagreusGunLucifer_Bink",
					"ZagreusGunLuciferIdle_Bink",
					"ZagreusGunLuciferRun_Bink",
					"ZagreusGunLuciferStop_Bink",
					"ZagreusGunLuciferFireEmpty_Bink",
					"ZagreusGunLuciferGrenadeToss_Bink",
				},

				Sounds =
				{
					FireSounds =
					{
					--	{ Name = "/VO/ZagreusEmotes/EmoteHeavyGunFire" },
					--	{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
					},
					LowAmmoFireSounds =
					{
					--	{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
					--	{ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlash" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/BurnDamage",
						Armored = "/SFX/BurnDamage",
						Bone = "/SFX/BurnDamage",
						Brick = "/SFX/BurnDamage",
						Stone = "/SFX/BurnDamage",
						Organic = "/SFX/BurnDamage",
						StoneObstacle = "/SFX/BurnDamage",
						BrickObstacle = "/SFX/BurnDamage",
						MetalObstacle = "/SFX/BurnDamage",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			GunGrenadeToss =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyGunCharge" },
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyGunLob" },
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
            UltraSniperGunWeapon =
            {
                Sounds = 
                {
                    FireSounds =
                    {
                        {"/Leftovers/SFX/AuraPerfectThrow"}
                    }
                }
            }
		},
		PropertyChanges =
		{
            -- Additional shots

			{
				WeaponName = "UltraGunWeapon",
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "UltraGunWeapon",
				ProjectileProperty = "AdjustRateAcceleration",
				ChangeValue = 25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "UltraGunWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 0.30,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "UltraGunWeapon",
				ProjectileProperty = "MaxSpeed",
				ChangeValue = 0.30,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "UltraGunWeapon",
				ProjectileProperty = "Acceleration",
				ChangeValue = 0.30,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "UltraGunWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 1.30,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipRange",
					Format = "PercentDelta",
				},
			},
			{
				WeaponName = "UltraGunWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
            --Lucifer
		    -- move and fire properties
			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisable",
				EffectProperty = "DisableMove",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisableCancellable",
				EffectProperty = "DisableMove",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunSelfSpeed",
				EffectProperty = "DisableMove",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunSelfHalt",
				EffectProperty = "HaltOnEnd",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Type",
				ChangeValue = "BEAM",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ArcSize",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "RefreshProjectileOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "RushWeapon",
				EffectName = "RushWeaponInvulnerable",
				EffectProperty = "ClearOnAttack",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "SkipFireCancelIfFiring",
				ChangeValue = "true",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "AutoAdjustForTarget",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "TotalFuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.13,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.13,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Scatter",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ScatterCap",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DrawAsBeam",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "BarrelLength",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunLucifer_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunLucifer_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireEndGraphic",
				ChangeValue = "ZagreusGunLucifer_ReturnToIdle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunLuciferFireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "OnlyChargeOnce",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DamageLow",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DamageHigh",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DamagePerConsecutiveHit",
				ChangeValue = 0.75,
				--ChangeValue = 0.45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipAmmo",
				},
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisableCancellable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisableLucifer",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisableCancellableLucifer",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[]]
			{
				WeaponName = "RushWeapon",
				EffectName = "RushWeaponInvulnerable",
				EffectProperty = "ClearOnAttack",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- rapid fire trait stabilizers
			
			{
				WeaponName = "ArtemisLegendary",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "LightningStrikeImpact",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ChainLightning",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- bomb properties
			{
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveBombSource = "DeriveBombSource",
			},
            {
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageHigh",
				BaseValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveBombSource = "DeriveBombSource",
			},
            {
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DamageLow",
				BaseValue = 20,
                ChangeType = "Absolute",
				ExcludeLinked = true,
			},
            {
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DamageHigh",
				BaseValue = 20,
                ChangeType = "Absolute",
				ExcludeLinked = true,
			},
            {
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DamageRadius",
				BaseValue = 400,
				ChangeType = "Absolute",
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
				BaseValue = 400,
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
				ProjectileProperty = "SkipSpawnsIfBlocked",
				ChangeValue = "false",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnOnDetonate",
				ChangeValue = "GunBombUnit",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunLuciferGrenadeTossCharge",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunLuciferGrenadeTossFire",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Gravity",
				ChangeValue = 2.10,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Speed",
				ChangeValue = 1.55,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			-- laser vfx

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "BeamStartAnimSkipsImpact",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- bomb vfx

			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

            -- Zagreus

            {
                WeaponNames = { "GunWeapon" },
                WeaponProperty = "MaxAmmo",
                BaseValue = 12,
                AsInt = true,
                ChangeType = "Add",
            },
            {
                WeaponNames = { "UltraGunWeapon", "UltraSniperGunWeapon" },
                WeaponProperty = "MaxAmmo",
                BaseValue = 999999,
                AsInt = true,
                ChangeType = "Add",
            },

            -- Eris

            {
				WeaponNames = { "GunBombWeapon", "GunBombImmolation" },
				ProjectileProperty = "SpawnType",
				ChangeValue = "PROJECTILE",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunBombWeapon", "GunBombImmolation" },
				ProjectileProperty = "SpawnOnDetonate",
				ChangeValue = "GunGrenadeSelfDamage",
				ExcludeLinked = true,
			},
            {
				WeaponNames = { "GunBombWeapon", "GunBombImmolation" },
                EffectName = "ZagreusOnHitStun",
                EffectProperty = "Active",
                ChangeValue = false,
            },
            {
				WeaponNames = { "GunBombWeapon", "GunBombImmolation" },
                EffectName = "GrenadeSelfDamageOutput",
                EffectProperty = "Active",
                ChangeValue = true,
            },
            {
                WeaponNames = { "GunBombWeapon", "GunBombImmolation" },
                EffectName = "GrenadeSelfDamageOutput",
                EffectProperty = "Modifier",
                ChangeValue = 0.75,
                ChangeType = "Add",
            },
            -- Hestia

            {
                WeaponName = "UltraSniperGunWeapon",
                ProjectileProperty = "DamageLow",
                BaseValue = 150,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "UltraSniperGunWeapon",
                ProjectileProperty = "DamageHigh",
                BaseValue = 150,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
                WeaponName = "UltraSniperGunWeapon",
                WeaponProperty = "Enabled",
                ChangeValue = true,
                ChangeType = "Absolute",
            },
            {
                WeaponName = "UltraSniperGunWeapon",
                WeaponProperty = "FireGraphic",
                ChangeValue = "ZagreusGunAlt01Fire",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },

            -- {
			-- 	WeaponName = "UltraSniperGunWeapon",
			-- 	ProjectileProperty = "MaxAdjustRate",
			-- 	ChangeValue = 20,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },

			-- {
			-- 	WeaponName = "UltraSniperGunWeapon",
			-- 	ProjectileProperty = "AdjustRateAcceleration",
			-- 	ChangeValue = 50,
			-- 	ChangeType = "Absolute",
			-- 	ExcludeLinked = true,
			-- },

			-- {
			-- 	WeaponName = "UltraSniperGunWeapon",
			-- 	ProjectileProperty = "Speed",
			-- 	ChangeValue = 0.60,
			-- 	ChangeType = "Multiply",
			-- 	ExcludeLinked = true,
			-- },

			-- {
			-- 	WeaponName = "UltraSniperGunWeapon",
			-- 	ProjectileProperty = "MaxSpeed",
			-- 	ChangeValue = 0.60,
			-- 	ChangeType = "Multiply",
			-- 	ExcludeLinked = true,
			-- },

			-- {
			-- 	WeaponName = "UltraSniperGunWeapon",
			-- 	ProjectileProperty = "Acceleration",
			-- 	ChangeValue = 0.60,
			-- 	ChangeType = "Multiply",
			-- 	ExcludeLinked = true,
			-- },

			{
				WeaponName = "UltraSniperGunWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 1.30,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipRange",
					Format = "PercentDelta",
				},
			},
			{
				WeaponName = "UltraSniperGunWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
    
            {
                WeaponName = "UltraSniperGunWeapon",
                WeaponProperty = "FailedToFireCooldownAnimation",
                ChangeValue = "ZagreusGunAlt01FireEmpty",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            -- {
            --     WeaponName = "UltraSniperGunWeaponDash",
            --     WeaponProperty = "FireGraphic",
            --     ChangeValue = "ZagreusGunAlt01Fire",
            --     ChangeType = "Absolute",
            --     ExcludeLinked = true,
            -- },

            -- Cluster bomb and rocket bomb vfx

            {
                TraitName = "GunGrenadeClusterTrait",
                WeaponNames = { "GunGrenadeToss" },
                ExcludeProjectileName = "GunGrenadeSelfDamage",
                ProjectileProperty = "Graphic",
                ChangeValue = "GunGrenadeLuciferOrb",
            },
            {
                TraitName = "GunExplodingSecondaryTrait",
                WeaponNames = { "GunGrenadeToss" },
                ExcludeProjectileName = "GunGrenadeSelfDamage",
                ProjectileProperty = "Graphic",
                ChangeValue = "GunGrenadeLuciferOrb",
            },

            -- Hack to make cluster bombs explode on impact
            {
                TraitName = "GunGrenadeClusterTrait",
                WeaponNames = { "GunGrenadeToss" },
                ExcludeProjectileName = "GunGrenadeSelfDamage",
                ProjectileProperty = "DamageRadius",
                ChangeValue = 350,
                ChangeType = "Absolute",
                ExcludeLinked = true
            },
            {
                TraitName = "GunGrenadeClusterTrait",
                WeaponNames = { "GunGrenadeToss" },
                ExcludeProjectileName = "GunGrenadeSelfDamage",
                ProjectileProperty = "DamageLow",
                ChangeValue = 1,
                ChangeType = "Absolute",
                ExcludeLinked = true
            },
            {
                TraitName = "GunGrenadeClusterTrait",
                WeaponNames = { "GunGrenadeToss" },
                ExcludeProjectileName = "GunGrenadeSelfDamage",
                ProjectileProperty = "DamageHigh",
                ChangeValue = 1,
                ChangeType = "Absolute",
                ExcludeLinked = true
            },
		},
	}

    TraitData.UltraSpearHealthBonus =
    {
        Hidden = true,
        MaxHealthMultiplier =
        {
            BaseValue = 1.10,
            SourceIsMultiplier = true
        },
        PropertyChanges =
        {
            {
                LuaProperty = "MaxHealth",
                BaseValue = 1.10,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                MaintainDelta = true,
            }
        }
    }

    -- Trait specific changes

    for traitName, traitData in pairs(TraitData) do

        --Shield and bow flares
        if traitData.RequiredFalseTrait ~= nil and traitData.RequiredFalseTrait == "ShieldLoadAmmoTrait" then
            traitData.RequiredFalseTrait = nil
            traitData.RequiredFalseTraits = { "ShieldLoadAmmoTrait", "UltraShieldTrait", "UltraBowTrait"}
        elseif traitData.RequiredFalseTraits ~= nil and Contains(traitData.RequiredFalseTraits, "ShieldLoadAmmoTrait") then
            table.insert(traitData.RequiredFalseTraits, "UltraShieldTrait")
            table.insert(traitData.RequiredFalseTraits, "UltraBowTrait")
        end

        if traitData.RequiredTrait ~= nil and traitData.RequiredTrait == "ShieldLoadAmmoTrait" then
            traitData.RequiredTrait = nil
            traitData.RequiredOneOfTraits = { "ShieldLoadAmmoTrait", "UltraShieldTrait", "UltraBowTrait"}
        end

        if traitData.TraitDependencyTextOverrides ~= nil and traitData.TraitDependencyTextOverrides.ShieldLoadAmmoTrait ~= nil then
            local UltraShieldTrait = traitData.TraitDependencyTextOverrides.ShieldLoadAmmoTrait
            table.insert(traitData.TraitDependencyTextOverrides, UltraShieldTrait)
            local UltraBowTrait = traitData.TraitDependencyTextOverrides.ShieldLoadAmmoTrait
            table.insert(traitData.TraitDependencyTextOverrides, UltraBowTrait)
        end

        if traitData.PropertyChanges ~= nil then
            for _, property in pairs(traitData.PropertyChanges) do
                if property.TraitName ~= nil and property.TraitName == "SwordConsecrationTrait" then
                    local propertyCopy = DeepCopyTable(property)
                    propertyCopy.TraitName = "UltraSwordTrait"
                    table.insert(traitData.PropertyChanges, propertyCopy)
                elseif property.TraitName ~= nil and property.TraitName == "ShieldLoadAmmoTrait" then
                    --shield
                    local legal = false
                    local propertyCopy = DeepCopyTable(property)
                    propertyCopy.TraitName = "UltraShieldTrait"

                    if propertyCopy.WeaponName == nil or propertyCopy.WeaponName == "ShieldThrow" then
                    elseif propertyCopy.WeaponName == "ShieldThrowDash" then
                    elseif propertyCopy.WeaponName == "ChaosShieldThrow" then
                    else
                        legal = true
                    end

                    if propertyCopy.WeaponNames == nil or Contains(propertyCopy.WeaponNames, "ShieldThrow") then
                    elseif Contains(propertyCopy.WeaponNames, "ShieldThrowDash") then
                    elseif Contains(propertyCopy.WeaponNames, "ChaosShieldThrow") then
                    else
                        legal = true
                    end
                    
                    -- not ideal but without it graphic is incorrect
                    if propertyCopy.ChangeValue ~= nil and type(propertyCopy.ChangeValue) == "string" and string.match(propertyCopy.ChangeValue, "ProjectileShieldAlt03") then
                        propertyCopy.ChangeValue = string.gsub(propertyCopy.ChangeValue, "ProjectileShieldAlt03", "ProjectileShieldAlt02")
                    end

                    if legal then
                        table.insert(traitData.PropertyChanges, propertyCopy)
                    end
                    --bow
                    if traitData.Slot == "Ranged" then
                        local propertyCopy2 = DeepCopyTable(property)
                        propertyCopy2.TraitName = "UltraBowTrait"
                        table.insert(traitData.PropertyChanges, propertyCopy2)
                    end

                elseif property.TraitName ~= nil and property.TraitName == "ShieldTwoShieldTrait" then
                    local propertyCopy = DeepCopyTable(property)
                    propertyCopy.TraitName = "UltraShieldTrait"
                    -- extremely cursed
                    if propertyCopy.WeaponName ~= nil and propertyCopy.WeaponName == "ShieldThrow" then
                        table.insert(traitData.PropertyChanges, propertyCopy)
                        local propertyCopyChaos = DeepCopyTable(propertyCopy)
                        propertyCopyChaos.WeaponName = "ChaosShieldThrow"
                        if propertyCopyChaos.ProjectileName ~= nil and propertyCopyChaos.ProjectileName == "ShieldThrow" then
                            propertyCopyChaos.ProjectileName = "UltraShieldThrow"
                        end
                        table.insert(traitData.PropertyChanges, propertyCopyChaos)
                    elseif propertyCopy.WeaponNames ~= nil and Contains(propertyCopy.WeaponNames, "ShieldThrow") then
                        table.insert(traitData.PropertyChanges, propertyCopy)
                        local propertyCopyChaos = DeepCopyTable(propertyCopy)
                        table.insert(propertyCopyChaos.WeaponNames, "ChaosShieldThrow")
                        if propertyCopyChaos.ProjectileName ~= nil and propertyCopyChaos.ProjectileName == "ShieldThrow" then
                            propertyCopyChaos.ProjectileName = "UltraShieldThrow"
                        end
                        table.insert(traitData.PropertyChanges, propertyCopyChaos)
                    end
                elseif property.TraitName ~= nil and property.TraitName == "BowBondTrait" then
                    local legal = false
                    local propertyCopy = DeepCopyTable(property)
                    propertyCopy.TraitName = "UltraBowTrait"

                    if propertyCopy.WeaponName == nil or propertyCopy.WeaponName == "BowSplitShot" then
                    else
                        legal = true
                    end

                    if propertyCopy.WeaponNames == nil or Contains(propertyCopy.WeaponNames, "BowSplitShot") then
                    else
                        legal = true
                    end

                    if legal then
                        table.insert(traitData.PropertyChanges, propertyCopy)
                    end
                elseif property.TraitName ~= nil and property.TraitName == "GunLoadedGrenadeTrait" then
                    -- Exclude cluster bomb and rocket bomb
                    if traitData.Icon ~= "Weapon_Gun_05" and traitData.Icon ~= "Weapon_Gun_08" and traitData.Icon ~= "Boon_Poseidon_00" then
                        local propertyCopy = DeepCopyTable(property)
                        propertyCopy.TraitName = "UltraGunTrait"
                        table.insert(traitData.PropertyChanges, propertyCopy)
                    end

                end
                if property.WeaponName ~= nil and property.WeaponName == "GunWeapon"
                and traitData.Icon ~= "WeaponEnchantment_Gun01"
                and traitData.Icon ~= "WeaponEnchantment_Gun02"
                and traitData.Icon ~= "WeaponEnchantment_Gun03"
                and traitData.Icon ~= "WeaponEnchantment_Gun04"
                and traitData.Icon ~= "Weapon_Gun_Lucifer_01" then
                    if property.TraitName ~= "GunLoadedGrenadeTrait" and property.TraitName ~= "UltraGunTrait" then
                        local propertyCopy = DeepCopyTable(property)
                        propertyCopy.TraitName = "UltraGunTrait"
                        propertyCopy.WeaponName = "UltraGunWeapon"
                        if propertyCopy.ProjectileName ~= nil and propertyCopy.ProjectileName == "GunWeapon" then
                            propertyCopy.ProjectileName = "UltraGunWeapon"
                        end
                        table.insert(traitData.PropertyChanges, propertyCopy)
                    end
                elseif property.WeaponName ~= nil and property.WeaponName == "SniperGunWeapon"
                and traitData.Icon ~= "WeaponEnchantment_Gun01"
                and traitData.Icon ~= "WeaponEnchantment_Gun02"
                and traitData.Icon ~= "WeaponEnchantment_Gun03"
                and traitData.Icon ~= "WeaponEnchantment_Gun04"
                and traitData.Icon ~= "Weapon_Gun_Lucifer_01" then
                    if property.TraitName ~= "GunLoadedGrenadeTrait" and property.TraitName ~= "UltraGunTrait" then
                        local propertyCopy = DeepCopyTable(property)
                        propertyCopy.TraitName = "UltraGunTrait"
                        propertyCopy.WeaponName = "UltraSniperGunWeapon"
                        if propertyCopy.ProjectileName ~= nil and propertyCopy.ProjectileName == "SniperGunWeapon" then
                            propertyCopy.ProjectileName = "UltraSniperGunWeapon"
                        end
                        table.insert(traitData.PropertyChanges, propertyCopy)
                    end
                elseif property.WeaponNames ~= nil and Contains(property.WeaponNames, "GunWeapon")
                and traitData.Icon ~= "WeaponEnchantment_Gun01"
                and traitData.Icon ~= "WeaponEnchantment_Gun02"
                and traitData.Icon ~= "WeaponEnchantment_Gun03"
                and traitData.Icon ~= "WeaponEnchantment_Gun04"
                and traitData.Icon ~= "Weapon_Gun_Lucifer_01" then
                    if property.TraitName ~= "GunLoadedGrenadeTrait" and property.TraitName ~= "UltraGunTrait" then
                        local propertyCopy = DeepCopyTable(property)
                        propertyCopy.TraitName = "UltraGunTrait"
                        propertyCopy.WeaponName = "UltraGunWeapon"
                        if propertyCopy.ProjectileName ~= nil and propertyCopy.ProjectileName == "GunWeapon" then
                            propertyCopy.ProjectileName = "UltraGunWeapon"
                        end
                        table.insert(traitData.PropertyChanges, propertyCopy)
                    end
                elseif property.WeaponNames ~= nil and Contains(property.WeaponNames, "SniperGunWeapon")
                and traitData.Icon ~= "WeaponEnchantment_Gun01"
                and traitData.Icon ~= "WeaponEnchantment_Gun02"
                and traitData.Icon ~= "WeaponEnchantment_Gun03"
                and traitData.Icon ~= "WeaponEnchantment_Gun04"
                and traitData.Icon ~= "Weapon_Gun_Lucifer_01" then
                    if property.TraitName ~= "GunLoadedGrenadeTrait" and property.TraitName ~= "UltraGunTrait" then
                        local propertyCopy = DeepCopyTable(property)
                        propertyCopy.TraitName = "UltraGunTrait"
                        propertyCopy.WeaponName = "UltraSniperGunWeapon"
                        if propertyCopy.ProjectileName ~= nil and propertyCopy.ProjectileName == "SniperGunWeapon" then
                            propertyCopy.ProjectileName = "UltraSniperGunWeapon"
                        end
                        table.insert(traitData.PropertyChanges, propertyCopy)
                    end
                elseif property.WeaponNames ~= nil and Contains(property.WeaponNames, "GunBombImmolation") then
                    --Removes poseidon special self knockback
                    if traitData.Icon == "Boon_Poseidon_00" and property.ProjectileProperty == "ImpactVelocity" and property.TraitName == nil then
                        property.TraitName = "GunLoadedGrenadeTrait"
                    elseif traitData.Icon == "Boon_Poseidon_00" and property.ProjectileProperty == "ImpactVelocityCap" and property.TraitName == nil then
                        property.TraitName = "GunLoadedGrenadeTrait"
                    end
                end
            end
        end

        if traitData.EnemyPropertyChanges ~= nil then
            for _, property in pairs(traitData.EnemyPropertyChanges) do
                if property.TraitName ~= nil and property.TraitName == "GunLoadedGrenadeTrait" then
                    local legal = false
                    local propertyCopy = DeepCopyTable(property)
                    propertyCopy.TraitName = "UltraGunTrait"
                    table.insert(traitData.EnemyPropertyChanges, propertyCopy)
                end
            end
        end
    end

    -- Hammers
        --Gun
    table.insert(TraitData.GunMinigunTrait.RequiredFalseTraits, "UltraGunTrait")
    table.insert(TraitData.GunChainShotTrait.RequiredFalseTraits, "UltraGunTrait")
    table.insert(TraitData.GunShotgunTrait.RequiredFalseTraits, "UltraGunTrait")
    table.insert(TraitData.GunInfiniteAmmoTrait.RequiredFalseTraits, "UltraGunTrait")
    table.insert(TraitData.GunHomingBulletTrait.RequiredFalseTraits, "UltraGunTrait")
    table.insert(TraitData.GunGrenadeDropTrait.RequiredFalseTraits, "UltraGunTrait")

    TraitData.GunLoadedGrenadeSpeedTrait.RequiredFalseTrait = "UltraGunTrait"
    TraitData.GunLoadedGrenadeBoostTrait.RequiredTrait = nil
    TraitData.GunLoadedGrenadeBoostTrait.RequiredOneOfTraits = {"GunLoadedGrenadeTrait", "UltraGunTrait"}
    TraitData.GunLoadedGrenadeWideTrait.RequiredTrait = nil
    TraitData.GunLoadedGrenadeWideTrait.RequiredOneOfTraits = {"GunLoadedGrenadeTrait", "UltraGunTrait"}
    TraitData.GunLoadedGrenadeInfiniteAmmoTrait.RequiredTrait = nil
    TraitData.GunLoadedGrenadeInfiniteAmmoTrait.RequiredOneOfTraits = {"GunLoadedGrenadeTrait", "UltraGunTrait"}
    TraitData.ArtemisRushTrait.RequiredFalseTrait = nil
    TraitData.ArtemisRushTrait.RequiredOneOfTraits = {"GunLoadedGrenadeTrait", "UltraGunTrait"}
    TraitData.ChaosBlessingDashAttackTrait.RequiredFalseTrait = nil
    TraitData.ChaosBlessingDashAttackTrait.RequiredOneOfTraits = {"GunLoadedGrenadeTrait", "UltraGunTrait"}

    table.insert(TraitData.GunGrenadeClusterTrait.PropertyChanges,
    {
        TraitName = "UltraGunTrait",
        WeaponName = "GunGrenadeToss",
        ProjectileProperty = "SpawnCap",
        ChangeValue = 5,
        ChangeType = "Absolute",
        ExcludeLinked = true,
    })
    table.insert(TraitData.GunGrenadeClusterTrait.PropertyChanges,
    {
        TraitName = "UltraGunTrait",
        WeaponNames = {"GunBombWeapon", "GunBombImmolation"},
        ProjectileProperty = "DamageRadius",
        ChangeValue = 350,
        ChangeType = "Absolute",
        ExcludeLinked = true,
    })
    table.insert(TraitData.GunGrenadeClusterTrait.PropertyChanges,
    {
        TraitName = "UltraGunTrait",
        WeaponNames = {"GunBombWeapon", "GunBombImmolation"},
        ProjectileProperty = "DamageLow",
        ChangeValue = 0.7,
        ChangeType = "Multiply",
        ExcludeLinked = true,
    })
    table.insert(TraitData.GunGrenadeClusterTrait.PropertyChanges,
    {
        TraitName = "UltraGunTrait",
        WeaponNames = {"GunBombWeapon", "GunBombImmolation"},
        ProjectileProperty = "DamageHigh",
        DeriveValueFrom = "DamageLow",
    })
    table.insert(TraitData.GunGrenadeClusterTrait.PropertyChanges,
    {
        TraitName = "UltraGunTrait",
        WeaponNames = { "GunGrenadeToss" },
        ExcludeProjectileName = "GunGrenadeSelfDamage",
        ProjectileProperty = "Graphic",
        ChangeValue = "GunGrenadeLuciferOrb",
    })

    table.insert(TraitData.GunExplodingSecondaryTrait.PropertyChanges,
    {
        TraitName = "UltraGunTrait",
        WeaponNames = { "GunGrenadeToss" },
        ExcludeProjectileName = "GunGrenadeSelfDamage",
        ProjectileProperty = "Graphic",
        ChangeValue = "GunGrenadeLuciferOrb",
    })

    TraitData.UltraGunGrenadeDropTrait  =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_06",
		RequiredWeapon = "GunWeapon",
        RequiredTrait = "UltraGunTrait",
		RequiredFalseTraits = { "GunGrenadeFastTrait", "GunGrenadeClusterTrait", "GunExplodingSecondaryTrait", "GunLoadedGrenadeBoostTrait" },
		PropertyChanges =
		{
            --GunBombImmolation
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Gravity",
				ChangeValue = 1250,
				ChangeType = "Absolute",
			},

            {
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 580,
				ChangeType = "Absolute",
                ExcludeLinked = true
			},

			{
				WeaponName = "GunBombWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.45,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "GunBombWeapon",
				ProjectileName = "GunGrenadeToss",
				ProjectileProperty = "AffectsSelf",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunBombWeapon",
				ProjectileProperty = "DamageLow",
				ChangeValue = 4.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponName = "GunBombWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},

			{
				WeaponName = "GunBombImmolation",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.45,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "GunBombImmolation",
				ProjectileName = "GunGrenadeToss",
				ProjectileProperty = "AffectsSelf",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunBombImmolation",
				ProjectileProperty = "DamageLow",
				ChangeValue = 4.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				DeriveSource = "DeriveSource"
			},
			{
				WeaponName = "GunBombImmolation",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "GunGrenadeWarningDecal_StaticHazard",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "ReticleGraphic",
				ChangeValue = "GunGrenadeWarningDecalFlash",
				ChangeType = "Absolute",
			},
		},
	}
    
    table.insert(LootData.WeaponUpgrade.Traits, "UltraGunGrenadeDropTrait")

        -- Fists

    table.insert(TraitData.FistReachAttackTrait.RequiredFalseTraits, "UltraFistTrait")
    table.insert(TraitData.FistSpecialFireballTrait.RequiredFalseTraits, "UltraFistTrait")

    TraitData.FistKillTrait.RequiredFalseTrait = "UltraFistTrait"
    TraitData.FistConsecutiveAttackTrait.RequiredFalseTrait = "UltraFistTrait"
    TraitData.FistDetonateBoostTrait.RequiredTrait = nil
    TraitData.FistDetonateBoostTrait.RequiredOneOfTraits = {"FistDetonateTrait", "UltraFistTrait"}

        -- Bow

    table.insert(TraitData.BowTapFireTrait.RequiredFalseTraits, "UltraBowTrait")

        -- Shield
    
    table.insert(TraitData.ShieldThrowFastTrait.RequiredFalseTraits, "UltraShieldTrait")
    
    TraitData.ShieldLoadAmmoBoostTrait.RequiredTrait = nil
    TraitData.ShieldLoadAmmoBoostTrait.RequiredOneOfTraits = {"ShieldLoadAmmoTrait", "UltraShieldTrait"}

    TraitData.ShieldThrowRushTrait.PropertyChanges =
    {   
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "Graphic",
            ChangeValue = "ProjectileShieldMirage",
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "GroupName",
            ChangeValue = "Standing",
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "DamageLow",
            BaseValue = 30,
            ChangeType = "Absolute",
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "DamageHigh",
            BaseValue = 30,
            ChangeType = "Absolute",
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "ClearWeaponBonusesOnHit",
            ChangeValue = true,
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            WeaponProperty = "RemoveControlOnFire",
            ChangeValue = "null",
            ChangeType = "Absolute",
        },
    
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            WeaponProperty = "RemoveControlOnFire3",
            ChangeValue = "null",
            ChangeType = "Absolute",
        },
    
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            WeaponProperty = "RemoveAllControlSwaps",
            ChangeValue = "null",
            ChangeType = "Absolute",
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            WeaponProperty = "RemoveControlOnFire",
            ChangeValue = "null",
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "MultipleUnitCollisions",
            ChangeValue = false,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "IgnoreCoverageAngles",
            ChangeValue = true,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "UseVulnerability",
            ChangeValue = false,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
            ChangeValue = 10,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            WeaponProperty = "DisableOwnerForDuration",
            ChangeValue = 0,
            ChangeType = "Absolute",
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "FinalJumpToOwner",
            ChangeValue = true,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileProperty = "SelfImpactVelocityMultiplier",
            ChangeValue = 0,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "Speed",
            ChangeValue = 325,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "Acceleration",
            ChangeValue = -75,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "ReturnToOwnerSpeed",
            ChangeValue = 550,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "PenetrateJumpTargets",
            ChangeValue = true,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "MultiDetonate",
            ChangeValue = true,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "Fuse",
            ChangeValue = 0.3,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "DetonateGraphic",
            ChangeValue = "ShieldThrowTrailMirage",
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "DamageRadius",
            ChangeValue = 320,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "DamageRadiusScaleX",
            ChangeValue = 0.9,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "DamageRadiusScaleY",
            ChangeValue = 0.5,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            ProjectileProperty = "AddControlOnDeath",
            ChangeValue = "null",
            ChangeType = "Absolute",
            ExcludeLinked = true,
        },
        {
            TraitName = "UltraShieldTrait",
            WeaponName = "ShieldThrowDash",
            ProjectileName = "ShieldThrowDash",
            EffectName = "OnHitStun",
            EffectProperty = "Duration",
            ChangeValue = 0.5,
            ChangeType = "Absolute",
            ExcludeLinked = true,
        }
    }

        -- Spear

    table.insert(TraitData.SpearThrowBounce.RequiredFalseTraits, "UltraSpearTrait")
    table.insert(TraitData.SpearThrowCritical.RequiredFalseTraits, "UltraSpearTrait")
    table.insert(TraitData.SpearThrowElectiveCharge.RequiredFalseTraits, "UltraSpearTrait")
    table.insert(TraitData.SpearSpinChargeAreaDamageTrait.RequiredFalseTraits, "UltraSpearTrait")
    table.insert(TraitData.SpearThrowExplode.RequiredFalseTraits, "UltraSpearTrait")

    TraitData.SpearSpinTravelDurationTrait.RequiredTrait = nil
    TraitData.SpearSpinTravelDurationTrait.RequiredOneOfTraits = {"SpearSpinTravel", "UltraSpearTrait"}
        -- Sword
    TraitData.SwordConsecrationBoostTrait.RequiredTrait = nil
    TraitData.SwordConsecrationBoostTrait.RequiredOneOfTraits = {"SwordConsecrationTrait", "UltraSwordTrait"}

    table.insert(TraitData.SwordTwoComboTrait.PropertyChanges,
    {
        TraitName = "UltraSwordTrait",
        WeaponName = "SwordWeapon",
        ProjectileProperty = "DamageLow",
        ChangeValue = 60,
        ChangeType = "Absolute",
        ExcludeLinked = true,
    })
    table.insert(TraitData.SwordTwoComboTrait.PropertyChanges,
    {
        TraitName = "UltraSwordTrait",
        WeaponName = "SwordWeapon2",
        ProjectileProperty = "DamageLow",
        ChangeValue = 80,
        ChangeType = "Absolute",
        ExcludeLinked = true,
    })
    table.insert(TraitData.SwordTwoComboTrait.PropertyChanges,
    {
        TraitName = "UltraSwordTrait",
        WeaponName = "SwordWeapon",
        ProjectileProperty = "DamageHigh",
        ChangeValue = 60,
        ChangeType = "Absolute",
        ExcludeLinked = true,
    })
    table.insert(TraitData.SwordTwoComboTrait.PropertyChanges,
    {
        TraitName = "UltraSwordTrait",
        WeaponName = "SwordWeapon2",
        ProjectileProperty = "DamageHigh",
        ChangeValue = 80,
        ChangeType = "Absolute",
        ExcludeLinked = true,
    })

    table.insert(TraitData.SwordHeavySecondStrikeTrait.PropertyChanges,
    {
        TraitName = "UltraSwordTrait",
        WeaponName = "SwordWeapon2",
        ProjectileProperty = "DamageLow",
        ChangeValue = 145,
        ChangeType = "Absolute",
        ExcludeLinked = true,
        ExtractValue =
        {
            ExtractAs = "TooltipDamage",
        },
    })
    table.insert(TraitData.SwordHeavySecondStrikeTrait.PropertyChanges,
    {
        WeaponName = "SwordWeapon2",
        ProjectileProperty = "DamageHigh",
        ChangeValue = 145,
        ChangeType = "Absolute",
        ExcludeLinked = true,
    })

    --Other changes
        --Gun
    WeaponSets.LinkedWeaponUpgrades.GunWeapon = { "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash", "UltraGunWeapon", "UltraSniperGunWeapon" }
    WeaponSets.HeroWeaponSets.GunWeapon = { "GunGrenadeToss", "GunBombWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash", "UltraGunWeapon", "UltraSniperGunWeapon" }
    
end