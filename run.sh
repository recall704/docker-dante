#!/bin/bash

/etc/init.d/sockd restart
sleep 3s
/usr/local/bin/server_linux_amd64 -l "0.0.0.0:2049" -t "127.0.0.1:1080" -key "MTIzNDU2Nzg5MAo=" -crypt aes --mode fast2 --nocomp  -mtu 1400 -sndwnd 2048 -rcvwnd 2048
