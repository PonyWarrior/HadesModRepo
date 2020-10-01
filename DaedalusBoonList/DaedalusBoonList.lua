
local loaded = false
OnAnyLoad{function(triggerArgs)
    if not loaded then
      table.insert(BoonInfoScreenData.Ordering, "WeaponUpgrade")
  		BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"] = {}
  		if BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] then
  			BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"] = GetAllKeys( BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] )
  			table.sort( BoonInfoScreenData.SortedTraitIndex["WeaponUpgrade"], BoonInfoSort )
  			BoonInfoScreenData.TraitDictionary["WeaponUpgrade"] = nil
  		end
      loaded = true
    end
end}
