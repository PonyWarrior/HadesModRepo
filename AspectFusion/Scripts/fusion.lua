if AspectFusion.Config.Enabled then
local mod = "AspectFusion"
local package = "AspectFusion"
ModUtil.Path.Wrap( "SetupMap", function(baseFunc)
    DebugPrint({Text = "@"..mod.." Trying to load package "..package..".pkg"})
    LoadPackages({Name = package})
    return baseFunc()
end)

AspectFusion.Data =
{
    SoulThresholds =
    {
        {
            Threshold = 20,
            EnablePull = true,
            PullCount = 1,
            PullRange = 400
        },
        {
            Threshold = 40,
            PullCount = 1,
            PullRange = 100,
        },
        {
            Threshold = 50,
            IncreaseHeroMaxHealth = true
        },
        {
            Threshold = 60,
            PullCount = 1,
            PullRange = 100,
        },
        {
            Threshold = 80,
            EnableExplosion = true,
            ExplosionDamage = 50,
            ExplosionRadius = 200,
        },
        {
            Threshold = 100,
            IncreaseHeroMaxHealth = true
        },
        {
            Threshold = 120,
            ExplosionDamage = 25,
            ExplosionRadius = 100,
        },
        {
            Threshold = 150,
            IncreaseHeroMaxHealth = true
        },
        {
            Threshold = 160,
            ExplosionDamage = 25,
            ExplosionRadius = 100,
        },
        {
            Threshold = 200,
            ExplosionDamage = 25,
            IncreaseHeroMaxHealth = true
        },
        {
            Threshold = 240,
            ExplosionDamage = 25,
        },
        {
            Threshold = 250,
            IncreaseHeroMaxHealth = true
        },
    }
}

local FusionData = AspectFusion.Data

local DoNotReload =
{
    HadesShoutTrait = true,
    FastClearDodgeBonusTrait = true,
    PerfectClearDamageBonusTrait = true,
    RoomRewardMaxHealthTrait = true,
    RoomRewardEmptyMaxHealthTrait = true
}

OnAnyLoad{ function (triggerArgs)
    if CurrentDeathAreaRoom ~= nil and CurrentDeathAreaRoom.Name == "RoomPreRun" then
        if not TextLinesRecord["UltraSwordUnlocked"] and AspectFusion.CalculateBloodInvestment("SwordWeapon") >= 51 then
            TextLinesRecord["UltraSwordUnlocked"] = true
        end
        if not TextLinesRecord["UltraSpearUnlocked"] and AspectFusion.CalculateBloodInvestment("SpearWeapon") >= 51 then
            TextLinesRecord["UltraSpearUnlocked"] = true
        end
        if not TextLinesRecord["UltraShieldUnlocked"] and AspectFusion.CalculateBloodInvestment("ShieldWeapon") >= 51 then
            TextLinesRecord["UltraShieldUnlocked"] = true
        end
        if not TextLinesRecord["UltraBowUnlocked"] and AspectFusion.CalculateBloodInvestment("BowWeapon") >= 51 then
            TextLinesRecord["UltraBowUnlocked"] = true
        end
        if not TextLinesRecord["UltraFistUnlocked"] and AspectFusion.CalculateBloodInvestment("FistWeapon") >= 51 then
            TextLinesRecord["UltraFistUnlocked"] = true
        end
        if not TextLinesRecord["UltraGunUnlocked"] and AspectFusion.CalculateBloodInvestment("GunWeapon") >= 51 then
            TextLinesRecord["UltraGunUnlocked"] = true
        end
    end
end}

function AspectFusion.CalculateBloodInvestment(weaponName)
    local totalInvestment = 0
    for index in pairs( WeaponUpgradeData[weaponName] ) do
        for level = 1, (GetWeaponUpgradeLevel( weaponName, index )) do
            totalInvestment = totalInvestment + (WeaponUpgradeData[weaponName][index].Costs[level] or 0)
        end
    end
    return totalInvestment
end

function AspectFusion.ReloadAllTraits()
    -- Modified ReloadAllTraits
	local weaponName = GetEquippedWeapon()
	local removedTraitData = {}
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
        if DoNotReload[traitData.Name] ~= true and traitData.Slot ~= "Assist" and traitData.Slot ~= "Keepsake" and not string.match(traitData.Name, "Chaos") then
            table.insert(removedTraitData, { Name = traitData.Name, Rarity = traitData.Rarity })
            DebugPrint({Text = "Reloading trait" .. traitData.Name })
        end
	end

	for i, traitData in pairs(removedTraitData) do
		RemoveTrait( CurrentRun.Hero, traitData.Name )
	end
	-- re-equip all weapons to flush Absolute change values

	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = weaponName })
	local weaponSetNames = WeaponSets.HeroWeaponSets[weaponName]
	if weaponSetNames ~= nil then
		for k, linkedWeaponName in pairs( weaponSetNames ) do
			UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = linkedWeaponName })
		end
	end
	UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RangedWeapon "})


	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = weaponName })
	if weaponSetNames ~= nil then
		for k, linkedWeaponName in pairs( weaponSetNames ) do
			EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = linkedWeaponName })
		end
	end
	EquipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = "RangedWeapon" })


	for i, traitData in pairs(removedTraitData) do
		if traitData.Name then
			if traitData.Rarity then
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity}) })
			else
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name }) })
			end
		end
	end
	UpdateHeroTraitDictionary()
	DebugPrint({Text = "Finished reloading "})
end

-- Ultra sword
OnWeaponFired{ "SwordParry",
	function( triggerArgs )
		if HeroHasTrait("UltraSwordTrait") then
			AddLimitedWeaponBonus({ AsCrit = true, EffectName = "SwordPostParryCritical", Amount = 100, CritBonus = GetTotalHeroTraitValue("SwordPostParryCriticalAmount")})
		end
	end
}

-- Ultra Fists

ModUtil.Path.Wrap("CheckComboPowers", function (baseFunc, victim, attacker, triggerArgs, sourceWeaponData )
    baseFunc(victim, attacker, triggerArgs, sourceWeaponData)
    if sourceWeaponData == nil or sourceWeaponData.ComboPoints == nil or sourceWeaponData.ComboPoints <= 0 then
		return
	end

	if triggerArgs.EffectName ~= nil then
		-- Effects never generate combo points for now
		return
	end

	if victim.NoComboPoints then
		return
	end

    if not HeroHasTrait( "UltraFistTrait" ) then
		return
	end

    if ScreenAnchors.ComboUI == nil then
        thread(AspectFusion.ShowComboUI)
    end

	attacker.ComboCount = (attacker.ComboCount or 0) + sourceWeaponData.ComboPoints

	if attacker.ComboCount >= attacker.ComboThreshold and not attacker.ComboReady then
		attacker.ComboReady = true
        attacker.UltraComboReady = true
		SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "NumProjectiles", Value = 2 + GetTotalHeroTraitValue("BonusSpecialHits") })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "NumProjectiles", Value = 1 + GetTotalHeroTraitValue("BonusSpecialHits") })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		SetWeaponProperty({ WeaponName = "FistWeaponSpecialDash", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })

		ComboReadyPresentation( attacker, triggerArgs )
	end
	thread( AspectFusion.UpdateComboUI )

