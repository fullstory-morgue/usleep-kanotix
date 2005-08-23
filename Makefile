VERSION = 0.5

DESTDIR =

CC = gcc
CFLAGS = -O2 -Wall -s $(EXTRA_CFLAGS)
INSTALL = install
INSTALLFLAGS = -s
prefix = $(DESTDIR)/usr
INSTALLDIR = $(DESTDIR)/bin
MYDIR = usleep-$(VERSION)
TARGETS = usleep
OBJECTS = usleep.o
#DOCDIR = $(prefix)/share/doc/packages
INSTASROOT = -o root -g root

default: $(TARGETS)

usleep: usleep.c
	$(CC) $(CFLAGS) $(DEFINES) $< -o $@
	#gcc -O2 -s -o usleep usleep.c

clean:
	rm -f $(TARGETS) $(OBJECTS) core

distclean: clean
	rm -f *~

dist: distclean
	tar cvzf ../usleep-$(VERSION).tar.gz -C.. --exclude=$(MYDIR)/CV* $(MYDIR)/

install: $(TARGETS)
	mkdir -p $(INSTALLDIR)
	$(INSTALL) $(INSTALLFLAGS) $(INSTASROOT) -m 0755 $(TARGETS) $(INSTALLDIR)

