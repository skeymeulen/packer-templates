install
cdrom
lang en_US.UTF-8
keyboard us
network --onboot yes --device eth0 --bootproto dhcp
rootpw --plaintext installer
firewall --enabled --service=ssh
authconfig --enableshadow --passalgo=sha512
selinux --enforcing
timezone --utc Europe/Amsterdam
bootloader --location=mbr --driveorder=sda --append="crashkernel=auto rhgb quiet"

text
skipx
zerombr

clearpart --all --initlabel
autopart

auth --useshadow --enablemd5
firstboot --disabled
reboot
