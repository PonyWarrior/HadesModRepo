local config = {
  bloodcost = { 1, 1, 1, 1, 1, },
}
for _,weapon in pairs(WeaponUpgradeData) do
  for _,upgrade in pairs(weapon) do
    if upgrade.Costs ~= nil then
      upgrade.Costs = config.bloodcost
    end
  end
end
