SET arg1=%1
IF [%1] == [] (
	echo no argument delivered
) ELSE (
	echo test
)

IF NOT EXIST %arg1%cert.pem (
	echo No such file exists
) ELSE (
	openssl pkcs12 -export -in %arg1%cert.pem -inkey private\%arg1%key.pem > %arg1%.p12
	keytool -importkeystore -srckeystore %arg1%.p12 -srcstoretype pkcs12 -destkeystore %arg1%.jks
	del %arg1%.p12
)


