#!/bin/sh

if [ -z ${NICK} ]; then
	echo "No nick specified"
	exit 1
fi

if [ -z ${CONCURRENT} ]; then
	CONCURRENT=2
fi

if [ -z ${PROJECT} ]; then
	echo "No project defined"
	exit 1
fi

if [ ! -d ${PROJECT} ]; then
	git clone https://github.com/archiveteam/${PROJECT}
	cd ${PROJECT}
else
	cd ${PROJECT}
	git pull
fi

run-pipeline --disable-web-server --concurrent ${CONCURRENT} --auto-update pipeline.py ${NICK}
