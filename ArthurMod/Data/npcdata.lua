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
        SkipInitialGiftRequirement = true,
		CanReceiveGift = true,

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
                {Portrait = "Portrait_Zag_Defiant_01", Speaker = "CharProtag",
                Text = "Stygius? What are you doing here, of all places? Wait... I feel someone here. This feeling, could it be..?"},
				{PreLineFunctionName = "BoonInteractPresentation", PreLineWait = 1.0, Speaker = "NPC_Arthur_01",
				Text = "Zagreus, prince of the underworld, I presume? Pleased to make your acquaintance. I am Arthur Pendragon, first born son of Uther Pendragon and rightwise king of all England. Excalibur here told me great good of you." },
                { Emote = "PortraitEmoteSurprise", Cue = "/VO/ZagreusHome_2051", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
                Text = "Arthur...! The Arthur chosen by the Fates themselves? I can't believe it, is it really you? But wait, is that Stygius in your hands? How could it be here and there at the same time?"},
                {Text = "So Stygius is what you call it, I see. Well, I do not believe I know who these Fates you speak of are, but I am quite sure of who I am."},
                {Text = "As to why Excalibur finds itself in both our grasps, I must admit I am as clueless as you are. Perhaps the wise magician Merlin may know the answer."},
                {Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
                Text = "This is.. how? You must pardon me sir, this is quite a surprising turn of events, even for me, and I find myself unsure what to say. You look just like I imagined, although perhaps younger."},
                {Text = "Haha, do not worry about such things. It is likewise a rather unusual occasion for me. You too look very similar to my own vision, albeit shorter of stature."},
                {Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
                Text = "Short? Ha, you certainly aren't the first to think so. But I forget my manners. Sir, it is a pleasure to meet you. I am Zagreus, son of Hades and prince of the underworld, as you presumed."},
                {Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
                Text = "I must ask however, how and why did you contact me? From my understanding you were supposed to be born centuries from now, yet here I am, speaking to you."},
                {Text = "How and why you ask? I shall explain the how first then. A week or so ago, I was training with Excalibur. As I swung her blade, she suddenly jolted, well-nigh leaping out of my arms. She had never once reacted that way before."},
                {Text = "I now reckon it was your doing, but had no inkling of this at the time. Over the following days, Excalibur continued to show strange behavior, every so often jumping in her scabbard or trembling in my grasp."},
                {Text = "As you can imagine, this was quite troubling for me. What was I to do if my sword fell from my hands in the midst of battle? And what would my subjects and followers think, seeing their king lose control of the Holy Excalibur?"},
                {Text = "And so I asked Excalibur herself. What was my surprise when she not only answered, but answered not with words; rather, she answered with visions. Flashes."},
                {Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
                Text = "..Visions? What did you see?"},
                {Text = "You."},
                {Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
                Text = "Me?"},
                {Text = "Yes, you, Zagreus. I saw bits and pieces of your battles with Excalibur. It is an understatement to say I was shocked. Whenever I had the opportunity I listened to Excalibur, and as I did the visions grew in clarity."},
                {Text = "Until today. I was busy ordering my knights when Excalibur flashed with blinding brilliance."},
                {Text = "As my eyes touched upon the light, I suddenly stood in a snow covered land, Excalibur steadfast in my grasp, facing a giant of a man with ashen skin, wielding a spear taller than even himself."},
                {Emote = "PortraitEmoteSurprise", Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
                Text = "That.. That was me facing my father in battle!"},
                {Text = "So that was Hades, Lord of the Underworld and God of the Dead. I had heard the legends, yet did not dare believe in them. So then Zagreus, you must understand why I wished to contact you."},
                {Text = "I may be a king, but a warrior I remain in my heart. When this vision ended, I excused myself to my chambers and asked Excalibur for a chance to speak with you."},
                {Text = "I scarcely hoped it would work, and yet she agreed. I cannot answer as to why it was possible, however. It must be the work of magic, perchance those Fates you mentioned are responsible."},
                {Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
                Text = "The Fates... I see, yes, that must have been their doing. Me facing against my father with Stygius in the form of Excalibur must have been their prophecy."},
                {Text = "I unfortunately must leave now, but I hope to discuss with you again, if you would be so inclined."},
                {Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
                Text = "I would be most honored, sir."},
            },
		},

		RepeatableTextLineSets =
        {
			ArthurChat01 =
			{
				UseableOffSource = true,
				RequiredTextLines = {"ArthurFirstMeeting"},
				RequiredFalseTextLines = {"TheseusGift06"},
				{Text = "Hello Prince Zagreus." },
			}
        },

		GiftTextLineSets =
		{
			ArthurGift01 =
			{
				PlayOnce = true,
                {Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
                Text = "Sir Arthur, I would like to offer you this small token of appreciation, from one wielder of Stygius to another."},
                {Text= "Why, that is very generous of you Prince Zagreus. Although, I'm not sure I deserve it. Excuse me, but may I ask what this peculiar drink is?"};
                {Portrait = "Portrait_Zag_Default_01", Speaker = "CharProtag",
                Text = "I would be surprised if you knew what it is, sir. This is a bottle of nectar, the drink of the gods. Not to boast or anything, but it is a quite sought after delicacy here."},
                {Emote = "PortraitEmoteSurprise", Text = "The drink of the gods? I have received many magnificent gifts in the past, but this overshadows them all! I cannot, however, accept such a gracious gift from you without gifting you back something."},
                {Text = " Here, take my royal clasp. It shall prove useful to you as you wield Excalibur."},
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