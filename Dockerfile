FROM jorgenfb/nginx-nodejs AS hoster
FROM node:8.0-alpine AS builder

MAINTAINER Vladimir Mechkauskas (elartix@gmail.com)

RUN mkdir -p /usr/src/dftangular

WORKDIR /usr/src/dftangular

COPY . /usr/src/dftangular/

RUN npm install -g bower gulp gulp-cli
RUN npm install && bower install
# RUN bower install

RUN gulp build
