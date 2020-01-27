# esmb
EasySMB - samba support tool

This tool allow to prepare Ubuntu (tested only on 18.04 LTS) server for joining AD domain

Example
```
# set AD domain name
esmb set-domain ad.nauka.ga

# Prepare system (install required packages)
esmb init

# Generate configuration
esmb configure

# Join AD domain
esmb join-domain

# Add share
esmb add-share share /storage/share
```
