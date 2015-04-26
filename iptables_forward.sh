#!/bin/bash
IPTABLES='/sbin/iptables'
# # Set interface values
# EXTIF='eth0'
# INTIF1='eth1'
# INTIF2='eth2'
# Set interface values
EXTIF='eth1'
INTIF='eth2'
# enable ip forwarding in the kernel
/bin/echo 1 > /proc/sys/net/ipv4/ip_forward
# flush rules and delete chains
$IPTABLES -F
$IPTABLES -X
# enable masquerading to allow LAN internet access
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
# forward LAN traffic from $INTIF1 to Internet interface $EXTIF
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -m state --state NEW,ESTABLISHED -j ACCEPT
# #echo -e "       - Allowing access to the SSH server"
# $IPTABLES -A INPUT --protocol tcp --dport 22 -j ACCEPT
# #echo -e "       - Allowing access to the HTTP server"
# $IPTABLES -A INPUT --protocol tcp --dport 80 -j ACCEPT
# # block out all other Internet access on $EXTIF
# $IPTABLES -A INPUT -i $EXTIF -m state --state NEW,INVALID -j DROP
# $IPTABLES -A FORWARD -i $EXTIF -m state --state NEW,INVALID -j DROP
