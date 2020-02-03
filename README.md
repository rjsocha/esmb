# esmb
EasySMB - samba support tool

Tutorial: https://asciinema.org/a/297069


Windows part: http://share.socha.it/github/esmb/


This tool allow to prepare Ubuntu (tested only on 18.04 LTS) server for joining AD domain.
This is more for internal use than public...

Example
```
# set AD domain name
esmb set-domain ad.nauka.ga

# Setup correct DNS resolvers 
esmb set-resolver <IPofDC> <IPofDC1> <IPofNS>

# Check system current configuration
esmb check
```

Configure system in one step
```
esmb auto
```

Configure system in separate steps
```
#Enable ZFS for Shadow Copy (not mandatory)
esmb zfs-support

# Prepare system (install required packages)
esmb init

# Generate configuration
esmb configure
```

Join AD domain
esmb join-domain

# Add share
esmb add-share share /storage/share

# Add share as ZFS filesystem with Shadow Copy support
esmb add-share share zpool/data +create +shadow +system-acl
esmb add-share share zpool/data +create +shadow +windows-acl
```

When adding shares there are two options for handling ACL-s. One is to use system ACL and second is to  allow Samba manage ACL (as Extended Attribute property only). 

With system ACL you can easly use exported FS one linux side (add, modify files etc).

With second option your linux side access to files is limited (all files are 777/666, and you need to manage Windows ACL by modifing extended attribue security.NTACL).

Selecting acl modes have some quite interesting side effeces for Shadow Copies.

With +system-acl support Shadow Copies (Previews Versions on Windows clients side) allow to restore files as normal users.

With +window-acl support Shadow Copies can be only restored by Administrator. This works because ZOL for the moment is missing ACL (NFSv4 ACL) support for snapshots.


CHANGES
```
1.0.15  -  add option for add-share to enable or disable system acl
```
