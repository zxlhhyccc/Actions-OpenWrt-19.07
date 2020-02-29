#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
git clone https://github.com/zxlhhyccc/bf-package.git package/bf-package
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/target-linux-generic-pending/601-add-kernel-imq-support.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/target-linux-generic-pending/607-tcp_bbr-adapt-cwnd-based-on-ack-aggregation-estimation.patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/target-linux-generic-pending/608-add-kernel-gargoyle-netfilter-match-modules.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/target-linux-generic/hack-4.14/202-reduce_module_size.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/target-linux-generic/hack-4.14/645-netfilter-connmark-introduce-set-dscpmark.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/target-linux-generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/target-linux-generic/hack-4.14/953-use-nf_ct_helper_log.patch
svn co https://github.com/zxlhhyccc/acc-imq/trunk/tools/ucl tools/ucl
svn co https://github.com/zxlhhyccc/acc-imq/trunk/tools/upx tools/upx
rm -f ./tools/Makefile
wget -P ./tools https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/tools/Makefile
rm -f ./target/linux/generic/config-4.14
wget -P ./target/linux/generic https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/target-linux-generic/config-4.14
rm -f ./target/linux/x86/Makefile
wget -P ./target/linux/x86 https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/x86/Makefile
rm -rf ./package/network/config/firewall
svn co https://github.com/zxlhhyccc/acc-imq/trunk/19.07/firewall package/network/config/firewall
rm -rf ./package/network/utils/iptables
svn co https://github.com/zxlhhyccc/acc-imq/trunk/19.07/iptables package/network/utils/iptables
rm -rf ./package/network/services/uhttpd
svn co https://github.com/zxlhhyccc/acc-imq/trunk/19.07/uhttpd package/network/services/uhttpd
rm -f ./include/target.mk
wget -P ./include https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/include/target.mk
rm -f ./include/netfilter.mk
wget -P ./include https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/include//netfilter.mk
rm -f ./package/kernel/linux/modules/netdevices.mk
wget -P ./package/kernel/linux/modules https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/package-kernel-linux-modules/netdevices.mk
rm -f ./package/kernel/linux/modules/netfilter.mk
wget -P ./package/kernel/linux/modules https://raw.githubusercontent.com/zxlhhyccc/acc-imq/master/19.07/package-kernel-linux-modules/netfilter.mk
