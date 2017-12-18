SET arg1=%1
echo test
IF [%1] == [] (
	echo Error: Argument missing
) ELSE (
	openssl req -new -nodes -out %arg1%req.pem -keyout private\%arg1%key.pem -config .\openssl.cnf
	
	IF NOT EXIST %arg1%req.pem (
		create_signing_request.sh %arg1%
	) ELSE (
		openssl ca -extensions v3_req -out %arg1%cert.pem -config .\openssl.cnf -infiles %arg1%req.pem
	)
)

