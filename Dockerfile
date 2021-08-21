FROM openwrtorg/rootfs

RUN mkdir -p "/var/lock/" && opkg update && opkg install curl

WORKDIR /app

COPY src/ .

CMD ["/bin/sh", "-c", "./get-update.sh 'kernel'"]
