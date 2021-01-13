
function CreateLevelDisplay( newEnemy, currentRun )
    -- mod start
    local outline =
    {
        R = 105,
        G = 0,
        B = 255,
        Opacity = 1.0,
        Thickness = 2,
        Threshold = 0.6,
    }

    newEnemy.Outline = outline
    newEnemy.Outline.Id = newEnemy.ObjectId
    AddOutline( newEnemy.Outline )
    -- mod end

	if newEnemy.HideLevelDisplay or newEnemy.HasLevelDisplay then
		return
	end
	newEnemy.HasLevelDisplay = true

	local offsetY = -150
	if newEnemy.Scale ~= nil then
		offsetY = offsetY * newEnemy.Scale
	end
	if newEnemy.HealthBarOffsetY then
		offsetY = newEnemy.HealthBarOffsetY
	end

	if not newEnemy.UseBossHealthBar then
		if newEnemy.EliteIcon or ( newEnemy.HealthBuffer ~= nil and newEnemy.HealthBuffer > 0 ) or ( newEnemy.HitShields ~= nil and newEnemy.HitShields > 0 ) then
			CreateHealthBar( newEnemy )
			UpdateHealthBar( newEnemy, 0, { Force = true })
			if not newEnemy.HasOutline and newEnemy.Outline ~= nil and newEnemy.HealthBuffer ~= nil and newEnemy.HealthBuffer > 0 then
				newEnemy.Outline.Id = newEnemy.ObjectId
				AddOutline( newEnemy.Outline )
				newEnemy.HasOutline = true
			end
		end
	end
end