end)

ModUtil.Path.Wrap("CheckComboPowerReset", function (baseFunc, attacker, weaponData, args)
	if weaponData ~= nil and attacker.UltraComboReady then
        thread(AspectFusion.DeactiveUltraCombo)
    end
    baseFunc(attacker, weaponData, args)
    thread(AspectFusion.UpdateComboUI)
end)

function AspectFusion.ShowComboUI()
    if not CurrentRun.Hero.Weapons.FistWeapon then
		return
	end
    if ScreenAnchors.ComboUI ~= nil then
		return
	end
	ScreenAnchors.ComboUI = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", X = GunUI.StartX, Y = GunUI.StartY })

	local offsetX = 20
	CreateTextBox(MergeTables({ Id = ScreenAnchors.ComboUI, OffsetX = 0, OffsetY = -2,
			Font = "AlegreyaSansSCBold", FontSize = 24, ShadowRed = 0.1, ShadowBlue = 0.1, ShadowGreen = 0.1,
			OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 1,
			ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left",},
			LocalizationData.UIScripts.GunUI ))
	thread( AspectFusion.UpdateComboUI )

	FadeObstacleIn({ Id = ScreenAnchors.ComboUI, Duration = CombatUI.FadeInDuration, IncludeText = true, Distance = CombatUI.FadeDistance.Ammo, Direction = 0 })

end

function AspectFusion.UpdateComboUI()
	local comboData =
	{
		Current = CurrentRun.Hero.ComboCount,
		Maximum = 12
	}

	if comboData.Current == nil then
		return
	end
    comboData.Current = Clamp(comboData.Current, 0, comboData.Maximum)

    local text = comboData.Current.."/"..comboData.Maximum

	PulseText({ ScreenAnchorReference = "ComboUI", ScaleTarget = 1.04, ScaleDuration = 0.05, HoldDuration = 0.05, PulseBias = 0.02 })
	if comboData.Current < 12 then
		ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = text, Color = Color.White, ColorDuration = 0.04 })
	else
		ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = text, Color = Color.LightBlue, ColorDuration = 0.04 })
	end

	ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = text, FadeTarget = 1 })
	-- ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = "UI_GunText", OffsetY = -2, LuaKey = "TempTextData", LuaValue = comboData, AutoSetDataProperties = false, })
	ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = text, OffsetY = -2 })
end

function AspectFusion.HideComboUI()
	if ScreenAnchors.ComboUI == nil then
		return
	end

	local id = ScreenAnchors.ComboUI
	HideObstacle({ Id = id, IncludeText = true, Distance = CombatUI.FadeDistance.Ammo, Angle = 180, Duration = CombatUI.FadeDuration, SmoothStep = true })

	ScreenAnchors.ComboUI = nil

	wait( CombatUI.FadeDuration , RoomThreadName)
	Destroy({ Id = id })
	ModifyTextBox({ Id = id, FadeTarget = 0, FadeDuration = 0, AutoSetDataProperties = false, })
end

ModUtil.Path.Wrap("ShowCombatUI", function (baseFunc, flag)
    baseFunc(flag)
    if CurrentDeathAreaRoom == nil or not CurrentDeathAreaRoom.ShowResourceUIOnly then
		AspectFusion.ShowComboUI()
	end
end)

ModUtil.Path.Wrap("HideCombatUI", function (baseFunc, flag, args)
    baseFunc(flag, args)
	thread(AspectFusion.HideComboUI)
end)

ModUtil.Path.Wrap("EquipPlayerWeaponPresentation", function (baseFunc, weaponData, args)
    baseFunc(weaponData, args)
    if weaponData.ComboPoints ~= nil then
        thread(AspectFusion.ShowComboUI)
    else
	    thread(AspectFusion.HideComboUI)
    end
end)

function AspectFusion.DeactiveUltraCombo()
    wait(0.1)
    CurrentRun.Hero.UltraComboReady = false
end

ModUtil.Path.Wrap("SetupHeroObject", function (baseFunc, currentRun, applyLuaUpgrades )
    baseFunc(currentRun, applyLuaUpgrades )
    CurrentRun.Hero.UltraComboReady = false
end)

ModUtil.Path.Wrap("UpdateRuptureEffectStacks", function (baseFunc, args)
    if CurrentRun.Hero.UltraComboReady then
        -- CurrentRun.Hero.UltraComboReady = false
        local unitId = args.triggeredById
        local unit = args.TriggeredByTable
        local startIconScale = 1.3

        if not EnemyHealthDisplayAnchors[unitId] then
            CreateHealthBar( unit )
            UpdateHealthBar( unit, 0, { Force = true })
        end
    
        if not EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ] then
    
            local backingId = nil
            local scale = 1
            if unit.BarXScale then
                scale = unit.BarXScale
            end
            if unit and unit.UseBossHealthBar then
                backingId = CreateScreenObstacle({ Name = "UltraRuptureSmall", Group = "Combat_Menu", DestinationId = EnemyHealthDisplayAnchors[unitId] })
                startIconScale = 1.3
                CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 17, OffsetY = 0,
                    Font = "AlegreyaSansSCExtraBold",
                    Justification = "Left",
                    ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
                    OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
                })
            else
                backingId = SpawnObstacle({ Name = "UltraRuptureSmall", Group = "Combat_UI_World", DestinationId = unitId, TriggerOnSpawn = false })
                CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 12, OffsetY = 0,
                    Font = "AlegreyaSansSCExtraBold",
                    Justification = "Left",
                    ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
                    OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
                })
            end
            EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ] = backingId
        end
        
        local scaleTarget = 1.0
        SetScale({ Id = EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ], Fraction = startIconScale })
    
        PositionEffectStacks( unitId )
    else
        baseFunc(args)
    end
end)

ModUtil.Path.Wrap("OnRuptureDashHit", function (baseFunc, args)
    if HeroHasTrait("UltraFistTrait") and CurrentRun.Hero.UltraComboReady then
        -- CurrentRun.Hero.UltraComboReady = false
        local victim = args.TriggeredByTable
        if victim.TriggersOnDamageEffects and victim ~= CurrentRun.Hero then
            if not victim.ActiveEffects or not victim.ActiveEffects.UltraMarkRuptureTarget  then
                ApplyEffectFromWeapon({ WeaponName = "UltraMarkRuptureApplicator", EffectName = "UltraMarkRuptureTarget", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId })
            end
        end
    else
        baseFunc(args)
    end
end)

