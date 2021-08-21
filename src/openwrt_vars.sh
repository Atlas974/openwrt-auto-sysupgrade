#!/bin/sh
#
# Tested on "OpenWrt SNAPSHOT r17118-8f7e6db230"

. "/etc/openwrt_release"

TARGET=${DISTRIB_TARGET%/*}
SUB_TARGET=${DISTRIB_TARGET#*/}

read -r BRAND MODEL VERSION <<EOF
$(grep 'machine' '/proc/cpuinfo' | cut -d ':' -f 2)
EOF

export TARGET SUB_TARGET BRAND MODEL VERSION

printf " --- DETECTED PARAMETERS --- \n"
printf "TARGET\t\t'%s'\n" "$TARGET"
printf "SUB_TARGET\t'%s'\n" "$SUB_TARGET"
printf "BRAND\t\t'%s'\n" "$BRAND"
printf "MODEL\t\t'%s'\n" "$MODEL"
printf "VERSION\t\t'%s'\n" "$VERSION"
