local shrineUpgrades = {}

local pactLookupTable =
{
    HardLabor = "EnemyDamageShrineUpgrade",
    LastingConsequences = "HealingReductionShrineUpgrade",
    ConvenienceFee = "ShopPricesShrineUpgrade",
    JurySummons = "EnemyCountShrineUpgrade",
    ExtremeMeasures = "BossDifficultyShrineUpgrade",
    CalisthenicsProgram = "EnemyHealthShrineUpgrade",
    BenefitsPackage = "EnemyEliteShrineUpgrade",
    MiddleManagement = "MinibossCountShrineUpgrade",
    UnderworldCustoms = "ForceSellShrineUpgrade",
    ForcedOvertime = "EnemySpeedShrineUpgrade",
    HeightenedSecurity = "TrapDamageShrineUpgrade",
    RoutineInspection = "MetaUpgradeStrikeThroughShrineUpgrade",
    DamageControl = "EnemyShieldShrineUpgrade",
    ApprovalProcess = "ReducedLootChoicesShrineUpgrade",
    TightDeadline = "BiomeSpeedShrineUpgrade",
    PersonalLiability = "NoInvulnerabilityShrineUpgrade"
}

local weaponLookupTable =
{
    [1] = "SwordWeapon",
    [2] = "BowWeapon",
    [3] = "SpearWeapon",
    [4] = "ShieldWeapon",
    [5] = "GunWeapon",
    [6] = "FistWeapon"
}

local aspectLookupTable =
{
    SwordWeapon =
    {
        [1] = "SwordBaseUpgradeTrait",
        [2] = "SwordCriticalParryTrait",
        [3] = "DislodgeAmmoTrait",
        [4] = "SwordConsecrationTrait"
    },
    BowWeapon =
    {
        [1] = "BowBaseUpgradeTrait",
        [2] = "BowMarkHomingTrait",
        [3] = "BowLoadAmmoTrait",
        [4] = "BowBondTrait"
    },
    SpearWeapon =
    {
        [1] = "SpearBaseUpgradeTrait",
        [2] = "SpearTeleportTrait",
        [3] = "SpearWeaveTrait",
        [4] = "SpearSpinTravel"
    },
    ShieldWeapon =
    {
        [1] = "ShieldBaseUpgradeTrait",
        [2] = "ShieldRushBonusProjectileTrait",
        [3] = "ShieldTwoShieldTrait",
        [4] = "ShieldLoadAmmoTrait"
    },
    GunWeapon =
    {
        [1] = "GunBaseUpgradeTrait",
        [2] = "GunGrenadeSelfEmpowerTrait",
        [3] = "GunManualReloadTrait",
        [4] = "GunLoadedGrenadeTrait"
    },
    FistWeapon =
    {
        [1] = "FistBaseUpgradeTrait",
        [2] = "FistVacuumTrait",
        [3] = "FistWeaveTrait",
        [4] = "FistDetonateTrait"
    },
    Rarity =
    {
        [1] = "Common",
        [2] = "Rare",
        [3] = "Epic",
        [4] = "Heroic",
        [5] = "Legendary"
    }
}

local godLookupTable =
{
    [1] = "ZeusUpgrade",
    [2] = "PoseidonUpgrade",
    [3] = "AthenaUpgrade",
    [4] = "AphroditeUpgrade",
    [5] = "ArtemisUpgrade",
    [6] = "DionysusUpgrade",
    [7] = "DemeterUpgrade"
}

function FreshFileFun.LoadShrineUpgrades()
    for upgrade, upgradeData in pairs(FreshFileFun.Config.Pact.Options) do
        if upgradeData.Enabled then
            shrineUpgrades[pactLookupTable[upgrade]] = upgradeData.Level
        end
    end
    GameState.MetaUpgrades = shrineUpgrades
end

