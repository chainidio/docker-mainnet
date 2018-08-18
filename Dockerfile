FROM java:8-jre

MAINTAINER Damien Plenard "damien+docker@plenard.me"

ADD https://chainplatform.sgp1.digitaloceanspaces.com/ChainCoin.zip /tmp/ChainCoin.zip

RUN unzip /tmp/ChainCoin.zip -d /usr/local/
WORKDIR /usr/local/ChainCoin
RUN echo 'bcid.allowedBotHosts=*' >> conf/bcid.properties
RUN echo 'bcid.apiServerHost=0.0.0.0' >> conf/bcid.properties

# clean
RUN rm /tmp/ChainCoin.zip

EXPOSE 7876
ENTRYPOINT ["java", "-jar", "bcid.jar"]
