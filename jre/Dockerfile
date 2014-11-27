FROM        progrium/busybox 
MAINTAINER  Ilya Dmitrichenko <errordeveloper@gmail.com>

RUN opkg-install curl ca-certificates

RUN curl \
  --silent \
  --location \
  --retry 3 \
  --cacert /etc/ssl/certs/GeoTrust_Global_CA.crt \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/8u25-b17/server-jre-8u25-linux-x64.tar.gz" \
    | gunzip \
    | tar x -C /usr/

ENV JAVA_HOME /usr/jdk1.8.0_25

RUN rm -rf $JAVA_HOME/man

ENV PATH ${PATH}:${JAVA_HOME}/bin

ENTRYPOINT [ "java" ]
CMD [ "-version" ]
