if ArthurMod.Config.Enabled then

    table.insert(CodexOrdering.OtherDenizens.Order, "NPC_Arthur_01")

    Codex.OtherDenizens.Entries["NPC_Arthur_01"] =
    {
        Entries =
        {
            {
                UnlockThreshold = 1,
                Text = "Arthur_03"
            },
            -- {
            --     UnlockThreshold = 5,
            --     Text = "Arthur_02"

            -- },
            -- {
            --     UnlockThreshold = 15,
            --     Text = "Arthur_03"
            -- }
        },
        Image = "Codex_Portrait_Arthur",
    }
end