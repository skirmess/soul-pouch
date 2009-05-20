
SoulPouch_Version = 6

function SoulPouch_IsSoulPouch(bag)

	local bagName = GetBagName(bag)

	if ( bagName ~= nil ) then
		if (
			bagName == SoulPouch_Constants.EBONSHADOWBAG or
			bagName == SoulPouch_Constants.SOULPOUCH or
			bagName == SoulPouch_Constants.FELCLOTHBAG or
			bagName == SoulPouch_Constants.COREFELCLOTHBAG or
			bagName == SoulPouch_Constants.BOXOFSOULS or
			bagName == SoulPouch_Constants.SMALLSOULPOUCH
		) then
			return true
		end
	end

	return false
end

function SoulPouch_OpenAllNonSoulPouchBags()
	
	SoulPouchOrig_OpenAllBags()

	for i = 0, 4 do
		if ( SoulPouch_IsSoulPouch(i) ) then
			CloseBag(i)
		end
	end
end

function SoulPouch_OpenAll(forceOpen)
	-- Check if we should actually close all bags

	local allBagsAreOpen = true
	for i = 0, 4 do
		if ( not SoulPouch_IsSoulPouch(i) ) then
			if (not IsBagOpen(i)) then
				-- At least on bag is closed.
				allBagsAreOpen = false
			end
		end

		-- Version 1 used CloseAllBags() which seams to be buggy.
		-- Sometimes it did not close bag #0.
		CloseBag(i)
	end

	if (forceOpen or not allBagsAreOpen) then
		SoulPouch_OpenAllNonSoulPouchBags()
	end
end

function SoulPouch_OnLoad()

	local myClass = UnitClass("player")

	if ((myClass == SoulPouch_Constants.WARLOCK) and
	    (SoulPouchOrig_OpenAllBags == nil)) then
		SoulPouchOrig_OpenAllBags = OpenAllBags
		OpenAllBags = SoulPouch_OpenAll
		DEFAULT_CHAT_FRAME:AddMessage(string.format(SoulPouch_Constants.SOUL_POUCH_LOADED, SoulPouch_Version))
	end
end

