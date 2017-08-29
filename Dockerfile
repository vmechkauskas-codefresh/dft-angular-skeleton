FROM jorgenfb/nginx-nodejs AS hoster
FROM node:8.0-alpine AS builder

# Install Node.js and other dependencies
RUN apt-get update && \
    apt-get -y install python build-essential

MAINTAINER Vladimir Mechkauskas (elartix@gmail.com)

RUN mkdir -p /usr/src/dftangular

WORKDIR /usr/src/dftangular

COPY . /usr/src/dftangular/

RUN npm install -g bower gulp gulp-cli
RUN npm install && bower install
# RUN bower install

RUN gulp build
