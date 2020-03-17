#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
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
# 替换文件应用新IP为192.168.10.1及默认中文及设置登录密码为admin
rm -f ./package/base-files/files/bin/config_generate
wget -P ./package/base-files/files/bin/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/base-files/files/bin/config_generate
chmod 755 ./package/base-files/files/bin/config_generate
rm -f ./package/base-files/files/etc/shadow
wget -P ./package/base-files/files/etc/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/base-files/files/etc/shadow
# kernel支持及修改连接数
rm -f ./package/kernel/linux/modules/netdevices.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/modules/netdevices.mk
rm -f ./package/kernel/linux/modules/netfilter.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/modules/netfilter.mk
rm -f ./package/kernel/linux/modules/crypto.mk
wget -P ./package/kernel/linux/modules/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/modules/crypto.mk
rm -f ./package/kernel/linux/files/sysctl-nf-conntrack.conf
wget -P ./package/kernel/linux/files/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/linux/files/sysctl-nf-conntrack.conf
# 开启wifi
rm -f ./package/kernel/mac80211/files/lib/wifi/mac80211.sh
wget -P ./package/kernel/mac80211/files/lib/wifi/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/package/kernel/mac80211/files/lib/wifi/mac80211.sh
# openssl升级为1.1.1e
rm -rf ./package/libs/openssl
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/libs/openssl package/libs/openssl
# 修改network中防火墙等源码包
rm -rf ./package/network/config/firewall
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/config/firewall package/network/config/firewall
rm -rf ./package/network/utils/iptables
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/utils/iptables package/network/utils/iptables
rm -rf ./package/network/services/uhttpd
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/network/services/uhttpd package/network/services/uhttpd
# 添加procd的uajial补丁去除系统日志错误
rm -rf ./package/system/procd
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/package/system/procd package/system/procd
# 添加内核补丁
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/601-add-kernel-imq-support.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/607-tcp_bbr-adapt-cwnd-based-on-ack-aggregation-estimation.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/pending-4.14/608-add-kernel-gargoyle-netfilter-match-modules.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/hack-4.14/202-reduce_module_size.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/hack-4.14/645-netfilter-connmark-introduce-set-dscpmark.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/hack-4.14/953-use-nf_ct_helper_log.patch
rm -f ./target/linux/generic/config-4.14
wget -P ./target/linux/generic/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/generic/config-4.14
rm -f ./target/linux/x86/Makefile
wget -P ./target/linux/x86/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/target/linux/x86/Makefile
# 添加upx压缩
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/tools/ucl tools/ucl
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/tools/upx tools/upx
rm -f ./tools/Makefile
wget -P ./tools/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/tools/Makefile
# 将tty所在服务菜单改到系统菜单
rm -f ./feeds/luci/applications/luci-app-ttyd/luasrc/controller/ttyd.lua
wget -P ./feeds/luci/applications/luci-app-ttyd/luasrc/controller/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/luci/applications/luci-app-ttyd/luasrc/controller/ttyd.lua
# 去除feeds中的material主题多余固件名
rm -f ./feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
wget -P ./feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq-bbr/master/19.07/feeds/luci/themes/luci-theme-material/luasrc/view/themes/material/header.htm
# 修复无线错字、增加页面显示cpu使用率
rm -rf ./feeds/luci/modules
svn co  https://github.com/project-openwrt/luci-19.07/trunk/modules feeds/luci/modules
# 添加feeds里的依赖包
svn co https://github.com/zxlhhyccc/acc-imq-bbr/trunk/19.07/feeds/packages/lang/python/Flask-RESTful feeds/packages/lang/python/Flask-RESTful
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
# 升级feeds中的node源码
# rm -rf ./feeds/packages/lang/node
# svn co  https://github.com/openwrt/packages/trunk/lang/node feeds/packages/lang/node
# 删除feeds里的与已有的冲突源码包
rm -rf ./feeds/packages/utils/syncthing
rm -rf ./feeds/luci/applications/luci-app-ksmbd
rm -rf ./feeds/packages/libs/libcups
