all: deb/usr/sbin/esmb

deb/usr/sbin/esmb: smb.conf.template esmb.template deb/DEBIAN/control
	@head -n 10 esmb.template >deb/usr/sbin/esmb
	@echo "SMB_CONF_TEMPLATE=\"`base64 -w 0 smb.conf.template)`\"" >>deb/usr/sbin/esmb
	@echo "KRB5_CONF_TEMPLATE=\"`base64 -w 0 krb5.conf.template)`\"" >>deb/usr/sbin/esmb
	@tail -n +11 esmb.template >>deb/usr/sbin/esmb
	@chmod +x deb/usr/sbin/esmb
	dpkg-deb --build deb dist
