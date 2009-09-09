
-- Copyright (c) 2009, Sven Kirmess

local Version = 12
local OrigOpenAllBags = nil

local function IsSoulPouch(bag)

	-- We only care about the 4 player bags and not about
	-- bank bags, the backpack or wrong input to this function.
	if ( bag < 1 or bag > 4 ) then
		return false
	end

	local invID = ContainerIDToInventoryID(bag)
	local bagLink = GetInventoryItemLink("player", invID)
	local itemSubType = select(7, GetItemInfo(bagLink))
	if ( itemSubType == SoulPouch_Constants.SOULBAG ) then
		return true
	end

	return false
end

local function OpenAllNonSoulPouchBags()

	OrigOpenAllBags()

	for i = 0, 4 do
		if ( IsSoulPouch(i) ) then
			CloseBag(i)
		end
	end
end

local function NewOpenAllBags(forceOpen)

	-- Check if we should actually close all bags
	local allBagsAreOpen = true
	local i
	for i = 0, 4 do
		if ( not IsSoulPouch(i) ) then
			if ( not IsBagOpen(i) ) then
				-- At least on bag is closed.
				allBagsAreOpen = false
			end
		end

		-- Version 1 used CloseAllBags() which seams to be buggy.
		-- Sometimes it did not close bag #0.
		CloseBag(i)
	end

	if ( forceOpen or not allBagsAreOpen ) then
		OpenAllNonSoulPouchBags()
	end
end

function SoulPouch_OnLoad()

	local _, myClass = UnitClass("player")

	if ( ( myClass == "WARLOCK" ) and
	     ( OrigOpenAllBags == nil ) ) then
		OrigOpenAllBags = OpenAllBags
		OpenAllBags = NewOpenAllBags
		DEFAULT_CHAT_FRAME:AddMessage(string.format(SoulPouch_Constants.SOUL_POUCH_LOADED, Version))
	end
end

