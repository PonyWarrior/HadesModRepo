local shrineUpgrades = {}

local lookUpTable =
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

function FreshFileFun.LoadShrineUpgrades()
    for upgrade, upgradeData in pairs(FreshFileFun.Config.Pact.Options) do
        if upgradeData.Enabled then
            shrineUpgrades[lookUpTable[upgrade]] = upgradeData.Level
        end
    end
    GameState.MetaUpgrades = shrineUpgrades
end

if FreshFileFun.Config.Enabled then
    if FreshFileFun.Config.ForceBestBuild.Enabled then
        ModUtil.Path.Wrap("SetupRoomReward", function (baseFunc, currentRun, room, previouslyChosenRewards, args)
            if not FreshFileFun.MercifulEndDone then
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
end