ModUtil.Path.Wrap("OnRuptureWeaponHit", function (baseFunc, args)
    if HeroHasTrait("UltraFistTrait") and CurrentRun.Hero.UltraComboReady then
        -- CurrentRun.Hero.UltraComboReady = false
        local victim = args.TriggeredByTable
        if victim.TriggersOnDamageEffects and victim ~= CurrentRun.Hero then
            if not victim.ActiveEffects or not victim.ActiveEffects.UltraMarkRuptureTarget  then
                ApplyEffectFromWeapon({ WeaponName = "UltraMarkRuptureApplicator", EffectName = "UltraMarkRuptureTarget", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId })
            end
        end
    else
        baseFunc(args)
    end
end)

ModUtil.Path.Override("EnemyHandleInvisibleAttack", function(enemy, weaponAIData, currentRun, args)
    args = args or {}
	if enemy.IsInvisible and not weaponAIData.KeepInvisibility then
		if enemy.CurrentPhase ~= nil and enemy.CurrentPhase >= 2 and enemy.Phase2VFX ~= nil then
  			CreateAnimation({ Name = enemy.Phase2VFX, DestinationId = enemy.ObjectId })
		end
  	
		SetLifeProperty({ DestinationId = enemy.ObjectId, Property = "InvulnerableFx", Value = "Invincibubble_Hades" })
		enemy.IsInvisible = false
		CreateHealthBar( enemy )
		UpdateHealthBar( enemy, 0, { Force = true })

		if enemy.ActiveEffects and enemy.ActiveEffects.MarkRuptureTarget then
			UpdateRuptureEffectStacks({ TriggeredByTable = enemy, triggeredById = enemy.ObjectId })
		end
        --mod start
        if enemy.ActiveEffects and enemy.ActiveEffects.UltraMarkRuptureTarget then
			UpdateRuptureEffectStacks({ TriggeredByTable = enemy, triggeredById = enemy.ObjectId })
		end
        --mod end
		if enemy.InvisibilityEndSound ~= nil then
			PlaySound({ Name = enemy.InvisibilityEndSound })
		end
		SetUnitVulnerable( enemy )
		SetAlpha({ Id = enemy.ObjectId, Fraction = 1.0, Duration = weaponAIData.InvisibilityFadeInDuration })
		SetColor({ Id = enemy.ObjectId, Color = { 255, 255, 255, 255 }, Duration = weaponAIData.InvisibilityFadeInDuration })
		if args.CreateAnimation then
			CreateAnimation({ Name = args.CreateAnimation, DestinationId = enemy.ObjectId })
		end
		if args.Animation then
			CreateAnimation({ Name = args.Animation, DestinationId = enemy.ObjectId })
		end
		SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "CollideWithUnits", Value = true })
		SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "ImmuneToStun", Value = enemy.PreInvisibilityImmuneToStun })
		SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsProjectiles", Value = true })
		enemy.SkipInvulnerableOnHitPresentation = false
		wait( CalcEnemyWait( enemy, weaponAIData.InvisibilityFadeInDuration ), enemy.AIThreadName )
	end
end)

ModUtil.Path.Wrap("CheckFistDetonation", function (baseFunc, victim, functionArgs, triggerArgs)
    if ( not victim.ActiveEffects or not victim.ActiveEffects.UltraMarkRuptureTarget ) and triggerArgs.SourceWeapon == "FistWeaponSpecialDash" and CurrentRun.Hero.UltraComboReady then
        thread(AspectFusion.ApplyUltraMark, triggerArgs)
        victim.UltraMarked = true
        local delay = 0.1
		MapState.QueuedDetonations = MapState.QueuedDetonations  or {}
		while MapState.QueuedDetonations[_worldTime + delay ] and delay < 2 do
			delay = delay + 0.1
		end
		local key = _worldTime + delay
		MapState.QueuedDetonations[_worldTime + delay] = victim
		wait( delay, RoomThreadName )
		FireWeaponFromUnit({ Weapon = "UltraFistDetonationWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true, AutoEquip = true })
		MapState.QueuedDetonations[key] = nil
		victim.LastRuptureTime = _worldTime
    elseif ( not victim.ActiveEffects or not victim.ActiveEffects.UltraMarkRuptureTarget ) and not victim.UltraMarked then
        baseFunc(victim, functionArgs, triggerArgs)
	end
end)

function AspectFusion.ApplyUltraMark(triggerArgs)
    UpdateRuptureEffectStacks( triggerArgs )
    wait(4)
    AspectFusion.ClearUltraMark(triggerArgs)
end

function AspectFusion.ClearUltraMark(triggerArgs)
    local victim = triggerArgs.TriggeredByTable
	StopAnimation({ Name = "PoseidonAresProjectileGlow", DestinationId = victim.ObjectId })
    victim.UltraMarked = false
	ClearRuptureEffectStacks( triggerArgs )
end

ModUtil.Path.Wrap("CheckVacuumNearbyEnemy", function (baseFunc, weaponData, args)
    if HeroHasTrait("UltraFistTrait") then
        local nearestEnemyTargetIds = GetClosestIds({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = args.Range, MaximumCount = 99 })
        for _, targetId in ipairs(nearestEnemyTargetIds) do
            if targetId ~= 0 and ActiveEnemies[targetId] ~= nil and not ActiveEnemies[targetId].IsDead then
                local distanceBuffer = args.DistanceBuffer
                if CurrentRun.Hero.VacuumRush then
                    distanceBuffer = args.RushDistanceBuffer
                end
                ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, CurrentRun.Hero.ObjectId, -1 * distanceBuffer ), Angle = GetAngleBetween({ Id = targetId, DestinationId = CurrentRun.Hero.ObjectId }) })
                FireWeaponFromUnit({ Weapon = "FistSpecialVacuum", Id = CurrentRun.Hero.ObjectId, DestinationId = targetId })
                FistVacuumPullPresentation( targetId, args )
            end
        end
    else
        baseFunc(weaponData, args)
    end
end)

