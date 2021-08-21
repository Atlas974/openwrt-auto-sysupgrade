# Dependencies
````bash
$ opkg update && opkg install curl
````

# Test
````bash
$ docker build -t openwrt-auto-sysupgrade .
$ docker run -it openwrt-auto-sysupgrade
````

# Expected output
````bash
 --- DETECTED PARAMETERS ---
TARGET          'x86'
SUB_TARGET      '64'
BRAND           ''
MODEL           ''
VERSION         ''

 --- DOWNLOADING FILES ---
Downloading 'https://downloads.openwrt.org/snapshots/targets/x86/64/kernel-debug.tar.zst'
Connecting to 168.119.138.211:443
Writing to 'kernel-debug.tar.zst'
kernel-debug.tar.zst 100% |*******************************| 87278k  0:00:00 ETA
Download completed (89372712 bytes)
Downloading 'https://downloads.openwrt.org/snapshots/targets/x86/64/openwrt-x86-64-generic-kernel.bin'
Connecting to 168.119.138.211:443
Writing to 'openwrt-x86-64-generic-kernel.bin'
openwrt-x86-64-gener 100% |*******************************|  5028k  0:00:00 ETA
Download completed (5149280 bytes)
Downloading 'https://downloads.openwrt.org/snapshots/targets/x86/64/packages/kernel_5.4.140-1-f4f828d9410695551b33e561b7485d35_x86_64.ipk'
Connecting to 168.119.138.211:443
Writing to 'kernel_5.4.140-1-f4f828d9410695551b33e561b7485d35_x86_64.ipk'
kernel_5.4.140-1-f4f 100% |*******************************|   812   0:00:00 ETA
Download completed (812 bytes)

 --- CHECKING FILES ---
kernel-debug.tar.zst: OK
openwrt-x86-64-generic-kernel.bin: OK
kernel_5.4.140-1-f4f828d9410695551b33e561b7485d35_x86_64.ipk: OK
````
