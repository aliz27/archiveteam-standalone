#!/bin/sh

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

run-pipeline --disable-web-server --concurrent 2 --auto-update pipeline.py aliz