-- Ultra Shield
ModUtil.Path.Wrap("ShieldFireClear", function (baseFunc, triggerArgs, args)
    baseFunc(triggerArgs, args)
    if HeroHasTrait("UltraShieldTrait") and CurrentRun.CurrentRoom.LoadedAmmo and CurrentRun.CurrentRoom.LoadedAmmo > 0 and triggerArgs.name == "ShieldWeaponRush" and CurrentRun.Hero.StoredAmmo and CurrentRun.CurrentRoom.LoadedAmmo then
		local numAmmo = CurrentRun.CurrentRoom.LoadedAmmo
		if HeroHasTrait("ShieldLoadAmmo_ZeusRangedTrait" ) then
			local targetId = SpawnObstacle({ Name = "InvisibleTarget", Group = "Scripting", LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY })
			for i = 1, numAmmo do
				thread(FireWeaponWithinRange, { SourceId = targetId, Range = 350, SeekTarget = true, WeaponName = "ZeusShieldLoadAmmoStrike", InitialDelay = 0.1 * i, Delay = 0.25, Count = 1, BonusChance = GetTotalHeroTraitValue("BonusBolts") })
			end
			thread( DestroyOnDelay, { targetId }, 3 )
		end
		
		thread( UnloadAmmoThread, { Count = numAmmo , Attacker = CurrentRun.Hero, Angle = GetAngle({Id = CurrentRun.Hero.ObjectId}), LocationX = triggerArgs.LocationX, LocationY = triggerArgs.LocationY, Interval = args.Interval })
		
		while numAmmo  > 0 do
			for i, ammoData in pairs( CurrentRun.Hero.StoredAmmo ) do
				if ammoData.WeaponName == "SelfLoadAmmoApplicator" then
					local ammoAnchors = ScreenAnchors.SelfStoredAmmo
					if ammoAnchors ~= nil and ammoAnchors[#ammoAnchors] ~= nil then
						Destroy({ Id = ammoAnchors[#ammoAnchors] })
						ammoAnchors[#ammoAnchors] = nil
					end
					CurrentRun.Hero.StoredAmmo[i] = nil
					break
				end
			end
			numAmmo  = numAmmo  - 1
		end
		CurrentRun.Hero.StoredAmmo = CollapseTable( CurrentRun.Hero.StoredAmmo )

		thread(MarkObjectiveComplete, "BeowulfTackle")
		ShieldFireClearPresentation( triggerArgs )
	end
end)

OnWeaponFired{ "ShieldWeaponRush",
	function(triggerArgs)
		-- SetPlayerPhasing("ShieldWeaponRush")
		if HeroHasTrait("UltraShieldTrait") then
			FireWeaponFromUnit({ Weapon = "ShieldThrowProjectileBonusApplicator", Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId })
		end
		if HeroHasTrait("UltraShieldTrait") then

			local parentTrait = nil
			for i, traitData in pairs( CurrentRun.Hero.Traits ) do
				if traitData.Name == "UltraShieldTrait" then
					parentTrait = traitData
					break
				end
			end
			SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = "Scale", Value = 1 })
			SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = "ExtentScale", Value = 1 })

			local parentAnimData = parentTrait.AnimDefinitions.Default
			for traitName, animData in pairs( parentTrait.AnimDefinitions ) do
				if traitName == "Default" or HeroHasTrait(traitName) then
					parentAnimData = animData
				end
			end
			if parentAnimData and parentAnimData.Unloaded then
				for changeKey, changeValue in pairs( parentAnimData.Unloaded ) do
					SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = changeKey, Value = changeValue })
				end
			end
		end
	end
}

ModUtil.Path.Wrap("SelfLoadAmmo", function (baseFunc)
    baseFunc()
	if not CurrentRun.CurrentRoom.LoadedAmmo or not HeroHasTrait( "UltraShieldTrait" ) then
		return
	end

	PlaySound({ Name = "/Leftovers/SFX/HarpDash", Id = CurrentRun.Hero.ObjectId })
	thread( PlayVoiceLines, HeroVoiceLines.LoadingAmmoVoiceLines, true )

	if ScreenAnchors.AmmoIndicatorUI then
		local offsetX = 380
		local offsetY = -50
		ScreenAnchors.SelfStoredAmmo =  ScreenAnchors.SelfStoredAmmo or {}
		offsetX = offsetX + ( #ScreenAnchors.SelfStoredAmmo * 22 )
		local screenId = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", DestinationId = ScreenAnchors.HealthBack, X = 10 + offsetX, Y = ScreenHeight - 50 + offsetY })
		SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = screenId })
		table.insert( ScreenAnchors.SelfStoredAmmo, screenId )
		SetAnimation({ Name = "SelfStoredAmmoIcon", DestinationId = screenId })
	end

	CurrentRun.CurrentRoom.LoadedAmmo = CurrentRun.CurrentRoom.LoadedAmmo + 1
	CurrentRun.Hero.StoredAmmo = CurrentRun.Hero.StoredAmmo or {}

	local storedAmmoData =
	{
		Count = 1,
		ForceMin = 300,
		ForceMax = 500,
		AttackerId = CurrentRun.Hero.ObjectId,
		WeaponName = "SelfLoadAmmoApplicator",
		Id = _worldTime
	}
	table.insert( CurrentRun.Hero.StoredAmmo, storedAmmoData )
	thread( UpdateAmmoUI )

	-- Changes to extents
	local parentTrait = nil
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		if traitData.Name == "UltraShieldTrait" then
			parentTrait = traitData
			break
		end
	end

	if parentTrait then
		local loadedRushScale = parentTrait.BaseLoadedRushScale
		local loadedRushRarityMultiplier = ( GetRarityValue(parentTrait.Rarity) * parentTrait.LoadedRushRarityMultiplier )
		SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = "Scale", Value =  1 + ( loadedRushScale - 1 ) * loadedRushRarityMultiplier })
		SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = "ExtentScale", Value = 1 + ( loadedRushScale - 1 ) * loadedRushRarityMultiplier })


		local parentAnimData = parentTrait.AnimDefinitions.Default
		for traitName, animData in pairs( parentTrait.AnimDefinitions ) do
			if traitName == "Default" or HeroHasTrait(traitName) then
				parentAnimData = animData
			end
		end
		if parentAnimData and parentAnimData.Loaded then
			for changeKey, changeValue in pairs( parentAnimData.Loaded ) do
				SetProjectileProperty({ WeaponName = "ShieldWeaponRush", DestinationId = CurrentRun.Hero.ObjectId, Property = changeKey, Value = changeValue })
			end
		end
	end
end, AspectFusion)

OnWeaponFailedToFire{ function( triggerArgs )
		local attacker = triggerArgs.TriggeredByTable
		local weaponData = GetWeaponData( attacker, triggerArgs.name )

		if weaponData == nil then
			return
		end

		if weaponData.RecallWeaponsOnFailToFire then
            for _, recallWeaponName in pairs (weaponData.RecallWeaponsOnFailToFire) do
			    RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = recallWeaponName, Method = "RecallProjectiles" })
            end
		end

	end}

-- ultra bow

