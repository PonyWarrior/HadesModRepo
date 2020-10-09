-- add 5th aspect
-- change the aspect menu
-- custom animations
-- custom boons
-- change all the calls

OnWeaponFired{ "SwordParry",
	function( triggerArgs )
		if HeroHasTrait("YasuoSwordTrait") then
			FireWeaponFromUnit({ Weapon = "YasuoSwordStackApplicator", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
		end
	end
}

OnControlPressed{"Shout",
  function(triggerArgs)
    while IsControlDown({ Name = "Shout" }) do
      if IsControlDown({ Name = "Confirm" }) then

        return
      end
      wait(0.1)
    end
end}

function YasuoSwordStackApply(triggerArgs)
  WeaponData.SwordWeapon.YasuoStack = WeaponData.SwordWeapon.YasuoStack + 1
  if WeaponData.SwordWeapon.YasuoStack >= 2 then
    ModUtil.Hades.PrintStack('test')
    FireWeaponFromUnit({ Weapon = "YasuoSwordTornadoBuffApplicator", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
  end
end

function YasuoSwordStackClear(triggerArgs)
  WeaponData.SwordWeapon.YasuoStack = 0
end

function YasuoSwordTornadoBuffApply(triggerArgs)

end

function YasuoSwordTornadoBuffClear(triggerArgs)

end

local loaded = false
OnAnyLoad{function(triggerArgs)
  if not loaded then
    loaded = true
    -- GameState.LastWeaponUpgradeData["SwordWeapon"] = { Index = 5 }
    EffectData.YasuoSwordStack = {
      OnApplyFunctionName = "YasuoSwordStackApply",
      OnClearFunctionName = "YasuoSwordStackClear",
    }
    EffectData.YasuoSwordTornadoBuff = {
      OnApplyFunctionName = "YasuoSwordTornadoBuffApply",
      OnClearFunctionName = "YasuoSwordTornadoBuffClear",
    }
    WeaponData.SwordWeapon.YasuoStack = 0
    TraitData.YasuoSwordTrait =
    {
      Name = "YasuoSwordTrait",
      Icon = "WeaponEnchantment_Sword04",
      InheritFrom = { "WeaponEnchantmentTrait" },
      RequiredWeapon = "SwordWeapon",
      CustomTrayText = "SwordConsecrationTrait_Tray",
      PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt03ParryReturnToIdle",
      PostWeaponUpgradeScreenAngle = 300,
      PreEquipWeapons = { "YasuoSwordStackApplicator", "SwordThrustWave" },
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
      },
      PropertyChanges =
      {

        -- Main Attack Changes / Excalibur
        -- {
        --   WeaponNames = { "SwordWeaponDash", "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
        --   WeaponProperty = "FullyAutomatic",
        --   ChangeValue = true,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },

        -- SwordWeaponDash
        -- {
        --   WeaponNames = { "SwordWeaponDash" },
        --   WeaponProperty = "ChargeTime",
        --   ChangeValue = 0.20,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
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
        -- Attack 1
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack3_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack3_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeAFlipped-Arthur",
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
          ChangeValue = "SwordWeaponArthur2",
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
        -- Attack 2
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
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
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
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur2",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon2" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        -- Attack 3
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack3_Charge",
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
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur2",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeapon3" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },


        -- Sword Parry

        -- {
        --   WeaponNames = { "SwordParry" },
        --   WeaponProperty = "ChargeStartAnimation",
        --   ChangeValue = "ZagreusSwordAlt03ParryCharge",
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        --
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordAlt03ParryFire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        --
        -- {
        --   WeaponName = "SwordParry",
        --   ProjectileProperty = "DetonateGraphic",
        --   ChangeValue = "RadialNovaSwordParry-Arthur",
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },

        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "ChargeStartAnimation",
          ChangeValue = "ZagreusSwordArthurAttack1_Charge",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "FireGraphic",
          ChangeValue = "ZagreusSwordArthurAttack1_Fire",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "FireFx",
          ChangeValue = "SwordSwipeC-Arthur",
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "RootOwnerWhileFiring",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "ChargeCancelMovement",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "Projectile",
          ChangeValue = "SwordWeaponArthur1",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableArthur",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableArthurCancellable",
          EffectProperty = "Active",
          ChangeValue = true,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisable",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          EffectName = "SwordDisableCancelableAndLockTrigger",
          EffectProperty = "Active",
          ChangeValue = false,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },

        -- {
        --   WeaponNames = { "SwordParry" },
        --   WeaponProperty = "ChargeTime",
        --   ChangeValue = 0.5,
        --   ChangeType = "Absolute",
        --   ExcludeLinked = true,
        -- },
        {
            WeaponNames = { "SwordParry" },
            WeaponProperty = "Projectile",
            ChangeValue = "SpearWeapon",
            ChangeType = "Absolute",
        },

        {
          WeaponNames = { "SwordParry" },
          ProjectileProperty = "DamageLow",
          ChangeValue = 100,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          ProjectileProperty = "DamageHigh",
          ChangeValue = 100,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },

        -- Consecration
        {
            WeaponNames = { "SwordThrustWave" },
            WeaponProperty = "Projectile",
            ChangeValue = "DevotionDemeter",
            ChangeType = "Absolute",
        },
        {
            WeaponNames = { "SwordThrustWave" },
            ProjectileName = "DevotionDemeter",
            ProjectileProperty = "DamageRadius",
            ChangeValue = 270,
            ChangeType = "Absolute",
        },
        {
            WeaponNames = { "SwordThrustWave" },
            ProjectileName = "DevotionDemeter",
            ProjectileProperty = "Fuse",
            ChangeValue = 0.2,
            ChangeType = "Absolute",
        },
        {
            WeaponNames = { "SwordThrustWave" },
            ProjectileName = "DevotionDemeter",
            ProjectileProperty = "TotalFuse",
            ChangeValue = 0.8,
            ChangeType = "Absolute",
        },
        {
          WeaponNames = { "SwordThrustWave" },
          ProjectileProperty = "Speed",
          BaseValue = 1000,
          ChangeType = "Add",
        },

        -- {
        --   LuaProperty = "MaxHealth",
        --   ChangeValue = 50,
        --   AsInt = true,
        --   ChangeType = "Add",
        --   ExtractValue =
        --   {
        --     ExtractAs = "TooltipHealth",
        --   }
        -- },
      },
    }
    WeaponUpgradeData.SwordWeapon[5] = {
      Costs = { 0, 0, 0, 0, 0 },
      MaxUpgradeLevel = 5,
      TraitName = "YasuoSwordTrait",
      EquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOff",
      UnequippedKitAnimation = "WeaponSwordAlt03FloatingIdle",
      BonusUnequippedKitAnimation = "WeaponSwordAlt03FloatingIdleBonus",
      BonusEquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOffBonus",
      Image = "Codex_Portrait_SwordAlt03"
    }
  end
end}
