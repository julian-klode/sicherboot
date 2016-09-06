PREFIX ?= /usr

sicherboot.conf: sicherboot.conf.in sicherboot
	cp sicherboot.conf.in sicherboot.conf.tmp
	 set -e; for var in `grep -o "^[A-Z][A-Z_]*=$$" sicherboot.conf.in | sort -u`; do \
		sed -i "s@^$$var@#`grep ^$$var sicherboot`@g" sicherboot.conf.tmp; \
	done
	mv sicherboot.conf.tmp sicherboot.conf


all: sicherboot.conf

clean:
	$(RM) -f sicherboot.conf sicherboot.conf.tmp

install: all
	install -D -o root -g root -m644 sicherboot.conf $(DESTDIR)/etc/sicherboot/sicherboot.conf
	install -d -o root -g root -m700 $(DESTDIR)/etc/sicherboot/keys
	install -D -o root -g root -m755 sicherboot $(DESTDIR)$(PREFIX)/sbin/sicherboot