function AspectFusion.ArrowRain(markId)
    while CurrentRun.CurrentRoom.LastMarkedTargetId == markId do
        local offsetX = RandomFloat( -200, 200 )
        local offsetY = RandomFloat( -200, 200 )
        local targetId =  SpawnObstacle({ Name = "BlankObstacle", DestinationId = markId, OffsetX = offsetX, OffsetY = offsetY })
        FireWeaponFromUnit({ Weapon = "UltraBowRain", Id = CurrentRun.Hero.ObjectId, DestinationId = targetId, FireFromTarget = true, AutoEquip = true })
        local rubbleWait = RandomFloat( 0.16, 0.32 )
        wait( rubbleWait )
    end
end

ModUtil.Path.Wrap("MarkTargetApply", function (baseFunc, triggerArgs)
    if HeroHasTrait("UltraBowTrait") and not triggerArgs.Reapplied then
            if CurrentRun.CurrentRoom.LastMarkedTargetId ~= nil then
                ClearEffect({ Id = CurrentRun.CurrentRoom.LastMarkedTargetId, Name = "MarkTarget" })
                BlockEffect({ Id = CurrentRun.CurrentRoom.LastMarkedTargetId, Name = "MarkTarget", Duration = 0.1 })
            end
            CurrentRun.CurrentRoom.LastMarkedTargetId = triggerArgs.triggeredById
            SetWeaponProperty({ WeaponName = "BowSplitShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "OverrideFireRequestTarget", Value = triggerArgs.triggeredById, DataValue = false})
            --fff
            SetProjectileProperty({ WeaponName = "BowSplitShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "UseStartLocation", Value = false })
            -- thread(AspectFusion.ArrowRain, triggerArgs.triggeredById)
    elseif not triggerArgs.Reapplied then
    DebugPrint({Text="fuck"})

        baseFunc(triggerArgs)
    end
end)

ModUtil.Path.Wrap("MarkTargetClear", function (baseFunc, triggerArgs)
    if HeroHasTrait("UltraBowTrait") then
        SetWeaponProperty({ WeaponName = "BowSplitShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "OverrideFireRequestTarget", Value = -1, DataValue = false})
        SetProjectileProperty({ WeaponName = "BowSplitShot", DestinationId = CurrentRun.Hero.ObjectId, Property = "UseStartLocation", Value = true })
        -- CurrentRun.CurrentRoom.LastMarkedTargetId = nil
    else
        baseFunc(triggerArgs)
    end
end)

ModUtil.Path.Wrap("DamageEnemy", function (baseFunc, victim, triggerArgs )
    baseFunc(victim, triggerArgs )
    local sourceWeaponData = triggerArgs.AttackerWeaponData
	local attacker = triggerArgs.AttackerTable
    if sourceWeaponData ~= nil and HeroHasTrait("UltraBowTrait") and not triggerArgs.PureDamage and not IsEmpty(ActiveEnemies) and ( not victim.SkipModifiers or victim.BondAlwaysApplies) then
		local shareData = GetHeroTraitValues("BondDamageShareData")[1]
		local enemyIds = GetAllKeys( ActiveEnemies )
		for index, id in pairs(enemyIds) do
			local enemy = ActiveEnemies[id]
			if enemy and not enemy.IsDead and IsEmpty( enemy.InvulnerableFlags ) and IsEmpty ( enemy.PersistentInvulnerableFlags )
				and enemy.ActiveEffects and enemy.ActiveEffects.MarkBondTarget and Contains(shareData.WeaponNames, sourceWeaponData.Name ) and not triggerArgs.EffectName then
				local damageAmount = triggerArgs.DamageAmount * shareData.Multiplier
				if HeroData.DefaultHero.HeroAlliedUnits[ enemy.Name ] and shareData.AlliedDamageMultiplier then
					damageAmount = damageAmount * shareData.AlliedDamageMultiplier
				end
				Damage( enemy, { EffectName = "DamageShare", DamageAmount = damageAmount, Silent = false, PureDamage = true } )
			end
		end
	end
end)

ModUtil.Path.Wrap("LoadAmmo", function (baseFunc)
    baseFunc()
    if not CurrentRun.CurrentRoom.LoadedAmmo or not HeroHasTrait( "UltraBowTrait" ) then
		return
	end

	CurrentRun.CurrentRoom.ValidVolleys = CurrentRun.CurrentRoom.ValidVolleys or {}
	local currentBowVolley = GetWeaponProperty({ Id = CurrentRun.Hero.ObjectId, WeaponName = "BowWeapon", Property = "Volley" }) or 0
	local currentBowDashVolley = GetWeaponProperty({ Id = CurrentRun.Hero.ObjectId, WeaponName = "BowWeaponDash", Property = "Volley" }) or 0
	local nextLoadedAmmoVolley = 0

	for i, value in pairs( CurrentRun.CurrentRoom.ValidVolleys ) do
		if value.BowWeapon == currentBowVolley + 1 and value.BowWeaponDash == currentBowDashVolley + 1 then
			nextLoadedAmmoVolley = nextLoadedAmmoVolley + 1
		end
	end

	PlaySound({ Name = "/Leftovers/SFX/HarpDash", Id = CurrentRun.Hero.ObjectId })
	thread( PlayVoiceLines, HeroVoiceLines.LoadingAmmoVoiceLines, true )
		if ScreenAnchors.AmmoIndicatorUI then
		local offsetX = 380
		local offsetY = -50
		ScreenAnchors.SelfStoredAmmo =  ScreenAnchors.SelfStoredAmmo or {}
		offsetX = offsetX + ( #ScreenAnchors.SelfStoredAmmo * 22 )
		local screenId = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", DestinationId = ScreenAnchors.HealthBack, X = 10 + offsetX, Y = ScreenHeight - 50 + offsetY })
		SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = screenId })
		table.insert( ScreenAnchors.SelfStoredAmmo, screenId )
		SetAnimation({ Name = "SelfStoredAmmoIcon", DestinationId = screenId })
	end

	local storedAmmoData =
	{
		Count = 1,
		ForceMin = 300,
		ForceMax = 500,
		AttackerId = CurrentRun.Hero.ObjectId,
		WeaponName = "SelfLoadAmmoApplicator",
		Id = _worldTime
	}
	CurrentRun.Hero.StoredAmmo = CurrentRun.Hero.StoredAmmo or {}
	table.insert( CurrentRun.Hero.StoredAmmo, storedAmmoData )
	thread( UpdateAmmoUI )


	if nextLoadedAmmoVolley < CurrentRun.CurrentRoom.MaxLoadedAmmo then
		IncrementTableValue( CurrentRun.CurrentRoom, "LoadedAmmo" )
		table.insert( CurrentRun.CurrentRoom.ValidVolleys,
		{
			BowWeapon = currentBowVolley + 1,
			BowWeaponDash = currentBowDashVolley + 1,
		})
		thread( UpdateAmmoUI )
	else
		thread( InCombatText, CurrentRun.Hero.ObjectId, "CombatText_MaxLoaded" )
		RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "RangedWeapon", Method = "AddAmmo", Parameters = { 1 } })
	end
end)

-- ultra gun
ModUtil.Path.Wrap("DashManeuver", function (baseFunc, duration)
    if CurrentRun.Hero.RallyHealth.RallyActive and CurrentRun.Hero.RallyHealth.RallyHealOnDash and not CurrentRun.Hero.IsDead then
		if CurrentRun.Hero.RallyHealth.Store > 0 then
			rallyHeal = round( CurrentRun.Hero.RallyHealth.Store )
			CurrentRun.Hero.RallyHealth.Store = CurrentRun.Hero.RallyHealth.Store - rallyHeal
			Heal( CurrentRun.Hero, { HealAmount = rallyHeal, SourceName = "RallyHeal", Silent = false } )
			RallyHealPresentation()
			thread( UpdateHealthUI )
		end
	end

	if HeroHasTrait("UltraGunTrait") then
		return
	end
    baseFunc(duration)
end)

ModUtil.Path.Wrap("ManualReload", function (baseFunc, attacker)
    if HeroHasTrait("UltraGunTrait") then
        if not IsInputAllowed({}) then
            return
        end
    
        if attacker.ActiveEffects then
            for effectName in pairs(attacker.ActiveEffects) do
                if EffectData[effectName] and EffectData[effectName].BlockReload then
                    return
                end
            end
        end
    
        if CurrentDeathAreaRoom == nil and CurrentRun and CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.DisableWeaponsExceptDash then
            return
        end
    
        for weaponName, v in pairs( attacker.Weapons ) do
            local weaponData = GetWeaponData( attacker, weaponName)
            if weaponData ~= nil and weaponData.ActiveReloadTime ~= nil then
                if attacker.Reloading then
                    ReloadFailedMidReloadPresentation( attacker, weaponData )
                    return
                end
    
                thread( MarkObjectiveComplete, "GunWeaponManualReload" )
                ReloadGun( attacker, weaponData )
    
                thread( MarkObjectiveComplete, "ManualReload" )
                ApplyEffectFromWeapon({ Id = CurrentRun.Hero.ObjectId, DestinationId = CurrentRun.Hero.ObjectId, WeaponName = "ManualReloadEffectApplicator", EffectName = "ManualReloadBonus" })
                return
            end
        end
    else
        baseFunc(attacker)
    end
end)

ModUtil.Path.Wrap("ManualReloadBonusApply", function (baseFunc, triggerArgs)
    if HeroHasTrait("UltraGunTrait") then
        AddOnFireWeapons( CurrentRun.Hero, "GunWeapon" , { LegalOnFireWeapons = {"GunWeapon"}, AddOnFireWeapons = { "UltraSniperGunWeapon" }} )
    else
        baseFunc(triggerArgs)
    end
end)

OnWeaponFired{ "UltraSniperGunWeapon",
	function( triggerArgs )
        -- hacky but it does the job
        RemoveOnFireWeapons( CurrentRun.Hero, { LegalOnFireWeapons = {"GunWeapon"}, AddOnFireWeapons = { "UltraSniperGunWeapon" }} )
        AddOnFireWeapons( CurrentRun.Hero, "GunWeapon" , { LegalOnFireWeapons = {"GunWeapon"}, AddOnFireWeapons = { "UltraGunWeapon" }} )
	end
}

ModUtil.Path.Wrap("ShowGunUI", function (baseFunc, gunData)
    baseFunc(gunData)
    if HeroHasTrait( "UltraGunTrait" ) then
		SetAnimation({ Name = "GunLaserIndicatorIcon", DestinationId = ScreenAnchors.GunUI})
    end
end)

ModUtil.Path.Wrap("UpdateGunUI", function (baseFunc, triggerArgs)
    baseFunc(triggerArgs)
    if HeroHasTrait( "UltraGunTrait" ) then
		SetAnimation({ Name = "GunLaserIndicatorIcon", DestinationId = ScreenAnchors.GunUI})
    end
end)

ModUtil.Path.Wrap("ReloadPresentationComplete", function (baseFunc, attacker, weaponData, state )
    if HeroHasTrait("UltraGunTrait") then
        Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 6, MinFraction = 0, MaxFraction = 1, Color = Color.White, Duration = 0.15, ExpireAfterCycle = false })
        StopSound({ Id = state.ReloadSoundId, Duration = 0.2 })
        PlaySound({ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlashLucifer", Id = CurrentRun.Hero.ObjectId })
        PlaySound({ Name = "/SFX/Menu Sounds/ObjectiveActivateShk2", Id = state.GunReloadDisplayId })
        CreateAnimation({ Name="GunReloadIndicatorComplete", DestinationId = state.GunReloadDisplayId, GroupName="Combat_UI" })
        Destroy({ Id = state.GunReloadDisplayId })
        thread( PlayVoiceLines, HeroVoiceLines.GunWeaponReloadCompleteVoiceLines, true )
    else
        baseFunc(attacker, weaponData, state )
    end
end)

--Necessary to prevent the weapon breaking when reloading traits on room change
OnAnyLoad{ function (triggerArgs)
    if HeroHasTrait("UltraGunTrait") then
        if HeroHasTrait("GunGrenadeClusterTrait") or HeroHasTrait("GunExplodingSecondaryTrait") then
            AspectFusion.ReloadAllTraits()
        end
    end
end}

-- ultra spear
ModUtil.Path.Wrap("MarkTargetSpinApply", function (baseFunc, triggerArgs)
    baseFunc(triggerArgs)
    if HeroHasTrait("UltraSpearTrait") then
        triggerArgs.TriggeredByTable.MarkedForDeath = true
    end
end)

ModUtil.Path.Wrap("MarkTargetSpinClear", function (baseFunc, triggerArgs)
    baseFunc(triggerArgs)
    if HeroHasTrait("UltraSpearTrait") then
        thread(AspectFusion.RemoveMark, triggerArgs)
    end
end)

function AspectFusion.RemoveMark(triggerArgs)
    wait(1)
    if triggerArgs.TriggeredByTable ~= nil then
       triggerArgs.TriggeredByTable.MarkedForDeath = false
    end
end

ModUtil.Path.Wrap("Kill", function (baseFunc, victim, triggerArgs )
    if victim.IsDead or CurrentRun.Hero.HandlingDeath then
		return
	end

    local killingWeaponName
    if triggerArgs == nil then
        killingWeaponName = ""
    else
        killingWeaponName = triggerArgs.SourceWeapon
    end

    -- Pot spawning
    -- if victim.MarkedForDeath or killingWeaponName == "SpearWeaponSpin" or killingWeaponName == "SpearWeaponSpin2" or killingWeaponName == "SpearWeaponSpin3" then
    --     if victim.Name ~= "ZagreusTombstone" then
    --         local newUnit = DeepCopyTable( EnemyData.ZagreusTombstone )
    --         newUnit.ObjectId = SpawnUnit({ Name = newUnit.Name, Group = "Standing", DestinationId = victim.ObjectId, DoActivatePresentation = false })
    --         SetColor({ Id = newUnit.ObjectId, Color = Color.Red})
    --         SetupEnemyObject( newUnit, CurrentRun)
    --     end
    -- end
    if not victim.BlockLifeSteal then
        if victim.MarkedForDeath or killingWeaponName == "SpearWeaponSpin" or killingWeaponName == "SpearWeaponSpin2" or killingWeaponName == "SpearWeaponSpin3" then
            CurrentRun.Hero.SoulCount = CurrentRun.Hero.SoulCount + 1
            AspectFusion.SoulLevelUp()
            thread(AspectFusion.UpdateSoulUI)
        end
    end

    baseFunc(victim, triggerArgs )

    -- Pot kill
    -- if victim.Name ~= nil and victim.Name == "ZagreusTombstone" then
    --     thread(AspectFusion.SoulPotKill, victim, triggerArgs)
    --     CurrentRun.Hero.SoulCount = CurrentRun.Hero.SoulCount + 1
    --     AspectFusion.SoulPotLevelUp()
    --     thread(AspectFusion.UpdateSoulUI)
    -- end
end)

-- function AspectFusion.DestroyAllPots()
-- 	for k, enemy in pairs( ActiveEnemies ) do
-- 		if enemy.Name == "ZagreusTombstone" then
--             enemy.DestroyOnly = true
-- 			thread( Kill, enemy )
-- 		end
-- 	end
-- end

-- ModUtil.Path.Wrap("CheckForAllEnemiesDead", function(baseFunc, eventSource, args)
--     baseFunc(eventSource, args)
--     -- Clean all pots at the end of an encounter
--     AspectFusion.DestroyAllPots()
-- end)

--Debug pot spawning
-- OnControlPressed{"Reload", function (triggerArgs)
--     if HeroHasTrait("UltraSpearTrait") then
--         local newUnit = DeepCopyTable( EnemyData.ZagreusTombstone )
--         newUnit.ObjectId = SpawnUnit({ Name = newUnit.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, DoActivatePresentation = false,
--         OffsetX = 100, OffsetY = 100 })
--         SetColor({ Id = newUnit.ObjectId, Color = Color.Red})
--         SetupEnemyObject( newUnit, CurrentRun)
--     end
-- end}

function AspectFusion.SoulLevelUp()
    if CurrentRun.Hero.SoulCount == nil or CurrentRun.Hero.SoulCount < 10 then
        return
    else
        CurrentRun.Hero.SoulCount = 0
        AddMaxHealth( 1, "UltraSpearTrait" )
    end
end

function AspectFusion.SoulPotLevelUp()
    if CurrentRun.Hero.SoulCount == nil then
        return
    end
    local levelData

    if CurrentRun.Hero.SoulCount >= AspectFusion.GetNextPotThreshold() then
        local temp = AspectFusion.GetNextPotThreshold()
        for _, thresholdData in pairs (AspectFusion.Data.SoulThresholds) do
            if thresholdData.Threshold == temp then
                levelData = thresholdData
                break
            end
        end
    end

    if levelData ~= nil then
        local pot = CurrentRun.Hero.SoulPot
        pot.CurrentThreshold = pot.NextThreshold
        pot.NextThreshold = AspectFusion.GetNextPotThreshold()

        if levelData.EnablePull then
            pot.EnablePull = true
        end
        if levelData.PullCount then
            pot.PullCount = pot.PullCount + levelData.PullCount
        end
        if levelData.PullRange then
            pot.PullRange = pot.PullRange + levelData.PullRange
        end
        if levelData.EnableExplosion then
            pot.EnableExplosion = true
        end
        if levelData.ExplosionDamage then
            pot.ExplosionDamage = pot.ExplosionDamage + levelData.ExplosionDamage
        end
        if levelData.ExplosionRadius then
            pot.ExplosionRadius = pot.ExplosionRadius + levelData.ExplosionRadius
        end
        if levelData.IncreaseHeroMaxHealth then
            AddTraitToHero({TraitName = "UltraSpearHealthBonus"})
            thread(UpdateHealthUI)
        end

    end

end

function AspectFusion.InitSoulPot()
    CurrentRun.Hero.SoulPot =
    {
        EnablePull = false,
        PullCount = 0,
        PullRange = 0,
        EnableExplosion = false,
        ExplosionDamage = 0,
        ExplosionRadius = 0,
        CurrentThreshold = 0,
    }
    CurrentRun.Hero.SoulPot.NextThreshold = AspectFusion.GetNextPotThreshold()
end

function AspectFusion.GetNextPotThreshold()
    if CurrentRun.Hero.SoulPot == nil then
        return
    end

    local threshold = CurrentRun.Hero.SoulPot.CurrentThreshold or 0
    local temp = 9999

    for i, thresholdData in pairs (AspectFusion.Data.SoulThresholds) do
        DebugPrint({Text=thresholdData.Threshold})
        if thresholdData.Threshold > threshold and thresholdData.Threshold < temp then
            temp = thresholdData.Threshold
        end
    end
    return temp
end

function AspectFusion.SoulPotKill(victim, triggerArgs)
    if victim.DestroyOnly then
        return
    end

    if CurrentRun.Hero.SoulPot == nil then
        AspectFusion.InitSoulPot()
    end

    local debug = false
	local victimName = victim.Name
	local killer = triggerArgs.AttackerTable
	local destroyerId = triggerArgs.AttackerId
	local killingWeaponName = triggerArgs.SourceWeapon
	local currentRoom = CurrentRun.CurrentRoom
    local pot = CurrentRun.Hero.SoulPot

    if killer == CurrentRun.Hero then
        if pot.EnablePull then
            local nearestEnemyTargetIds = GetClosestIds({ Id = victim.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = pot.PullRange, MaximumCount = pot.PullCount })
            for _, targetId in ipairs(nearestEnemyTargetIds) do
                if targetId ~= 0 and ActiveEnemies[targetId] ~= nil and not ActiveEnemies[targetId].IsDead then
                    local distanceBuffer = 0
                    ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, victim.ObjectId, -1 * distanceBuffer ), Angle = GetAngleBetween({ Id = targetId, DestinationId = victim.ObjectId }) })
                  end
            end
        end
        if pot.EnableExplosion then
            wait(0.2)
			SetProjectileProperty({ WeaponName = "GunBombWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageLow", Value = pot.ExplosionDamage })
			SetProjectileProperty({ WeaponName = "GunBombWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageHigh", Value = pot.ExplosionDamage })
			SetProjectileProperty({ WeaponName = "GunBombWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "DamageRadius", Value = pot.ExplosionRadius })
	        FireWeaponFromUnit({ Weapon = "GunBombWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
        end
    end

    -- for reference, temporary
    if killer == CurrentRun.Hero and killingWeaponName ~= nil and debug then
	    -- FireWeaponFromUnit({ Weapon = "GunBombWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
        -- if HasEffect({Id = attacker.ObjectId, EffectName = "SpearRushBonus"}) then
        --     DebugPrint({Text="yolo"})
        -- end

        if killingWeaponName == "SpearWeaponThrow" then
	        FireWeaponFromUnit({ Weapon = "GunBombWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })
            
        elseif killingWeaponName == "SpearWeaponSpin" or killingWeaponName == "SpearWeaponSpin2" or killingWeaponName == "SpearWeaponSpin3" then
	        FireWeaponFromUnit({ Weapon = killingWeaponName, Id = CurrentRun.Hero.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })

        elseif killingWeaponName == "RangedWeapon" then
			-- ReloadRangedAmmo(0)
	        -- FireWeaponFromUnit({ Weapon = killingWeaponName, Id = victim.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true })

            local consumableId = SpawnObstacle({ Name = "AmmoPack", DestinationId = victim.ObjectId, Group = "Standing" })
            local consumable = CreateConsumableItem( consumableId, "AmmoPack" )
            consumable.AddAmmo = 1
            local delay = GetTotalHeroTraitValue("AmmoDropUseDelay")
            if delay > 0 then
                SetInteractProperty({ DestinationId = consumableId, Property = "Cooldown", Value = delay })
                thread( DoUseDelay, consumableId, delay )
            end
    
            for i, data in pairs(GetHeroTraitValues("AmmoFieldWeapon")) do
                thread( FireAmmoWeapon, consumableId, data )
            end
            thread( EscalateMagnetism, consumable )
        elseif killingWeaponName == "SpearWeapon" then
        local nearestEnemyTargetIds = GetClosestIds({ Id = victim.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true, Distance = 600, MaximumCount = 3 })
        for _, targetId in ipairs(nearestEnemyTargetIds) do
            if targetId ~= 0 and ActiveEnemies[targetId] ~= nil and not ActiveEnemies[targetId].IsDead then
                local distanceBuffer = 0

                ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, victim.ObjectId, -1 * distanceBuffer ), Angle = GetAngleBetween({ Id = targetId, DestinationId = victim.ObjectId }) })
              end
        end
        end

    end
end

function AspectFusion.ShowSoulUI()
    if not CurrentRun.Hero.Weapons.SpearWeapon then
        AspectFusion.HideSoulUI()
		return
	end
    if ScreenAnchors.SoulUI ~= nil then
		return
	end

    if CurrentRun.Hero.SoulCount == nil then
        CurrentRun.Hero.SoulCount = 0
    end
    -- if CurrentRun.Hero.SoulPot == nil then
    --     AspectFusion.InitSoulPot()
    -- end

	ScreenAnchors.SoulUI = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", X = GunUI.StartX, Y = GunUI.StartY })

	local offsetX = 20
	CreateTextBox(MergeTables({ Id = ScreenAnchors.SoulUI, OffsetX = 0, OffsetY = -2,
			Font = "AlegreyaSansSCBold", FontSize = 24, ShadowRed = 0.1, ShadowBlue = 0.1, ShadowGreen = 0.1,
			OutlineColor = {0.113, 0.113, 0.113, 1}, OutlineThickness = 1,
			ShadowAlpha = 1.0, ShadowBlur = 0, ShadowOffsetY = 2, ShadowOffsetX = 0, Justification = "Left",},
			LocalizationData.UIScripts.GunUI ))
	thread( AspectFusion.UpdateSoulUI )

	FadeObstacleIn({ Id = ScreenAnchors.SoulUI, Duration = CombatUI.FadeInDuration, IncludeText = true, Distance = CombatUI.FadeDistance.Ammo, Direction = 0 })

end

function AspectFusion.UpdateSoulUI()
	local soulData =
	{
		Current = CurrentRun.Hero.SoulCount,
		Maximum = 1000--CurrentRun.Hero.SoulPot.NextThreshold
	}

	if soulData.Current == nil then
		return
	end
    soulData.Current = Clamp(soulData.Current, 0, soulData.Maximum)

    local text = soulData.Current--.."/"..soulData.Maximum

    local textColorA = { 17, 125, 0, 255 }
	local textColorB = Color.White
	local FontColor = Color.Lerp(textColorA, textColorB, (soulData.Maximum - soulData.Current) / soulData.Maximum)
	if soulData.Current >= soulData.Maximum then
		FontColor = textColorA
	end

	PulseText({ ScreenAnchorReference = "SoulUI", ScaleTarget = 1.04, ScaleDuration = 0.05, HoldDuration = 0.05, PulseBias = 0.02 })
	ModifyTextBox({ Id = ScreenAnchors.SoulUI, Text = text, Color = FontColor, ColorDuration = 0.04 })

	ModifyTextBox({ Id = ScreenAnchors.SoulUI, Text = text, FadeTarget = 1 })
	-- ModifyTextBox({ Id = ScreenAnchors.ComboUI, Text = "UI_GunText", OffsetY = -2, LuaKey = "TempTextData", LuaValue = comboData, AutoSetDataProperties = false, })
	ModifyTextBox({ Id = ScreenAnchors.SoulUI, Text = text, OffsetY = -2 })
end

function AspectFusion.HideSoulUI()
	if ScreenAnchors.SoulUI == nil then
		return
	end

	local id = ScreenAnchors.SoulUI
	HideObstacle({ Id = id, IncludeText = true, Distance = CombatUI.FadeDistance.Ammo, Angle = 180, Duration = CombatUI.FadeDuration, SmoothStep = true })

	ScreenAnchors.SoulUI = nil

	wait( CombatUI.FadeDuration , RoomThreadName)
	Destroy({ Id = id })
	ModifyTextBox({ Id = id, FadeTarget = 0, FadeDuration = 0, AutoSetDataProperties = false, })
end

ModUtil.Path.Wrap("ShowCombatUI", function (baseFunc, flag)
    baseFunc(flag)
    if CurrentDeathAreaRoom == nil or not CurrentDeathAreaRoom.ShowResourceUIOnly then
		AspectFusion.ShowSoulUI()
	end
end)

ModUtil.Path.Wrap("HideCombatUI", function (baseFunc, flag, args)
    baseFunc(flag, args)
	thread(AspectFusion.HideSoulUI)
end)

ModUtil.Path.Wrap("EquipPlayerWeaponPresentation", function (baseFunc, weaponData, args)
    baseFunc(weaponData, args)
    thread(AspectFusion.ShowSoulUI)
end)

end