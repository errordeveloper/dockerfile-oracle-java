FROM        progrium/busybox 
MAINTAINER  Ilya Dmitrichenko <errordeveloper@gmail.com>

RUN opkg-install curl

RUN curl --silent --location --retry 3 --header "Cookie: oraclelicense=accept-securebackup-cookie;" http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jdk-8u20-linux-x64.tar.gz --output jdk.tgz
RUN tar xzvf /tmp/jdk.tgz -C /usr/

ENV JAVA_HOME /usr/jdk1.8.0_20/

ENTRYPOINT ["/usr/jdk1.8.0_20/bin/java"]
CMD ["-version"]
