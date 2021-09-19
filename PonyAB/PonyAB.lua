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

	if PAB.Config.Gameplay.OldChaosShield.Enabled then
		OnAnyLoad{function(triggerArgs)
			SetProjectileProperty({ WeaponName = "ChaosShieldThrow", DestinationId = CurrentRun.Hero.ObjectId, Property = "Speed", Value = 2600 })
			SetProjectileProperty({ WeaponName = "ChaosShieldThrow", DestinationId = CurrentRun.Hero.ObjectId, Property = "NumJumps", Value = 2 })
			SetWeaponProperty({ WeaponName = "ChaosShieldThrow", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileAngleOffset", Value = 45 })
		end}
	end
	if PAB.Config.Gameplay.ExtraHammers.Enabled then
		if PAB.Config.Gameplay.ExtraHammers.SuperGunManualReloadTrait.Enabled then
			function ApplyWeaponPropertyChange( unit, weaponName, propertyChange, reverse )

				if propertyChange.LegalWeapons ~= nil then
					if not Contains( propertyChange.LegalWeapons, weaponName ) then
						return
					end
				end

				if propertyChange.LegalWeapon ~= nil then
					if propertyChange.LegalWeapon ~= weaponName then
						return
					end
				end

				if propertyChange.LegalUnits ~= nil then
					if not Contains( propertyChange.LegalUnits, unit.Name ) then
						return
					end
				end

				local changeValue = propertyChange.ChangeValue
				if reverse then
					if propertyChange.ChangeType == "Multiply" then
						changeValue = 1 / changeValue
					elseif propertyChange.ChangeType == "Add" then
						changeValue = 0 - changeValue
					elseif type(changeValue) == "boolean" then
						changeValue = not changeValue
					else
						return
					end
				end
			if propertyChange.WeaponProperty ~= nil then
				SetWeaponProperty({ WeaponName = weaponName, DestinationId = unit.ObjectId, Property = propertyChange.WeaponProperty, Value = changeValue, ValueChangeType = propertyChange.ChangeType })
				if propertyChange.WeaponProperty == "MaxAmmo" then

					if weaponName == "GunWeapon" then
						thread( UpdateGunUI )
					elseif weaponName == "RangedWeapon" then
						if propertyChange.ChangeType == "Add" and changeValue > 0 then
							RunWeaponMethod({ Id = unit.ObjectId, Weapon = "RangedWeapon", Method = "AddAmmo", Parameters = { math.ceil(changeValue) } })
						end
						thread( UpdateAmmoUI )
					end
				end
				if propertyChange.WeaponProperty == "ClipSize" then
					RunWeaponMethod({ Id = unit.ObjectId, Weapon = "RushWeapon", Method = "forceReload" })
				end
				if propertyChange.WeaponProperty == "ChargeTime" then
					RunWeaponMethod({ Id = unit.ObjectId, Weapon = weaponName, Method = "cancelCharge" })
				end
				--mod start
				if propertyChange.WeaponProperty == "ActiveReloadTime" then
					if weaponName == "GunWeapon" then
						WeaponData.GunWeapon.ActiveReloadTime = changeValue
					end
				end
				--mod end
				end
				if propertyChange.ProjectileProperty ~= nil then
					SetProjectileProperty({ WeaponName = weaponName, ProjectileName = propertyChange.ProjectileName, ExcludeProjectileName = propertyChange.ExcludeProjectileName, DestinationId = unit.ObjectId, Property = propertyChange.ProjectileProperty, Value = changeValue, ValueChangeType = propertyChange.ChangeType })
				end
				if propertyChange.EffectProperty ~= nil then
					SetEffectProperty({ WeaponName = weaponName, EffectName = propertyChange.EffectName, DestinationId = unit.ObjectId, Property = propertyChange.EffectProperty, Value = changeValue, ValueChangeType = propertyChange.ChangeType })
				end

				local linkedWeapons = WeaponSets.LinkedWeaponUpgrades[weaponName]
				if linkedWeapons and not propertyChange.ExcludeLinked then
					for k, linkedWeaponName in pairs( linkedWeapons ) do
						--DebugPrint({ Text = "Applying linked upgrade to "..linkedWeaponName, LogOnly = true })
						ApplyWeaponPropertyChange( unit, linkedWeaponName, propertyChange, reverse )
					end
				end
			end
		end
		if PAB.Config.Gameplay.ExtraHammers.BowChainPerfectShotTrait.Enabled then
            local config = PAB.Config.Gameplay.ExtraHammers.BowChainPerfectShotTrait
            WeaponData.BowWeapon.Combo = true
            WeaponData.BowWeaponDash.Combo = true
            ModUtil.Path.Wrap("CheckComboPowers", function (baseFunc, victim, attacker, triggerArgs, sourceWeaponData)
                baseFunc(victim, attacker, triggerArgs, sourceWeaponData)
                if sourceWeaponData.Combo and HeroHasTrait("BowChainPerfectShotTrait") then
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
            end)

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