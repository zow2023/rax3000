#!/bin/bash
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)


git clone https://github.com/kiddin9/luci-app-dnsfilter package/luic-app-dnsfilter
git clone https://github.com/sirpdboy/luci-app-parentcontrol package/luci-app-parentcontrol
#git clone https://github.com/kingyond/luci-app-accesscontrol-plus package/luci-app-accesscontrol-plus
#git clone https://github.com/sirpdboy/sirpdboy-package package/sirpdboy-package

rm -rf feeds/packages/net/{xray-core,chinadns-ng,hysteria,v2ray-plugin}

rm -rf feeds/luci/applications/luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall/packages
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci 
#git clone https://github.com/xiaorouji/openwrt-passwall.git -b  luci-smartdns-dev package/passwall/luci
#git clone https://github.com/fw876/helloworld.git -b master package/helloworld
rm -rf package/helloworld
git clone https://github.com/fw876/helloworld.git package/helloworld

#git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-theme-argon-config

rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang -b 1.21 feeds/packages/lang/golang

find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f

git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
 


# Modify default IP
sed -i 's/192.168.6.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
