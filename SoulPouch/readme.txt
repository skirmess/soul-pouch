
Whenever all bags are opened, Soul Pouch keeps the Soul Pouch
closed. (You can still open the Soul Pouch manually.) This works
together with the key binding which is used to open all bags (default
is Shift - B) or with other Add-Ons which opens all bags (like
AuctionIt).

*** Implementation Details

Soul Pouch replaces the default OpenAllBags() function. The new
OpenAllBag functions uses the following logic. First, it checks if any
non soul pouch bag is closed. Then, it closes all bags. If at least
one non soul pouch bag was closed before, all non soul shard bags are
opened. This is the same behaviour as the default OpenAllBags function
which opens all bags but if all bags were already open, it closes them
all.

*** Changelog

Version 3
Added french translation
Updated TOC for WoW Client 1.10

Version 2
Added german translation for the Core Felcloth Bag
Fixed a bug where sometimes the main bag was kept open
Added support for the flag to OpenAll() which forces to open all bags,
  no mather if all the bags were already open (which would imply to
  close them). This also keeps the Soul Pouch closed.

Version 1
Initial release
