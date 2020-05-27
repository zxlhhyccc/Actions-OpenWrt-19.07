#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# 添加插件
# svn co https://github.com/zxlhhyccc/bf-package/trunk/ctcgfw package/ctcgfw
# svn co https://github.com/zxlhhyccc/bf-package/trunk/lean package/lean
# svn co https://github.com/zxlhhyccc/bf-package/trunk/lienol package/lienol
# svn co https://github.com/zxlhhyccc/bf-package/trunk/ntlf9t package/ntlf9t
# svn co https://github.com/zxlhhyccc/bf-package/trunk/zxlhhyccc package/zxlhhyccc
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
rm -f ./package/kernel/linux/files/sysctl-nf-conntrack.conf
wget -P ./package/kernel/linux/files/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/files/sysctl-nf-conntrack.conf
# 修改network中防火墙等源码包
rm -rf ./package/network/config/firewall
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/config/firewall package/network/config/firewall
rm -rf ./package/network/utils/iptables
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/utils/iptables package/network/utils/iptables
rm -rf ./package/network/services/uhttpd
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/services/uhttpd package/network/services/uhttpd
# 添加procd的uajial补丁去除系统日志错误
# rm -rf ./package/system/procd
# svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/system/procd package/system/procd
# 添加内核补丁
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/601-add-kernel-imq-support.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/607-tcp_bbr-adapt-cwnd-based-on-ack-aggregation-estimation.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/608-add-kernel-gargoyle-netfilter-match-modules.patch
# wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/760-net-usb-aqc111-Driver-skeleton-for-Aquantia-AQtionUSB-to-5GbE.patch
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
# 将tty所在服务菜单改到系统菜单
sed -i 's/services/system/g' feeds/luci/applications/luci-app-ttyd/luasrc/controller/ttyd.lua
# 去除feeds中的material主题多余固件名
rm -f ./feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
wget -P ./feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
# 防火墙添加FullCone NAT
rm -rf ./feeds/luci/applications/luci-app-firewall
svn co  https://github.com/project-openwrt/luci/branches/openwrt-19.07/applications/luci-app-firewall feeds/luci/applications/luci-app-firewall
# 更新feeds中的transmission源码依赖
rm -rf ./feeds/luci/applications/luci-app-transmission
svn co  https://github.com/project-openwrt/luci/branches/openwrt-19.07/applications/luci-app-transmission feeds/luci/applications/luci-app-transmission
rm -rf ./feeds/packages/net/transmission-web-control
svn co  https://github.com/project-openwrt/packages/branches/openwrt-19.07/net/transmission-web-control feeds/packages/net/transmission-web-control
rm -rf ./feeds/packages/net/transmission
svn co  https://github.com/project-openwrt/packages/branches/openwrt-19.07/net/transmission feeds/packages/net/transmission
# 修改sqm-scripts汉化help
rm -rf ./feeds/packages/net/sqm-scripts
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/feeds/packages/net/sqm-scripts feeds/packages/net/sqm-scripts
# 添加feeds里的依赖包
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/feeds/packages/lang/python/Flask-RESTful feeds/packages/lang/python/Flask-RESTful
# 升级netdata为master的版本1.20源码
rm -rf ./feeds/packages/admin/netdata
svn co https://github.com/openwrt/packages/trunk/admin/netdata feeds/packages/admin/netdata
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