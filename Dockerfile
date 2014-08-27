FROM        progrium/busybox 
MAINTAINER  Ilya Dmitrichenko <errordeveloper@gmail.com>

RUN opkg-install curl ca-certificates

RUN curl \
  --silent \
  --location \
  --retry 3 \
  --cacert /etc/ssl/certs/GeoTrust_Global_CA.crt \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jdk-8u20-linux-x64.tar.gz" \
    | gunzip \
    | tar x -C /usr/

ENV JAVA_HOME /usr/jdk1.8.0_20

ENV PATH ${PATH}:${JAVA_HOME}/bin

ENTRYPOINT [ "java" ]
CMD [ "-version" ]
