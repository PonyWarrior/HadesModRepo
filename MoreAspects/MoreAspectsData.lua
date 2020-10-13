local loaded = false
OnAnyLoad{function(triggerArgs)
  if not loaded then
    loaded = true
		table.insert(KeywordList, "YasuoAspect")
		table.insert(KeywordList, "YasuoSpecial")
		local YasuoData = {
			ZeusWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Zeus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Zeus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Zeus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Zeus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Zeus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Zeus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Zeus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			PoseidonWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Poseidon",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Poseidon-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Poseidon",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Poseidon-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Poseidon-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Poseidon",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Poseidon-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			AthenaWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Athena",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Athena-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Athena",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Athena-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Athena-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Athena",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Athena-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			AphroditeWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Aphrodite",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Aphrodite-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Aphrodite",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Aphrodite-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Aphrodite-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Aphrodite",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Aphrodite-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			ArtemisWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Artemis",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Artemis-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Artemis",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Artemis-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Artemis-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Artemis",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Artemis-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			AresWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Ares",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Ares-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Ares",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Ares-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Ares-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Ares",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Ares-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			DionysusWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Dionysus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Dionysus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Dionysus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Dionysus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Dionysus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Dionysus",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Dionysus-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
			DemeterWeaponTrait = {
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Demeter",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Demeter-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Demeter",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon2" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeA-Demeter-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeAFlipped-Demeter-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeapon3" },
					WeaponProperty = "ChargeFx",
					ChangeValue = "ChargeAttack-Demeter",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					TraitName = "SwordYasuoTrait",
					WeaponNames = { "SwordWeaponDash" },
					WeaponProperty = "FireFx",
					ChangeValue = "SwordSwipeC-Demeter-Arthur",
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
			},
		}
		for _, traitData in pairs(TraitData) do
			if YasuoData[traitData.Name] ~= nil then
				for _, property in pairs(YasuoData[traitData.Name]) do
					table.insert(traitData.PropertyChanges, property)
				end
			end
		end
    EffectData.YasuoSwordStack = {
      OnApplyFunctionName = "YasuoSwordStackApply",
      OnClearFunctionName = "YasuoSwordStackClear",
    }
    EffectData.YasuoSwordTornadoBuff = {
      OnApplyFunctionName = "YasuoSwordTornadoBuffApply",
      OnClearFunctionName = "YasuoSwordTornadoBuffClear",
    }
    WeaponData.SwordWeapon.YasuoStack = 0
    TraitData.SwordYasuoTrait =
    {
      Name = "SwordYasuoTrait",
      Icon = "WeaponEnchantment_Sword05",
      InheritFrom = { "WeaponEnchantmentTrait" },
      RequiredWeapon = "SwordWeapon",
      CustomTrayText = "SwordYasuoTrait_Tray",
      PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt03ParryReturnToIdle",
      PostWeaponUpgradeScreenAngle = 300,
      PreEquipWeapons = { "YasuoSwordStackApplicator", "SwordThrustWave", "YasuoSwordTornadoBuffApplicator" },
      RarityLevels =
      {
        Common =
        {
          MinMultiplier = 1.00,
          MaxMultiplier = 1.00,
        },
        Rare =
        {
					MinMultiplier = 2.00,
          MaxMultiplier = 2.00,
        },
        Epic =
        {
					MinMultiplier = 3.00,
          MaxMultiplier = 3.00,
        },
        Heroic =
        {
					MinMultiplier = 4.00,
          MaxMultiplier = 4.00,
        },
        Legendary =
        {
					MinMultiplier = 5.00,
          MaxMultiplier = 5.00,
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
				-- Sword Dash
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
          ChangeValue = 30,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordWeaponDash" },
          ProjectileProperty = "DamageHigh",
          ChangeValue = 30,
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
					ProjectileProperty = "DamageLow",
					ChangeValue = 25,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponNames = { "SwordWeapon" },
					ProjectileProperty = "DamageHigh",
					ChangeValue = 25,
					ChangeType = "Absolute",
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
					ProjectileProperty = "DamageLow",
					ChangeValue = 25,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponNames = { "SwordWeapon2" },
					ProjectileProperty = "DamageHigh",
					ChangeValue = 25,
					ChangeType = "Absolute",
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
          ChangeValue = "SwordWeaponArthur3",
          ExcludeLinked = true,
        },
				{
					WeaponNames = { "SwordWeapon3" },
					ProjectileProperty = "DamageLow",
					ChangeValue = 35,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponNames = { "SwordWeapon3" },
					ProjectileProperty = "DamageHigh",
					ChangeValue = 35,
					ChangeType = "Absolute",
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

        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "ChargeTime",
          ChangeValue = 0.3,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          WeaponProperty = "Projectile",
          ChangeValue = "SpearWeapon",
          ChangeType = "Absolute",
        },

        {
          WeaponNames = { "SwordParry" },
          ProjectileProperty = "DamageLow",
          ChangeValue = 50,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },
        {
          WeaponNames = { "SwordParry" },
          ProjectileProperty = "DamageHigh",
          ChangeValue = 50,
          ChangeType = "Absolute",
          ExcludeLinked = true,
        },

				{
					WeaponName = "SwordParry",
					WeaponProperty = "Cooldown",
					ChangeValue = 3.0,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},

        -- Tornado
        {
            WeaponNames = { "SwordThrustWave" },
            WeaponProperty = "Projectile",
            ChangeValue = "YasuoSwordTornado",
            ChangeType = "Absolute",
        },
				{
					WeaponNames = { "SwordThrustWave" },
					ProjectileProperty = "DamageLow",
					ChangeValue = 0,
					ChangeType = "Absolute",
					ExcludeLinked = true,
				},
				{
					WeaponNames = { "SwordThrustWave" },
					ProjectileProperty = "DamageLow",
					BaseValue = 1,
					ChangeType = "Add",
					ExcludeLinked = true,
					ExtractValue =
					{
						ExtractAs = "TooltipDamage",
					}
				},
				{
					WeaponNames = { "SwordThrustWave" },
					ProjectileProperty = "DamageHigh",
					DeriveValueFrom = "DamageLow",
				},
				{
					UnitProperty = "CritAddition",
					BaseValue = 0.02,
					ChangeType = "Add",
					ExtractValue =
					{
						ExtractAs = "TooltipCritBonus",
						Format = "Percent",
					},
				},
      },
    }
    WeaponUpgradeData.SwordWeapon[5] = {
      Costs = { 0, 0, 0, 0, 0 },
      MaxUpgradeLevel = 5,
      TraitName = "SwordYasuoTrait",
      EquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOff",
      UnequippedKitAnimation = "WeaponSwordAlt03FloatingIdle",
      BonusUnequippedKitAnimation = "WeaponSwordAlt03FloatingIdleBonus",
      BonusEquippedKitAnimation = "WeaponSwordAlt03FloatingIdleOffBonus",
      Image = "WeaponEnchantment_Sword05"
    }
  end
end}
