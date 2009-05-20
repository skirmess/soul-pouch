
.PHONY: clean tag release

VERSION=10

clean:
	rm -f *~

tag: clean
	cvs tag SoulPouch-$(VERSION)

release: clean
	( cd ..;							\
		rm -f SoulPouch-$(VERSION).zip;				\
		find SoulPouch						\
				-name CVS -prune -o			\
				-name .svn -prune -o			\
				-name Makefile -prune -o		\
				-name '.*.swp' -prune -o		\
				-print					\
		| zip -@ SoulPouch-$(VERSION).zip;			\
	)	
