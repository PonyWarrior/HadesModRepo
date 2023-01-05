if PAB.Config.Gameplay.ExtraHammers.Enabled then
    if PAB.Config.Gameplay.ExtraHammers.SuperGunManualReloadTrait.Enabled then
        table.insert(LootData.WeaponUpgrade.Traits, "SuperGunManualReloadTrait")
    end
    if PAB.Config.Gameplay.ExtraHammers.BowChainPerfectShotTrait.Enabled then
        table.insert(LootData.WeaponUpgrade.Traits, "BowChainPerfectShotTrait")
    end
end