if FreshFileFun.Config.Enabled then
    if FreshFileFun.Config.GodPoolSelector.Enabled then
        local config = FreshFileFun.Config.GodPoolSelector

        if config.EnablePoolPicker then
            -- prevent user input error from crashing the game
            Clamp(config.Gods.God1, 1, 7)
            Clamp(config.Gods.God2, 1, 7)
            Clamp(config.Gods.God3, 1, 7)
            Clamp(config.Gods.God4, 1, 7)

            local god1 = godLookupTable[config.Gods.God1]
            local god2 = godLookupTable[config.Gods.God2]
            local god3 = godLookupTable[config.Gods.God3]
            local god4 = godLookupTable[config.Gods.God4]

            local gods = {god1, god2, god3, god4}
            local firstGod = RemoveRandomKey(gods)

            RoomSetData.Tartarus.RoomSimple01.ForcedRewards =
            {
                {
                    Name = "Boon",
                    LootName = godLookupTable[firstGod]
                }
            }
            RoomSetData.Tartarus.RoomSimple01.ForceLootTableFirstRun = nil

            -- required since athena's first pickup line is set to true
            EncounterData.EnemyIntroFight01.RequiredFalseTextLines = nil

            -- voiding every gods' prereqs
            for _, loot in pairs(LootData) do
                if loot.RequiredMinCompletedRuns ~= nil and loot.RequiredMinCompletedRuns == 1 then
                    loot.RequiredMinCompletedRuns = nil
                end
                if loot.RequiredSeenRooms ~= nil then
                    loot.RequiredSeenRooms = nil
                end
            end

            ModUtil.Path.Wrap("StartNewGame", function (baseFunc)
                baseFunc()
                -- artificially fills up the god pool, forcing them to show up and preventing others
                CurrentRun.LootTypeHistory[god1] = 0
                CurrentRun.LootTypeHistory[god2] = 0
                CurrentRun.LootTypeHistory[god3] = 0
                CurrentRun.LootTypeHistory[god4] = 0
                -- not the ideal way to unlock all the gods but this requirement is present in too many tables
                TextLinesRecord["AthenaFirstPickUp"] = true
            end)
        end

        if config.EnableChaos or config.EnableErebus then
            for _, roomset in pairs(RoomSetData) do
                for _, room in pairs(roomset) do
                    if config.EnableChaos and room.SecretDoorRequirements ~= nil then
                        room.SecretDoorRequirements.RequiredTextLines = nil
                        room.SecretDoorRequirements.RequiredFalseTextLinesThisRun = nil
                        room.SecretDoorRequirements.RequiredMinCompletedRuns = nil
                    end
                    if config.EnableErebus and room.ShrinePointDoorRequirements ~= nil then
                        room.ShrinePointDoorRequirements.RequiredScreenViewed = nil
                        room.ShrinePointDoorRequirements.RequiredCosmetics = nil
                        room.ShrinePointDoorRequirements.RequireEncounterCompleted = nil
                    end
                end
            end
        end

        if config.EnableHammer or config.EnableHermes then
            if config.EnableHermes then
                LootData.HermesUpgrade.RequiredTextLines = nil
                ConsumableData.HermesUpgradeDrop.RequiredTextLines = nil
            end
    
            if config.EnableHammer then
                ConsumableData.WeaponUpgradeDrop.RequiredMinCompletedRuns = nil
            end

            for _, reward in pairs(RewardStoreData.RunProgress) do
                if config.EnableHammer and reward.Name == "WeaponUpgrade" then
                    reward.GameStateRequirements.RequiredMinCompletedRuns = nil
                elseif config.EnableHermes and reward.Name == "HermesUpgrade" then
                    reward.GameStateRequirements.RequiredMinCompletedRuns = nil
                end
            end
        end
    end

    if FreshFileFun.Config.ForceBestBuild.Enabled then
        ModUtil.Path.Wrap("SetupRoomReward", function (baseFunc, currentRun, room, previouslyChosenRewards, args)
            if not FreshFileFun.MercifulEndDone then
                room.RewardStoreName = "RunProgress"
                room.ChosenRewardType = "Boon"
                room.ForceLootName = "AresUpgrade"
                if not FreshFileFun.AthenaDone then
                    room.ForceLootName = "AthenaUpgrade"
                end
            end
            baseFunc(currentRun, room, previouslyChosenRewards, args)
        end)
        
        ModUtil.Path.Wrap("HandleLootPickup", function (baseFunc, currentRun, loot)
            if loot.Name == "AthenaUpgrade" and not FreshFileFun.AthenaDone and not FreshFileFun.SkippedFirstAthena then
                FreshFileFun.SkippedFirstAthena = true
                AddTraitToHero({ TraitName = "ForceAthenaBoonTrait_Modded", SkipNewTraitHighlight = true })
            elseif loot.Name == "AthenaUpgrade" and FreshFileFun.SkippedFirstAthena and not FreshFileFun.AthenaDone then
                loot.UpgradeOptions =
                {
                    {
                        Type = "Trait",
                        ItemName = "AthenaSecondaryTrait",
                        Rarity = "Epic",
                    },
                }
                FreshFileFun.AthenaDone = true
                RemoveTrait( CurrentRun.Hero, "ForceAthenaBoonTrait_Modded" )
                AddTraitToHero({ TraitName = "ForceAresBoonTrait_Modded", SkipNewTraitHighlight = true })
            elseif loot.Name == "AresUpgrade" and not FreshFileFun.AresDone then
                loot.UpgradeOptions =
                {
                    {
                        Type = "Trait",
                        ItemName = "AresWeaponTrait",
                        Rarity = "Epic",
                    },
                }
                FreshFileFun.AresDone = true
                RemoveTrait( CurrentRun.Hero, "ForceAresBoonTrait_Modded" )
            elseif loot.Name == "AthenaUpgrade" or loot.Name == "AresUpgrade" then
                if FreshFileFun.AthenaDone and FreshFileFun.AresDone and not FreshFileFun.MercifulEndDone then
                    loot.UpgradeOptions =
                    {
                        {
                            Type = "Trait",
                            ItemName = "TriggerCurseTrait",
                            Rarity = "Legendary",
                        },
                    }
                    FreshFileFun.MercifulEndDone = true
                end
            end
            baseFunc(currentRun, loot)
        end)
    end
    if FreshFileFun.Config.Pact.Enabled then
        ModUtil.Path.Wrap("StartNewRun", function (baseFunc, prevRun, args)
            FreshFileFun.LoadShrineUpgrades()
            baseFunc(prevRun, args)
        end)
    end
    if FreshFileFun.Config.WeaponSelector.Enabled then
        local config = FreshFileFun.Config.WeaponSelector
        -- Prevent user input error from crashing the game
        Clamp(config.Weapon, 1, 6)
        Clamp(config.Aspect, 1, 4)
        Clamp(config.AspectRarity, 1, 5)

        local weapon = weaponLookupTable[config.Weapon]
        local aspect = aspectLookupTable[weapon][config.Aspect]
        local aspectRarity = aspectLookupTable.Rarity[config.AspectRarity]

        ModUtil.LoadOnce(function ()
            EquipPlayerWeapon( WeaponData[weapon], { PreLoadBinks = true, SkipEquipLines = true } )
            GameState.LastInteractedWeaponUpgrade = { WeaponName = weapon, ItemIndex = GetEquippedWeaponTraitIndex(weapon) }
            AddTraitToHero({ TraitName = aspect, Rarity = aspectRarity })
        end)
    end
end