if ArthurMod.Config.Enabled then

    table.insert(GameData.ConversationOrder, "NPC_Arthur_01")

    UnitSetData.NPCs["NPC_Arthur_01"] =
	{
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },

		UseText = "UseTalkToThanatos",
		AnimOffsetZ = 160,
		EmoteOffsetX = -70,
		EmoteOffsetY = -160,
		Portrait = "NPC_Arthur_Portrait_01",
		Groups = { "NPCs" },

        Binks =
        {
            "WeaponSwordAlt03FloatingIdleBonus"
        },

		ActivateRequirements =
		{
            RequiredPlayed =
			{
				-- We made it, Stygius. I hope this Arthur serves you well someday.
				"/VO/ZagreusField_3250",
			},
		},

		InteractTextLineSets =
		{
			ArthurFirstMeeting =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				{PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0, Speaker = "NPC_Arthur_01",
				Text = "Zagreus, prince of the underworld, is it? Pleased to make your acquaintance. I hope Excallibur here serves you well." },
			},
		},

		RepeatableTextLineSets =
        {
            ArthurChat01 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{ Cue = "/VO/Patroclus_0005",
					Text = "You again? Then, here. Fates know I'll not be needing this." },
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
        },

		GiftTextLineSets =
		{
			ArthurGift01 =
			{
				PlayOnce = true,
				{ Cue = "/VO/ZagreusField_1731", Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart", PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return", PostLineAnimTarget = "Hero",
					Text = "Hey, look, I can tell you're struggling right now, and... maybe this isn't the way to help you through it all, but... I want you to have this." },
				{ Cue = "/VO/Patroclus_0142",
					Text = "{#DialogueItalicFormat}Ahh{#PreviousFormat}, so you are taking pity on me, then? Well, I've no pride like many others here, so I shall take it. Though, let's make it a fair exchange, shall we?" },
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- I am most grateful to you, sir.
			{ Cue = "/VO/ZagreusField_1732" },
		},
	}

    OverwriteTableKeys( EnemyData, UnitSetData.NPCs )
end