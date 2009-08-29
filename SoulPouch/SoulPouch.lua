
-- Copyright (c) 2009, Sven Kirmess

SoulPouch_Version = 11

function SoulPouch_IsSoulPouch(bag)

	-- We only care about the 4 player bags and not about
	-- bank bags, the backpack or wrong input to this function.
	if ( bag < 1 or bag > 4 ) then
		return false
	end

	local invID = ContainerIDToInventoryID(bag)
	local bagLink = GetInventoryItemLink("player", invID)
	local itemSubType, trash
	trash, trash, trash, trash, trash, trash, itemSubType, trash, trash, trash = GetItemInfo(bagLink)
	if ( itemSubType == SoulPouch_Constants.SOULBAG ) then
		return true
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

