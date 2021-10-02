if AspectFusion.Config.Enabled then
    UnitSetData.Enemies.ZagreusTombstone =
    {
        InheritFrom = { "IsNeutral", "BaseVulnerableEnemy" },
		MaxHealth = 1,
		SkipDamageText = true,
		HideHealthBar = true,
		HideLevelDisplay = true,
		RequiredKill = false,
		AlwaysTraitor = true,
		-- OnDamagedFunctionName = "AspectFusion.OnTombstoneDamaged",
		-- OnDeathFunctionName = "GunBombDetonate",


		MoneyDropOnDeath =
		{
			Chance = 0.0,
		},
    }
end

OverwriteTableKeys( EnemyData, UnitSetData.Enemies )