#!/bin/bash
modprobe raid1 && sleep 1
for i in 1 2 3 5 6 7 8; do mknod /dev/md$i b 9 $i; done && sleep 1
for i in 1 2 3 5 6 7 8; do mdadm -A /dev/md$i /dev/sda$i /dev/sdb$i; done && sleep 1
mount /dev/md3 /mnt/gentoo && sleep 1
mount /dev/md1 /mnt/gentoo/boot && sleep 1
mount /dev/md5 /mnt/gentoo/usr && sleep 1
mount /dev/md6 /mnt/gentoo/var && sleep 1
mount /dev/md7 /mnt/gentoo/tmp && sleep 1
mount /dev/md8 /mnt/gentoo/home && sleep 1
mount -t proc proc /mnt/gentoo/proc && sleep 1
mount -o bind /dev /mnt/gentoo/dev
swapon /dev/md2 && sleep 1
