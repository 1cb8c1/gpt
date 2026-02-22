PREFIX = /usr/local
DESTDIR =

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f gpt $(DESTDIR)$(PREFIX)/bin/gpt
	chmod 755 $(DESTDIR)$(PREFIX)/bin/gpt

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/gpt

.PHONY: install uninstall
