IF NOT EXIST cacert.jks (
	echo No cacert.jks found!
	exit
)
copy /s cacerts.jks ..\
IF NOT EXIST client.jks (
	echo No client.jks found!
	exit
)
copy /s cacerts.jks ..\ssl.socket\
IF NOT EXIST server.jks (
	echo No server.jks found!
	exit
)
copy /s cacerts.jks ..\ssl.socket\