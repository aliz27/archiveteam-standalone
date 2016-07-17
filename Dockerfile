FROM ubuntu
MAINTAINER Daniel Ahlberg <aliz@tamperd.net>
RUN apt-get update && apt-get install -y git-core libgnutls-dev lua5.1 liblua5.1-0 liblua5.1-0-dev screen python-dev python-pip bzip2 zlib1g-dev build-essential automake curl flex unzip && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade seesaw requests --no-cache-dir
RUN curl -o /tmp/wget-lua.tar.bz2 http://warriorhq.archiveteam.org/downloads/wget-lua/wget-1.14.lua.LATEST.tar.bz2 \
	&& cd /tmp && tar -jxvf wget-lua.tar.bz2 && cd /tmp/wget-1.14.lua*; ./configure; make && cp ./src/wget /usr/bin/wget-lua && rm -fr /tmp/wget*
RUN curl -L -o /tmp/wpull.zip https://launchpad.net/wpull/trunk/v1.2.3/+download/wpull-1.2.3-linux-x86_64-3.4.3-20160302011013.zip \
	&& cd /tmp && unzip wpull.zip && mv wpull /usr/bin \
	&& rm -fr /tmp/wpull*
COPY doatjob.sh doatjob.sh
ENTRYPOINT ["./doatjob.sh"]
