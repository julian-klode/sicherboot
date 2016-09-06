PREFIX ?= /usr

all:

install:
	install -D -o root -g root -m755 jak-sb $(DESTDIR)$(PREFIX)/sbin/jak-sb
