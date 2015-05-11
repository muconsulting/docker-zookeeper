FROM muconsulting/java7
MAINTAINER Sylvain Gibier <sylvain@munichconsulting.de>

RUN apt-get update
RUN apt-get install -y git curl build-essential make gcc wget

RUN wget http://mirror.nexcess.net/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
RUN tar xzf zookeeper-3.4.6.tar.gz

ADD zoo.cfg /zookeeper-3.4.6/conf/zoo.cfg
ADD log4j.properties /zookeeper-3.4.6/log4j.properties

VOLUME [ "/data" ]
VOLUME [ "/logs" ]

EXPOSE 2181

CMD ["zookeeper-3.4.6/bin/zkServer.sh", "start-foreground"]
