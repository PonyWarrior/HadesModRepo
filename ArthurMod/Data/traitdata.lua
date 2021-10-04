if ArthurMod.Config.Enabled then
    TraitData.ArthurKeepsakeTrait =
    {
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ArthurKeepsakeTrait_Rack",
		Icon = "Keepsake_Arthur",
		EquipSound = "/Leftovers/Menu Sounds/TalismanMetalClankDown",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2.00,
			},
			Epic =
			{
				Multiplier = 3.00,
			}
		},
		PropertyChanges =
		{
			{
                TraitName = "SwordConsecrationTrait",
				WeaponName = "ConsecrationField",
                ProjectileProperty = "TotalFuse",
				BaseValue = 2.0,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "AuraDuration",
					DecimalPlaces = 2,
				}
			},
            {
                TraitName = "SwordConsecrationTrait",
				WeaponName = "ConsecrationField",
                ProjectileProperty = "UseDetonationForProjectileDefense",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

		},
		SignOffData =
		{
		  {
			Text = "ArthurSignoff",
		  },
		  {
			Text = "ArthurSignoff_Max"
		  }
		},
	}
end