# Simple make file
all: deb/usr/sbin/esmb

deb/usr/sbin/esmb: src/smb.conf.template src/esmb.template deb/DEBIAN/control
	@head -n 10 src/esmb.template >deb/usr/sbin/esmb
	@echo "SMB_CONF_TEMPLATE=\"`base64 -w 0 src/smb.conf.template)`\"" >>deb/usr/sbin/esmb
	@echo "KRB5_CONF_TEMPLATE=\"`base64 -w 0 src/krb5.conf.template)`\"" >>deb/usr/sbin/esmb
	@tail -n +11 src/esmb.template >>deb/usr/sbin/esmb
	@chmod +x deb/usr/sbin/esmb
	dpkg-deb --build deb dist

install: deb/usr/sbin/esmb
	cp deb/usr/sbin/esmb /usr/sbin

