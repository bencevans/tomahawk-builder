
FROM ubuntu:14.04

RUN apt-get update
RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
RUN apt-get update
RUN sudo apt-get install -y build-essential cmake libtag1c2a libtag1-dev libqt4-dev libqt4-sql-sqlite \
                     libphonon-dev libboost-dev libboost-thread-dev zlib1g-dev libgnutls-dev libz-dev \
                     libqjson-dev libattica-dev libqca2-dev libx11-dev pkg-config libqca2-plugin-ossl \
                     libfftw3-dev libsamplerate0-dev libgsasl7-dev libphononexperimental-dev libsparsehash-dev qtkeychain-dev

RUN apt-get install -y git-core

ADD ./libinstalls /tomahawk-builder/libinstalls

WORKDIR /tomahawk-builder/libinstalls

RUN sh libechonest.sh
RUN sh QTweetLib.sh
RUN sh liblastfm.sh
RUN sh jreen.sh
RUN sh clucene.sh
RUN sh quazip.sh

WORKDIR /tomahawk-builder

ADD ./tomahawk.sh /tomahawk-builder/tomahawk.sh

CMD sh tomahawk.sh