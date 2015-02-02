FROM        progrium/busybox 
MAINTAINER  Yun Zhi Lin <yun@trunkplatform.com>

RUN opkg-install curl ca-certificates

ENV JAVA_HOME /usr/jdk1.8.0_31

RUN curl \
  --silent \
  --location \
  --retry 3 \
  --cacert /etc/ssl/certs/GeoTrust_Global_CA.crt \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.tar.gz" \
    | gunzip \
    | tar x -C /usr/ \
    && ln -s $JAVA_HOME /usr/java \
    && rm -rf $JAVA_HOME/src.zip $JAVA_HOME/javafx-src.zip $JAVA_HOME/man

ENV PATH ${PATH}:${JAVA_HOME}/bin

ENTRYPOINT [ "java" ]
CMD [ "-version" ]
