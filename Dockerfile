FROM ubuntu:20.04

# Set Environment
ENV DEBIAN_FRONTEND="noninteractive"

# Installing Dependencies
RUN apt-get -qq -y update && apt-get -qq -y upgrade && apt-get -qq install -y software-properties-common \
        && add-apt-repository ppa:rock-core/qt4 \
        && apt-get -qq install -y python3 python3-pip \
        pv jq locales python3-lxml xz-utils neofetch \
        git g++ gcc autoconf automake \
        m4 libtool qt4-qmake make libqt4-dev libcurl4-openssl-dev \
        libcrypto++-dev libsqlite3-dev libc-ares-dev \
        libsodium-dev libnautilus-extension-dev \
        
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python3","rss.py"]
