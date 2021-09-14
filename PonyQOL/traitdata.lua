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
    end

    if PQOL.Config.Gameplay.BetterBalance.Enabled then
        local config = PQOL.Config.Gameplay.BetterBalance

        TraitData.DemeterWeaponTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.BaseValue = config.FrostStrikeBaseDamage
        TraitData.DemeterSecondaryTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.BaseValue = config.FrostFlourishBaseDamage

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
    end
end