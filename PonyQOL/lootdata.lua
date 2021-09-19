if PQOL.Config.Gameplay.ExtraHammers.Enabled then
    if PQOL.Config.Gameplay.ExtraHammers.SuperGunManualReloadTrait.Enabled then
        table.insert(LootData.WeaponUpgrade.Traits, "SuperGunManualReloadTrait")
    end
    if PQOL.Config.Gameplay.ExtraHammers.BowChainPerfectShotTrait.Enabled then
        table.insert(LootData.WeaponUpgrade.Traits, "BowChainPerfectShotTrait")
    end
end