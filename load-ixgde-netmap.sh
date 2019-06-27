#!bin/sh
# down interfaces using ixgbe driver
ifdown enp6s0f0
ifdown enp6s0f1
# remove generic kernel module
rmmod ixgbe
# remove old netmap kernel module
rmmod netmap_lin
# insert initial netmap kernel module
insmod ./netmap_lin.ko
mknod /dev/netmap c 10 59
modprobe mdio
# insert netmap driver for ixgbe 
insmod ./ixgbe/ixgbe.ko
# make interface up
ifup enp6s0f0
ifup enp6s0f1

