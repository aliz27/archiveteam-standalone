This image will run a Archiveteam standalone grab using the scripts from Archivteams Github repository

Running a project:

docker run -d --name project -e NICK=nick -e CONCURRENT=threads -e PROJECT=repository aliz27/archiveteam-standalone

docker run -d --name ftp -e NICK=aliz -e CONCURRENT=2 -e PROJECT=ftp-grab aliz27/archiveteam-standalone
