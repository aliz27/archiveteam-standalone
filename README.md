This image will run a Archiveteam standalone grab using the scripts from Archivteams Github repository

Running a project:

docker run -d --name project -e NICK=nick -e CONCURRENT=threads aliz27/archiveteam-standalone repository

docker run -d --name ftp -e NICK=aliz -e CONCURRENT=2 aliz27/archiveteam-standalone ftp-grab
