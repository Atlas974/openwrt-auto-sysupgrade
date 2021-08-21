#!/bin/sh
#
# Tested on "OpenWrt SNAPSHOT r17368-c18f91d118"
# "curl" must be installed beforehand: run "opkg update && opkg install curl"
# Pass 'kernel', 'factory' or 'sysupgrade' in parameter to download a specific binary.

lower() {
  echo "$1" | awk '{print tolower($0)}'
}

norm() {
  echo "$1" | awk '{gsub("[^[:alnum:]]", "\.?", $0); print}'
}

. "./openwrt_vars.sh" # TARGET SUB_TARGET BRAND MODEL VERSION
URL="https://downloads.openwrt.org/snapshots/targets/$(lower $TARGET)/$(lower $SUB_TARGET)/"

DATE="$(date +%Y-%m-%d)"
SUM_FILE="${DATE}_$(lower $BRAND)_$(lower $MODEL)_$(lower $VERSION).sha256"

printf "\n --- DOWNLOADING FILES --- \n"
curl --silent "${URL}sha256sums" |
  grep -iE "$(norm $BRAND)" | grep -iE "$(norm $MODEL)" | grep -iE "$(norm $VERSION)" | grep -iE "$1" |
  tee "$SUM_FILE" | cut -d '*' -f 2 | while read -r fname; do wget "${URL}${fname}"; done

printf "\n --- CHECKING FILES --- \n"
sed -ri "s/\*(.*\/)/\*/g" "$SUM_FILE" # removes directories in paths
sha256sum -c "$SUM_FILE"

cut -d '*' -f 2 "$SUM_FILE" | while read -r file; do
  mv "$file" "${DATE}_${file}"
done
