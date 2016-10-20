#
#	Makefile
#

PREFIX?= /usr/local

MAN=
BINDIR=$(PREFIX)/sbin
FILESDIR=$(PREFIX)/lib/iocell
RCDIR=$(PREFIX)/etc/rc.d
MANDIR=$(PREFIX)/man/man8
MKDIR=mkdir

SCRIPTS=iocell
SCRIPTSDIR=${PREFIX}/BINDIR
MAN=	$(SCRIPTS).8

${SCRIPTS}:
	@echo Nothing needs to be done for iocell.

install:: all
	$(MKDIR) -p $(BINDIR)
	$(MKDIR) -p $(FILESDIR)
	$(MKDIR) -p $(RCDIR)
	$(MKDIR) -p $(MANDIR)
	$(INSTALL) -c -m $(BINMODE) ${.OBJDIR}/$(SCRIPTS) $(BINDIR)/
	$(INSTALL) -c ${.OBJDIR}/lib/* $(FILESDIR)/
	$(INSTALL) -c ${.OBJDIR}/rc.d/* $(RCDIR)/
	$(INSTALL) -c $(MAN).gz $(MANDIR)/

.include <bsd.prog.mk>
