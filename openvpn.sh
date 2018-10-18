#!/bin/sh
set -e -u

mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

if [ -n "$REGION" ]; then
  set -- "$@" '--config' "TorGuard.${REGION}.ovpn"
fi

if [ -n "$USERNAME" -a -n "$PASSWORD" ]; then
  echo "$USERNAME" > auth.conf
  echo "$PASSWORD" >> auth.conf
  set -- "$@" '--auth-user-pass' 'auth.conf'
fi

nohup openvpn "$@" &

