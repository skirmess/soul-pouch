
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

Version 12
 * The class needs no longer be localized.
 * Stop leaking globals.

Version 11
 * Use GetItemInfo() to check if the bag is a soul pouch. Therefore we
   don't have to maintain a list of all soul pouches in this add-on.
   And it will automatically work in every language, no need to translate
   all the bag names.
 * Updated TOC for WoW 3.2
 * Added license information
 * Added link to project main page at
   http://code.google.com/p/soul-pouch/

Version 10
 * Bugfix: Replaced the german and english name for 'Abyssal Bag' in version 9.

Version 9
 * Updated TOC for WoW 3.1.2
 * Added german name for 'Abyssal Bag'.

Version 8
 * Updated TOC for WoW 3.0.2
 * Added 'Abyssal Bag' from WotLK.
   (German and French translation for this bag name missing.)

Version 7
 * Updated TOC for WoW Client 2.3.0

Version 6
 * Added 'Small Soul Pouch', 'Box of Souls' and 'Ebon Shadowbag
 * Updated TOC for WoW Client 2.0.3

Version 5
 * Updated TOC for WoW Client 2.0

Version 4
 * Does now work with the bank and mailbox too.
 * Updated TOC for WoW Client 1.12

Version 3
 * Added french translation
 * Updated TOC for WoW Client 1.10

Version 2
 * Added german translation for the Core Felcloth Bag
 * Fixed a bug where sometimes the main bag was kept open
 * Added support for the flag to OpenAll() which forces to open all bags,
   no mather if all the bags were already open (which would imply to
   close them). This also keeps the Soul Pouch closed.
