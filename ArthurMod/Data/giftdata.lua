if ArthurMod.Config.Enabled then
    local config = ArthurMod.Config

    table.insert(GiftOrdering, "ArthurKeepsakeTrait")

    GiftData["NPC_Arthur_01"] =
    {
		InheritFrom = {"DefaultGiftData"},
		MaxedIcon = "Keepsake_Arthur_Max",
		MaxedSticker = "Keepsake_ArthurSticker_Max",
		MaxedRequirement = { RequiredTextLines = { "ArthurGift01" }, },
        Value = 0,
		Locked = 7,
		[1] = { Gift = "ArthurKeepsakeTrait" },
		-- [7] = { RequiredResource = "SuperGiftPoints" },
		-- [8] = { RequiredResource = "SuperGiftPoints" },
		UnlockGameStateRequirements = { }
	}

    ModUtil.LoadOnce(function ()
        CurrentRun.TextLinesRecord = {}
        if GameState.Gift["NPC_Arthur_01"] == nil then
            GameState.Gift["NPC_Arthur_01"] = {}
            GameState.Gift["NPC_Arthur_01"].Value = GiftData["NPC_Arthur_01"].Value
        end
    end)
end