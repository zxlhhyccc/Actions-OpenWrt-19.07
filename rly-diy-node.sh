#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# 修改node源码包
rm -rf ./feeds/packages/lang/node-arduino-firmata
rm -rf ./feeds/packages/lang/node-cylon
rm -rf ./feeds/packages/lang/node-hid
rm -rf ./feeds/packages/lang/node-homebridge
rm -rf ./feeds/packages/lang/node-javascript-obfuscator
rm -rf ./feeds/packages/lang/node-serialport-bindings
rm -rf ./feeds/packages/lang/node-serialport
rm -rf ./feeds/packages/lang/node
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-actions-on-google feeds/packages/lang/node-actions-on-google
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-alexa-app feeds/packages/lang/node-alexa-app
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-alljoyn feeds/packages/lang/node-alljoyn
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-arduino-firmata feeds/packages/lang/node-arduino-firmata
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-ask-sdk feeds/packages/lang/node-ask-sdk
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-authenticate-pam feeds/packages/lang/node-authenticate-pam
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-autobahn feeds/packages/lang/node-autobahn
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-aws-iot-device-sdk feeds/packages/lang/node-aws-iot-device-sdk
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-aws-sdk feeds/packages/lang/node-aws-sdk
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-azure-event-hubs feeds/packages/lang/node-azure-event-hubs
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-azure-iot-device-amqp feeds/packages/lang/node-azure-iot-device-amqp
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-azure-iot-device-http feeds/packages/lang/node-azure-iot-device-http
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-azure-iot-device-mqtt feeds/packages/lang/node-azure-iot-device-mqtt
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-azure-iot-device feeds/packages/lang/node-azure-iot-device
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-azure-iothub feeds/packages/lang/node-azure-iothub
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-bignum feeds/packages/lang/node-bignum
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-binaryjs feeds/packages/lang/node-binaryjs
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-bleacon feeds/packages/lang/node-bleacon
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-bleno feeds/packages/lang/node-bleno
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-bluetooth-hci-socket feeds/packages/lang/node-bluetooth-hci-socket
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-browserify feeds/packages/lang/node-browserify
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-bufferutil feeds/packages/lang/node-bufferutil
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-coap feeds/packages/lang/node-coap
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-cpx feeds/packages/lang/node-cpx
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-cylon-firmata feeds/packages/lang/node-cylon-firmata
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-cylon-gpio feeds/packages/lang/node-cylon-gpio
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-cylon-i2c feeds/packages/lang/node-cylon-i2c
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-cylon feeds/packages/lang/node-cylon
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-eddystone-beacon feeds/packages/lang/node-eddystone-beacon
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-ejdb2_node feeds/packages/lang/node-ejdb2_node
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-enocean-utils feeds/packages/lang/node-enocean-utils
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-epoll feeds/packages/lang/node-epoll
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-exorcist feeds/packages/lang/node-exorcist
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-expat feeds/packages/lang/node-expat
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-express feeds/packages/lang/node-express
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-ffi feeds/packages/lang/node-ffi
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-firmata feeds/packages/lang/node-firmata
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-forever feeds/packages/lang/node-forever
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-fuse-bindings feeds/packages/lang/node-fuse-bindings
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-hap-nodejs feeds/packages/lang/node-hap-nodejs
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-hashmap feeds/packages/lang/node-hashmap
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-hashtable feeds/packages/lang/node-hashtable
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-hid-stream feeds/packages/lang/node-hid-stream
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-hid feeds/packages/lang/node-hid
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-homebridge feeds/packages/lang/node-homebridge
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-i2c-bus feeds/packages/lang/node-i2c-bus
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-ibmiotf feeds/packages/lang/node-ibmiotf
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-ideino-linino-lib feeds/packages/lang/node-ideino-linino-lib
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-inspect feeds/packages/lang/node-inspect
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-johnny-five feeds/packages/lang/node-johnny-five
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-jsonfile feeds/packages/lang/node-jsonfile
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-lambda feeds/packages/lang/node-lambda
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-level feeds/packages/lang/node-level
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-leveldown feeds/packages/lang/node-leveldown
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-levelup feeds/packages/lang/node-levelup
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-logfmt feeds/packages/lang/node-logfmt
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-lwm2m-node-lib feeds/packages/lang/node-lwm2m-node-lib
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-mdns feeds/packages/lang/node-mdns
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-megahash feeds/packages/lang/node-megahash
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-mknod feeds/packages/lang/node-mknod
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-mocha feeds/packages/lang/node-mocha
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-mqtt feeds/packages/lang/node-mqtt
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-muzzley-client feeds/packages/lang/node-muzzley-client
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-nconf feeds/packages/lang/node-nconf
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-net-ping feeds/packages/lang/node-net-ping
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-nino-io feeds/packages/lang/node-nino-io
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-nitrogen-cli feeds/packages/lang/node-nitrogen-cli
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-nitrogen-leveldb-store feeds/packages/lang/node-nitrogen-leveldb-store
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-nitrogen feeds/packages/lang/node-nitrogen
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-noble feeds/packages/lang/node-noble
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-npm-check-updates feeds/packages/lang/node-npm-check-updates
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-onoff feeds/packages/lang/node-onoff
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-openzwave-shared feeds/packages/lang/node-openzwave-shared
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-pi-spi feeds/packages/lang/node-pi-spi
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-pm2 feeds/packages/lang/node-pm2
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-pty feeds/packages/lang/node-pty
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-red-contrib-gpio feeds/packages/lang/node-red-contrib-gpio
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-red-contrib-homekit feeds/packages/lang/node-red-contrib-homekit
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-red-contrib-modbus feeds/packages/lang/node-red-contrib-modbus
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-red-node-arduino feeds/packages/lang/node-red-node-arduino
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-red feeds/packages/lang/node-red
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-reverse-wstunnel feeds/packages/lang/node-reverse-wstunnel
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-rimraf feeds/packages/lang/node-rimraf
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-rpi-gpio feeds/packages/lang/node-rpi-gpio
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-rpio feeds/packages/lang/node-rpio
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-serialport-bindings feeds/packages/lang/node-serialport-bindings
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-serialport feeds/packages/lang/node-serialport
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-simple-xmpp feeds/packages/lang/node-simple-xmpp
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-sleep feeds/packages/lang/node-sleep
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-socket.io-client-legacy feeds/packages/lang/node-socket.io-client-legacy
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-socket.io-client feeds/packages/lang/node-socket.io-client
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-socket.io-legacy feeds/packages/lang/node-socket.io-legacy
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-socket.io feeds/packages/lang/node-socket.io
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-soracom feeds/packages/lang/node-soracom
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-spi-device feeds/packages/lang/node-spi-device
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-sqlite3 feeds/packages/lang/node-sqlite3
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-static feeds/packages/lang/node-static
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-statvfs feeds/packages/lang/node-statvfs
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-tty.js feeds/packages/lang/node-tty.js
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-twilio feeds/packages/lang/node-twilio
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-typescript feeds/packages/lang/node-typescript
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-uglify-js feeds/packages/lang/node-uglify-js
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-usb feeds/packages/lang/node-usb
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-utf-8-validate feeds/packages/lang/node-utf-8-validate
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-websocket feeds/packages/lang/node-websocket
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-ws feeds/packages/lang/node-ws
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-xmpp feeds/packages/lang/node-xmpp
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-yarn feeds/packages/lang/node-yarn
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node-zigbee2mqtt feeds/packages/lang/node-zigbee2mqtt
svn co https://github.com/project-openwrt/packages/branches/openwrt-19.07/lang/node feeds/packages/lang/node
