#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# 添加默认编译包
rm -f ./include/target.mk
wget -P ./include/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/include/target.mk
rm -f ./include/netfilter.mk
wget -P ./include/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/include/netfilter.mk
# kernel支持及修改连接数
rm -f ./package/kernel/linux/modules/netdevices.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/modules/netdevices.mk
rm -f ./package/kernel/linux/modules/netfilter.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/modules/netfilter.mk
rm -f ./package/kernel/linux/modules/netsupport.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/modules/netsupport.mk
rm -f ./package/kernel/linux/modules/crypto.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/modules/crypto.mk
sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
# 修改network中防火墙等源码包
rm -rf ./package/network/config/firewall
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/config/firewall package/network/config/firewall
rm -rf ./package/network/utils/iptables
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/utils/iptables package/network/utils/iptables
rm -rf ./package/network/services/uhttpd
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/services/uhttpd package/network/services/uhttpd
# 修改feeds里的luci-app-firewall加速开关等源码包
wget -P ./feeds/luci/applications/luci-app-firewall/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/luci/applications/luci-app-firewall/patches/001-luci-app-firewall-Enable-FullCone-NAT.patch
pushd feeds/luci/applications/luci-app-firewall
patch -p1 < 001-luci-app-firewall-Enable-FullCone-NAT.patch
popd
# 添加wifi的MU-MIMO功能
wget -P ./feeds/luci/modules/luci-mod-network/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/luci/modules/luci-mod-network/patches/001-wifi-add-MU-MIMO-option.patch
pushd feeds/luci/modules/luci-mod-network
patch -p1 < 001-wifi-add-MU-MIMO-option.patch
popd
# 添加procd的uajial补丁去除系统日志错误
# rm -rf ./package/system/procd
# svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/system/procd package/system/procd
# 添加内核补丁
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/601-add-kernel-imq-support.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/607-tcp_bbr-adapt-cwnd-based-on-ack-aggregation-estimation.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/608-add-kernel-gargoyle-netfilter-match-modules.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/760-net-usb-aqc111-Driver-skeleton-for-Aquantia-AQtionUSB-to-5GbE.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/hack-4.14/202-reduce_module_size.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/hack-4.14/645-netfilter-connmark-introduce-set-dscpmark.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/hack-4.14/953-use-nf_ct_helper_log.patch
rm -f ./target/linux/generic/config-4.14
wget -P ./target/linux/generic/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/config-4.14
rm -f ./target/linux/x86/Makefile
wget -P ./target/linux/x86/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/x86/Makefile
wget -P ./target/linux/x86/patches-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/x86/patches-4.14/900-x86-Enable-fast-strings-on-Intel-if-BIOS-hasn-t-already.patch
# 添加upx压缩
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/tools/ucl tools/ucl
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/tools/upx tools/upx
rm -f ./tools/Makefile
wget -P ./tools/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/tools/Makefile
# 将tty、ksmd所在服务目录改到系统、网络存储目录
sed -i 's/services/nas/g' feeds/luci/applications/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json
sed -i 's/services/system/g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
# 去除feeds中的material主题多余固件名
sed -i 's#boardinfo.hostname or "?"#""#g' feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
# 修改transmission依赖
wget -P ./feeds/packages/net/transmission-web-control/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/packages/net/transmission-web-control/patches/001-transmission-web-control-dbengine.patch
pushd feeds/packages/net/transmission-web-control
patch -p1 < 001-transmission-web-control-dbengine.patch
popd
wget -P ./feeds/luci/applications/luci-app-transmission/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/luci/applications/luci-app-transmission/patches/001-luci-app-transmission-with-dbengine.patch
pushd feeds/luci/applications/luci-app-transmission
patch -p1 < 001-luci-app-transmission-with-dbengine.patch
popd
# 修改sqm-scripts汉化help
rm -rf ./feeds/packages/net/sqm-scripts
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/feeds/packages/net/sqm-scripts feeds/packages/net/sqm-scripts
# 添加feeds里的依赖包
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/feeds/packages/lang/python/Flask-RESTful feeds/packages/lang/python/Flask-RESTful
# 添加netdata显示中文日期补丁及升级到1.22.1
sed -i 's/1.19.0/1.22.1/g' feeds/packages/admin/netdata/Makefile
sed -i 's/007656f639d3544698af503f35550aeb4d4d5a06b81801bf5acf4ac21db68f6e/6efd785eab82f98892b4b4017cadfa4ce1688985915499bc75f2f888765a3446/g' feeds/packages/admin/netdata/Makefile
wget -P ./feeds/packages/admin/netdata/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/packages/admin/netdata/patches/002-netdata-with-dbengine.patch
pushd feeds/packages/admin/netdata
patch -p1 < 002-netdata-with-dbengine.patch
popd
wget -P ./feeds/packages/admin/netdata/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/packages/admin/netdata/patches/003-netdata-init-with-TZ.patch
pushd feeds/packages/admin/netdata
patch -p1 < 003-netdata-init-with-TZ.patch
popd
wget -P ./feeds/packages/admin/netdata/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/packages/admin/netdata/patches/004-netdata-with-config.patch
pushd feeds/packages/admin/netdata
patch -p1 < 004-netdata-with-config.patch
popd
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/master/feeds/packages/libs/libJudy feeds/packages/libs/libJudy
# 升级feeds中的exfat-nofuse源码
rm -rf ./feeds/packages/kernel/exfat-nofuse
svn co  https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/feeds/packages/kernel/exfat-nofuse feeds/packages/kernel/exfat-nofuse
# 添加feeds中的docker-ce源码及依赖
svn co  https://github.com/openwrt/packages/trunk/utils/docker-ce feeds/packages/utils/docker-ce
svn co  https://github.com/openwrt/packages/trunk/utils/containerd feeds/packages/utils/containerd
svn co  https://github.com/openwrt/packages/trunk/utils/cgroupfs-mount feeds/packages/utils/cgroupfs-mount
svn co  https://github.com/openwrt/packages/trunk/utils/libnetwork feeds/packages/utils/libnetwork
svn co  https://github.com/openwrt/packages/trunk/utils/runc feeds/packages/utils/runc
svn co  https://github.com/openwrt/packages/trunk/utils/tini feeds/packages/utils/tini
# 去除cups中的libcups
# rm -f ./packages/openwrt-package/ctcgfw/cups/Makefile
# wget -P ./packages/openwrt-package/ctcgfw/cups/ https://raw.githubusercontent.com/project-openwrt/openwrt-latest/master/package/ctcgfw/cups/Makefile
# 删除feeds里的与已有的冲突源码包
rm -rf ./feeds/packages/utils/syncthing
rm -rf ./feeds/luci/applications/luci-app-ksmbd
