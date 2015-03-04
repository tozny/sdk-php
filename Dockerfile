FROM ubuntu:14.04

MAINTAINER kirk@tozny.com
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install build-essential
RUN mkdir /tozny-sdk-php

ADD ./ToznyRemoteAccountAPI.php  /tozny-sdk-php/ToznyRemoteAccountAPI.php
ADD ./ToznyRemoteRealmAPI.php    /tozny-sdk-php/ToznyRemoteRealmAPI.php
ADD ./ToznyRemoteUserAPI.php     /tozny-sdk-php/ToznyRemoteUserAPI.php
ADD ./packaging                  /tozny-sdk-php/packaging

WORKDIR /tozny-sdk-php

RUN ./packaging/debian/create_package.sh .
 
