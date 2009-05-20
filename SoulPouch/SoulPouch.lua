
function SoulPouch_IsSoulPouch(bag)

	local bagName = GetBagName(bag);

	if ( bagName ~= nil ) then
		if (
			bagName == SoulPouch_Constants.SOULPOUCH or
			bagName == SoulPouch_Constants.FELCLOTHBAG or
			bagName == SoulPouch_Constants.COREFELCLOTHBAG
		) then
			return true;
		end
	end

	return false;
end

function SoulPouch_OpenAllNonSoulPouchBags()

	for i = 0, 4 do
		if ( not SoulPouch_IsSoulPouch(i) ) then
			OpenBag(i);
		end
	end
end

function SoulPouch_OpenAll()
	-- Check if we should actually close all bags

	local allBagsAreOpen = true;
	for i = 0, 4 do
		if ( not SoulPouch_IsSoulPouch(i) ) then
			if (not IsBagOpen(i)) then
				-- At least on bag is closed.
				allBagsAreOpen = false;
				break;
			end
		end
	end

	CloseAllBags();

	if (not allBagsAreOpen) then
		SoulPouch_OpenAllNonSoulPouchBags();
	end
end

function SoulPouch_OnLoad()

	local myClass = UnitClass("player");

	if (myClass == SoulPouch_Constants.WARLOCK) then
		OpenAllBags = SoulPouch_OpenAll;
		DEFAULT_CHAT_FRAME:AddMessage("Soul Pouch loaded.");
	end
end

