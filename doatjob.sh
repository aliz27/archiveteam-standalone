#!/bin/sh

if [ -z ${NICK} ]; then
	echo "No nick specified"
	exit 1
fi

if [ -z ${CONCURRENT} ]; then
	CONCURRENT=2
fi

if [ -z ${1} ]; then
	echo "No project defined"
	exit 1
fi

if [ ! -d ${1} ]; then
	git clone https://github.com/archiveteam/${1}
	cd ${1}
else
	cd ${1}
	git pull
fi

run-pipeline --disable-web-server --concurrent ${CONCURRENT} --auto-update pipeline.py ${NICK}
