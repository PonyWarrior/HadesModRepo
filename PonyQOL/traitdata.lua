if PQOL.Config.Gameplay.Enabled then
    if PQOL.Config.Gameplay.ExtraHammers.Enabled then
        if PQOL.Config.Gameplay.ExtraHammers.SuperGunManualReloadTrait.Enabled then
            TraitData.SuperGunManualReloadTrait =
            {
                InheritFrom = { "WeaponTrait" },
                Icon = "Weapon_Gun_03",
                RequiredWeapon = "GunWeapon",
                RequiredTrait = "GunManualReloadTrait",
                RequiredFalseTraits = { "GunSniperTrait", "GunInfiniteAmmoTrait", "GunMinigunTrait", "GunConsecutiveFireTrait", "GunChainShotTrait", "GunLoadedGrenadeTrait", "GunHomingBulletTrait" },
                PropertyChanges =
                {
                    {
                        WeaponName = "GunWeapon",
                        WeaponProperty = "MaxAmmo",
                        ChangeValue = 2,
                        ChangeType = "Absolute",
                    },
                    {
                        WeaponName = "GunWeapon",
                        WeaponProperty = "ActiveReloadTime",
                        ChangeValue = 1.5,
                        ChangeType = "Absolute",
                        ExcludeLinked = true,
                    },
                    {
                        WeaponNames = { "SniperGunWeapon", "SniperGunWeaponDash" },
                        ProjectileProperty = "Range",
                        ChangeValue = 1.5,
                        ChangeType = "Multiply",
                        ExcludeLinked = true,
                    },
                    {
                        WeaponNames = { "SniperGunWeapon", "SniperGunWeaponDash" },
                        WeaponProperty = "AutoLockRange",
                        ChangeValue = 1.5,
                        ChangeType = "Multiply",
                        ExcludeLinked = true,
                    },
                    {
                        WeaponNames = WeaponSets.HeroRushWeapons,
                        WeaponProperty = "Enabled",
                        ChangeValue = false,
                        ChangeType = "Absolute",
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
    
                AddOutgoingDamageModifiers =
                {
                    ValidWeapons = { "SniperGunWeapon", "SniperGunWeaponDash" },
                    ValidWeaponMultiplier =
                    {
                        BaseValue = 3.0,
                        SourceIsMultiplier = true,
                    },
                    ExtractValues =
                    {
                        {
                            Key = "ValidWeaponMultiplier",
                            ExtractAs = "TooltipDamageBonus",
                            Format = "Percent",
                        },
                    }
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
            }
        end
        if PQOL.Config.Gameplay.ExtraHammers.SuperGunManualReloadTrait.Enabled then
            local config = PQOL.Config.Gameplay.ExtraHammers.BowChainPerfectShotTrait
            TraitData.BowChainPerfectShotTrait =
            {
                InheritFrom = { "WeaponTrait" },
                Icon = "Weapon_Bow_06",
                RequiredWeapon = "BowWeapon",
                RequiredFalseTraits = {"BowTapFireTrait"},
                BonusDamagePerShot = config.BonusDamagePerShot,
                BonusCap = config.BonusCap,
                ExtractValues =
                {
                    {
                        Key = "BonusDamagePerShot",
                        ExtractAs = "TooltipDamageBonus",
						Format = "Percent",
				        SkipAutoExtract = true
                    },
                    {
                        Key = "BonusCap",
                        ExtractAs = "TooltipBonusCap",
				        SkipAutoExtract = true
                    }
                }
            }
        end
    end

    if PQOL.Config.Gameplay.BetterBalance.Enabled then
        local config = PQOL.Config.Gameplay.BetterBalance
        local temp
        --Frost Strike
        TraitData.DemeterWeaponTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.BaseValue = config.FrostStrikeBaseDamage
        --Frost Flourish
        TraitData.DemeterSecondaryTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.BaseValue = config.FrostFlourishBaseDamage
        --Mistral Dash
        if config.MistralDashHitCount > 1 then
            TraitData.DemeterRushTrait.ModTextOverride = "DemeterRushTrait_Modded"
            TraitData.DemeterRushTrait.HitCount = config.MistralDashHitCount
            table.insert(TraitData.DemeterRushTrait.ExtractValues, 
        {
                Key = "HitCount",
                ExtractAs = "TooltipTickRate"
            })
        end
        table.insert(TraitData.DemeterRushTrait.PropertyChanges,
        {
            WeaponNames = WeaponSets.HeroRushWeapons,
            ProjectileName = "DemeterIce",
            ProjectileProperty = "TotalFuse",
            ChangeValue = config.MistralDashHitCount * 0.5,
            ChangeType = "Absolute"
        })
        -- Killing Freeze
        if config.KillingFreezePommable then
            TraitData.MaximumChillBonusSlow.RequiredFalseTrait = nil
            for _, propertyChange in pairs(TraitData.MaximumChillBonusSlow.PropertyChanges) do
                -- Decay damage
                if propertyChange.BaseValue ~= nil and propertyChange.BaseValue == 20 then
                    propertyChange.IdenticalMultiplier = { Value = -0.6}
                -- Slow
                elseif propertyChange.BaseValue ~= nil and propertyChange.BaseValue == 0.9 then
                    propertyChange.IdenticalMultiplier = { Value = -1.0}
                end
            end
        end
        -- Arctic Blast
        if config.ArcticBlastPommable then
            TraitData.MaximumChillBlast.RequiredFalseTrait = nil
            for _, propertyChange in pairs(TraitData.MaximumChillBlast.PropertyChanges) do
                if propertyChange.BaseMin ~= nil and propertyChange.BaseMin == 80 then
                    propertyChange.IdenticalMultiplier = { Value = -0.8}
                end
            end
        end
        -- Ravenous Will
        if config.RavenousWillPommable then
            TraitData.ZeroAmmoBonusTrait.RequiredFalseTrait = nil
        end
        --  Demeter's aid
        for _, propertyChange in pairs(TraitData.DemeterShoutTrait.PropertyChanges) do
            if propertyChange.BaseMin ~= nil and propertyChange.BaseMin == 10 then
                propertyChange.BaseMin = config.DemeterAidBaseDamage
                propertyChange.BaseMax = config.DemeterAidBaseDamage
            end
        end
        table.insert(TraitData.DemeterShoutTrait,{
            WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
            ProjectileProperty = "BlastSpeed",
            ChangeValue = config.DemeterAidExpansionSpeed,
            ChangeType = "Multiply",
            ExcludeLinked = true,
        })
        -- Cold Embrace
        TraitData.SelfLaserTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.BaseValue = config.ColdEmbraceBonusDamage
        -- Freezing Vortex
        if config.FreezingVortexSizeChange > 0 then
            TraitData.StationaryRiftTrait.ModTextOverride = "StationaryRiftTrait_Modded"
        end
        for _, propertyChange in pairs(TraitData.StationaryRiftTrait.PropertyChanges) do
            if propertyChange.BaseValue ~= nil and propertyChange.BaseValue == -23 then
                propertyChange.BaseValue = config.FreezingVortexSizeChange
            end
        end
        -- Blizzard Shot
        for _, propertyChange in pairs(TraitData.BlizzardOrbTrait.PropertyChanges) do
            if propertyChange.BaseValue ~= nil and propertyChange.BaseValue == 20 then
                propertyChange.BaseValue = config.BlizzardShotShardDamage
            end
        end
        -- Guan Yu
        for _, propertyChange in pairs(TraitData.SpearSpinTravel.PropertyChanges) do
            -- Dash attack
            if propertyChange.ChangeValue ~= nil and propertyChange.ChangeValue == 30 then
                propertyChange.ChangeValue = config.GuanYuDashAttackDamage
            -- Combo attack 1
            elseif propertyChange.ChangeValue ~= nil and propertyChange.ChangeValue == 40 then
                propertyChange.ChangeValue = config.GuanYuComboAttack1Damage
            -- Special
            elseif propertyChange.ChangeValue ~= nil and propertyChange.ChangeValue == 45 then
                propertyChange.ChangeValue = config.GuanYuSpecialDamage
            -- Combo attack 2
            elseif propertyChange.ChangeValue ~= nil and propertyChange.ChangeValue == 60 then
                propertyChange.ChangeValue = config.GuanYuComboAttack2Damage
            -- Combo attack 3
            elseif propertyChange.ChangeValue ~= nil and propertyChange.ChangeValue == 100 then
                propertyChange.ChangeValue = config.GuanYuComboAttack3Damage
            end
        end
        -- Zagreus Shield
        if config.ZagreusShieldIncreaseSpecialDamage then
            TraitData.ShieldBaseUpgradeTrait.ModTextOverride = "ShieldBaseUpgradeTrait_Modded"
            for _, propertyChange in pairs(TraitData.ShieldBaseUpgradeTrait.PropertyChanges) do
                propertyChange.WeaponNames = { "ShieldWeapon", "ShieldWeaponDash", "ShieldThrow" }
            end
        end
        --Parting Shot
        if config.PartingShotUniversalBackstab then
            temp = nil
            TraitData.CastBackstabTrait.ModTextOverride = "CastBackstabTrait_Modded"
        else
            temp = WeaponSets.HeroNonPhysicalWeapons
        end
        TraitData.CastBackstabTrait.AddOutgoingDamageModifiers =
        {
            ValidWeapons = temp,
			HitVulnerabilityMultiplier = { BaseValue = config.PartingShotBonusDamage, SourceIsMultiplier = true },
			ExtractValues =
			{
				{
					Key = "HitVulnerabilityMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
        }
        --Nemesis Sword
        table.insert(TraitData.SwordCriticalParryTrait.PropertyChanges, 
        {
                WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
                WeaponProperty = "ChargeTime",
                ChangeValue = config.SwordComboAttacksChargeTime,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            })
        table.insert(TraitData.SwordCriticalParryTrait.PropertyChanges, 
        {
                WeaponName = "SwordWeapon3",
                ProjectileProperty = "ImpactVelocity",
                ChangeValue = config.SwordThrustKnockBack,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            })
        table.insert(TraitData.SwordCriticalParryTrait.PropertyChanges, 
        {
                WeaponName = "SwordWeapon",
                EffectName = "SwordDisable",
                EffectProperty = "Duration",
                ChangeValue = config.SwordSlashDisabledDuration,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            })

        --Poseidon Sword
        table.insert(TraitData.DislodgeAmmoTrait.PropertyChanges, 
        {
                WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
                WeaponProperty = "ChargeTime",
                ChangeValue = config.SwordComboAttacksChargeTime,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            })
        table.insert(TraitData.DislodgeAmmoTrait.PropertyChanges, 
        {
                WeaponName = "SwordWeapon3",
                ProjectileProperty = "ImpactVelocity",
                ChangeValue = config.SwordThrustKnockBack,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            })
        table.insert(TraitData.DislodgeAmmoTrait.PropertyChanges, 
        {
                WeaponName = "SwordWeapon",
                EffectName = "SwordDisable",
                EffectProperty = "Duration",
                ChangeValue = config.SwordSlashDisabledDuration,
                SourceIsMultiplier = true,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            })
        -- Hades Spear
        if config.HadesSpearGlobalSweepBuff then
            TraitData.SpearWeaveTrait.ModTextOverride = "SpearWeaveTrait_Modded"
        end
        for _, propertyChange in pairs(TraitData.SpearWeaveTrait.PropertyChanges) do
            if propertyChange.BaseValue ~= nil and propertyChange.BaseValue == 0.30 then
                propertyChange.BaseValue = config.HadesSpearBaseSweepBuff
            end
        end
    end
end