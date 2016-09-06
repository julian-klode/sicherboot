PREFIX ?= /usr

all:

install:
	install -D -o root -g root -m755 sicherboot $(DESTDIR)$(PREFIX)/sbin/sicherboot
