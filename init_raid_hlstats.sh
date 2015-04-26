#!/bin/bash
modprobe md && sleep 3
for i in 1 2 5 6 7 8 9 10; do mknod /dev/md$i b 9 $i; done && sleep 3
for i in 1 2 5 6 7 8 9 10; do mdadm -A /dev/md$i /dev/hda$i /dev/hdd$i; done && sleep 3
mount /dev/md6 /mnt/gentoo && sleep 1
mount /dev/md1 /mnt/gentoo/boot && sleep 1
mount /dev/md7 /mnt/gentoo/usr && sleep 1
mount /dev/md8 /mnt/gentoo/var && sleep 1
mount /dev/md9 /mnt/gentoo/tmp && sleep 1
mount /dev/md10 /mnt/gentoo/opt && sleep 1
mount -t proc none /mnt/gentoo/proc && sleep 1
swapon /dev/md5 && sleep 3
