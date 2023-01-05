if PAB.Config.Gameplay.Enabled then
    --Make Lucifer beam base destroy projectiles
    for i, property in pairs (TraitData.GunLoadedGrenadeTrait.PropertyChanges) do
        if property.ProjectileProperty == "ProjectileDefenseRadius" then
            table.remove(TraitData.GunLoadedGrenadeTrait.PropertyChanges, i)
        end
    end

    -- No Nourished Soul with LC4
    ModUtil.WrapBaseFunction( "SetTraitsOnLoot", function(baseFunc, lootData, args)
        if lootData.Name == "DemeterUpgrade" then
			if GetNumMetaUpgrades("HealingReductionShrineUpgrade") == 4 and Contains(LootData[lootData.Name].Consumables, "HealingPotencyDrop") then
				for i, loot in pairs (LootData[lootData.Name].Consumables) do
				if loot == "HealingPotencyDrop" then
					table.remove(LootData[lootData.Name].Consumables, i)
				end
				end
			elseif GetNumMetaUpgrades("HealingReductionShrineUpgrade") < 4 and not Contains(LootData[lootData.Name].Consumables, "HealingPotencyDrop") then
				table.insert(LootData[lootData.Name].Consumables, "HealingPotencyDrop")
			end
        end
        return baseFunc(lootData, args)
	end)

	-- Make extra last stand charges be used first
	ModUtil.BaseOverride("CheckLastStand", function (victim, triggerArgs)
		if not HasLastStand( victim ) then
			return false
		end
	
		CancelOpeningCodex()
		CancelFishing()
		DisableCombatControls()
	
		local lastStandData = PAB.PickLastStand(victim.LastStands)
		local weaponName = lastStandData.WeaponName
		local lastStandHealth = lastStandData.HealAmount or 0
		local lastStandFraction = lastStandData.HealFraction or 0
		lastStandFraction = lastStandFraction + GetTotalHeroTraitValue( "LastStandHealFraction" )
	
		CurrentRun.Hero.LastStandsUsed = (CurrentRun.Hero.LastStandsUsed or 0) + 1
	
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "StyxPoison" })
		BlockEffect({ Id = CurrentRun.Hero.ObjectId, Name = "StyxPoison", Duration = 0.75 })
		SetPlayerInvulnerable("LastStand")
	
		triggerArgs.HasLastStand = HasLastStand( victim )
		ExpireProjectiles({ ExcludeNames = WeaponSets.ExpireProjectileExcludeProjectileNames })
	
		PlayerLastStandPresentationStart( triggerArgs )
	
		PlayerLastStandHeal( victim, triggerArgs, lastStandHealth, lastStandFraction )
	
		if GetNumLastStands( victim ) <= 0 and lastStandData.LastStandTimer == nil then
			thread( InCombatText, CurrentRun.Hero.ObjectId, "Hint_LastChance", 1.5, { PreDelay = 0.5, ShadowScale = 0.66 })
			PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteFiredUpLASTCHANCE", Delay = 0.5 })
		end
		if lastStandData.LastStandTimer then
			thread( DamageAfterInterval, lastStandData.LastStandTimer, 1000 )
		end
		thread( UpdateHealthUI, triggerArgs )
	
		PlayerLastStandPresentationEnd()
	
		EnableCombatControls()
		if weaponName ~= nil then
			FireWeaponFromUnit({ Weapon = weaponName, Id= victim.ObjectId, DestinationId = victim.ObjectId, AutoEquip = true })
		end
	
		wait( 1.0, RoomThreadName )
	
	
		SetPlayerVulnerable("LastStand")
		return true
	end)
	
	function PAB.PickLastStand(lastStands)
		local lastStand = nil
        if not IsMetaUpgradeActive("ExtraChanceReplenishMetaUpgrade") then
            for i, lastStandData in pairs(lastStands) do
                if lastStandData.Icon ~= "ExtraLifeZag" then
                    lastStand = table.remove(lastStands, i)
                    return lastStand
                end
            end
        end
		lastStand = table.remove(lastStands)
		return lastStand
	end

	if PAB.Config.Gameplay.GilgameshChanges.Enabled then
		for i, property in pairs(TraitData.FistDetonateTrait.PropertyChanges) do
			if property.EffectName == "FistDetonationDamage" and property.EffectProperty == "Amount" then
				property.BaseValue = PAB.Config.Gameplay.GilgameshChanges.BaseDamage
			end
		end
		table.insert(TraitData.FistDetonateTrait.PropertyChanges,
		{
			WeaponName = "FistDetonationWeapon",
			EffectName = "FistDetonationDamage",
			EffectProperty = "Cooldown",
			ChangeValue = 1.0,
			ChangeType = "Absolute",
		})
		table.insert(TraitData.FistDetonateTrait.PropertyChanges,
		{
			WeaponName = "FistDetonationWeapon",
			EffectName = "FistDetonationDamage",
			EffectProperty = "DamageOnExpire",
			ChangeValue = false,
			ChangeType = "Absolute",
		})
	end

	if PAB.Config.Gameplay.ExtraHammers.Enabled then
		if PAB.Config.Gameplay.ExtraHammers.SuperGunManualReloadTrait.Enabled then

			--Regular reload applies empower
			ModUtil.WrapBaseFunction( "ReloadGun", function (baseFunc, attacker, weaponData )
				baseFunc(attacker, weaponData)
				if HeroHasTrait("SuperGunManualReloadTrait") then
					thread( MarkObjectiveComplete, "ManualReload" )
					ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, WeaponName = "ManualReloadEffectApplicator", EffectName = "ManualReloadBonus" })
				end
				return
			end)

			--Custom reload animation
			ModUtil.BaseOverride( "ReloadPresentationStart", function (attacker, weaponData, state)
				if IsMoving({ Id = attacker.ObjectId }) then
					SetAnimation({ DestinationId = attacker.ObjectId, Name = weaponData.MovingReloadAnimation })
				else
					SetAnimation({ DestinationId = attacker.ObjectId, Name = weaponData.IdleReloadAnimation })
					FireWeaponFromUnit({ Weapon = "GunReloadSelf", AutoEquip = true, Id = attacker.ObjectId, DestinationId = attacker.ObjectId })
				end
				local startX = GetLocalizedValue(GunUI.StartX, {
					{ Code = "ja", Value = 650 },
				})
				--mod start
				if HeroHasTrait("SuperGunManualReloadTrait") then
					state.GunReloadDisplayId = CreateScreenObstacle({ Name = "GunReloadIndicatorSGRT", Group = "Combat_UI", X = startX + GunUI.ReloadingOffsetX, Y = GunUI.StartY + GunUI.ReloadingOffsetY })
				else
					state.GunReloadDisplayId = CreateScreenObstacle({ Name = "GunReloadIndicator", Group = "Combat_UI", X = startX + GunUI.ReloadingOffsetX, Y = GunUI.StartY + GunUI.ReloadingOffsetY })
				end
				--mod end
				thread( PlayVoiceLines, HeroVoiceLines.GunWeaponReloadingStartVoiceLines, true )
			end)
		end
		if PAB.Config.Gameplay.ExtraHammers.BowChainPerfectShotTrait.Enabled then
            local config = PAB.Config.Gameplay.ExtraHammers.BowChainPerfectShotTrait
            WeaponData.BowWeapon.Combo = true
            WeaponData.BowWeaponDash.Combo = true
            ModUtil.Path.Wrap("CheckComboPowers", function (baseFunc, victim, attacker, triggerArgs, sourceWeaponData)
                baseFunc(victim, attacker, triggerArgs, sourceWeaponData)
                if sourceWeaponData ~= nil and sourceWeaponData.Combo and HeroHasTrait("BowChainPerfectShotTrait") then
                    if triggerArgs.IsPerfectCharge then
                        attacker.PerfectShotComboCount = attacker.PerfectShotComboCount + 1
                        CreateAnimation({ Name = "SkillProcFeedbackFx", DestinationId = CurrentRun.Hero.ObjectId, Scale = 1.2, Color = Color.Gray })
                    else
                        attacker.PerfectShotComboCount = 0
                    end
                    attacker.PerfectShotComboCount = Clamp(attacker.PerfectShotComboCount, 0, config.BonusCap)
                    local combo = attacker.PerfectShotComboCount
                    local multiplier = config.BonusDamagePerShot
                    local base = 1.167
                    local baseDash = 1.25

                    local value1 = base * ( 1 + (combo * multiplier))
                    local value2 = baseDash * (1 + (combo * multiplier))


                    SetWeaponProperty({ WeaponName = "BowWeapon", DestinationId = CurrentRun.Hero.ObjectId,
                    Property = "PerfectChargeDamageMultiplier", Value = value1, ValueChangeType = "Absolute" })

                    SetWeaponProperty({ WeaponName = "BowWeaponDash", DestinationId = CurrentRun.Hero.ObjectId,
                    Property = "PerfectChargeDamageMultiplier", Value = value2, ValueChangeType = "Absolute" })
                end
            end, PAB)

            ModUtil.Path.Wrap("SetupHeroObject", function (baseFunc, currentRun, applyLuaUpgrades)
                baseFunc(currentRun, applyLuaUpgrades)
                currentRun.Hero.PerfectShotComboCount = 0
            end)
        end
	end
	if PAB.Config.Gameplay.BetterBalance.Enabled then
		if PAB.Config.Gameplay.BetterBalance.HadesSpearGlobalSweepBuff then
			ModUtil.BaseOverride("MarkTargetSpinApply", function (triggerArgs)
				if not triggerArgs.Reapplied then
					local validWeapons = WeaponSets.HeroAllWeapons
			
					AddIncomingDamageModifier( triggerArgs.TriggeredByTable,
					{
						Name = triggerArgs.EffectName,
						GlobalMultiplier = triggerArgs.Modifier
					})
				end
			end)
		end

		ModUtil.Path.Wrap("GetTraitTooltip", function (baseFunc, trait, args)
			if trait.ModTextOverride then
				return trait.ModTextOverride
			end
			return baseFunc(trait, args)
		end)
	end
end