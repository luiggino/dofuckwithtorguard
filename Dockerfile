FROM ubuntu:18.04
MAINTAINER Luiggino Obreque Minio <luiggino.om@gmail.com>

RUN apt-get update &&  apt-get install openvpn openssl wget unzip -y

RUN wget https://torguard.net/downloads/OpenVPN-UDP.zip && \
    unzip OpenVPN-UDP.zip

WORKDIR /OpenVPN-UDP

COPY openvpn.sh /usr/local/bin/openvpn.sh

RUN wget https://github.com/SwiTool/DofucksReleases/releases/download/v1.5.4/Dofucks_1.5.4_amd64.deb

RUN apt-get install -y xorg openbox --no-install-recommends

RUN apt-get install -y gconf2 libnotify4 libnss3 libxss1 libappindicator1

RUN dpkg -i Dofucks_1.5.4_amd64.deb

RUN apt-get install -y libasound2

ENV REGION="Chile"
CMD /usr/local/bin/openvpn.sh && /usr/local/bin/dofucks
#CMD /usr/local/bin/dofucks
