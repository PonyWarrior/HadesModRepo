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