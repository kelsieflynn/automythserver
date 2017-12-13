#!/bin/sh
BUILD=68;#++
nextBUILD=$((++BUILD))
DATESTAMP=`date +%Y%m%d`
NAME=automythsvr-hdhr-eit
MYTHVER=0.28.1
MYTHGITREL=62-g36fe0

if [ ! -d ./LOGS ];then
mkdir -v ./LOGS
fi
nohup livecd-creator -v -c $NAME-$MYTHVER-$MYTHGITREL.cfg -f $NAME-$MYTHVER-r$BUILD -t $NAME-$MYTHVER-$MYTHGITREL-$DATESTAMP-r$BUILD --product $NAME-$MYTHVER-$MYTHGITREL-$DATESTAMP-r$BUILD  --tmpdir=./$NAME-$MYTHVER-$MYTHGITREL-$DATESTAMP-r$BUILD-TMPDIR --cache=$NAME-$MYTHVER-$MYTHGITREL-$DATESTAMP-r$BUILD-CACHEDIR > ./LOGS/$NAME-$MYTHVER-$MYTHGITREL-$DATESTMP-r$BUILD.nohup.log  && sed -i "/#++$/s/=.*#/=$nextBUILD;#/" ${0} &
