set arg1=%1

IF [%1] == [] (
	ECHO Add argument
) ELSE (
	openssl req -new -nodes -out %arg1%req.pem -keyout private\%arg1%key.pem -config .\openssl.cnf
)


