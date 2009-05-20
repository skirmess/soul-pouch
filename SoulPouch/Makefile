
.PHONY: clean tag release

VERSION=7

clean:
	rm -f *~

tag: clean
	cvs tag SoulPouch-$(VERSION)

release: clean
	( cd ..;							\
		rm -f SoulPouch-$(VERSION).zip;				\
		find SoulPouch -name CVS -prune -o			\
	       		       -name Makefile -prune -o			\
			       -name '.*.swp' -prune -o			\
			       -print					\
		| zip -@ SoulPouch-$(VERSION).zip;			\
	)	
