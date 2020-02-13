#!/usr/bin/env ash

EXTRA_SCRIPT="";
CONFIG_FILE="/etc/vpnc/client.conf";

while getopts e:p: option
do
 case "${option}"
 in
 e) EXTRA_SCRIPT=${OPTARG};;
 p) CONFIG_FILE=${OPTARG};;
 esac
done

if [ -f "$EXTRA_SCRIPT" ]; then
	bash $EXTRA_SCRIPT;
fi

[ -d /dev/net ] || mkdir -p /dev/net
[ -c /dev/net/tun ] || (mknod /dev/net/tun c 10 200 && chmod 0666 /dev/net/tun )

exec /usr/sbin/openvpn --config $CONFIG_FILE < /dev/null
