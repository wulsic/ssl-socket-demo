del certindex*
del serial*
del *.pem

IF NOT EXIST "private" (
	mkdir "private"
) ELSE (
	rmdir /s /q "private"
)

IF NOT EXIST "certs" (
	mkdir "certs"
) ELSE (
	rmdir /s /q "certs"
)

copy NUL certindex.txt
echo "100001" > serial

openssl req -new -x509 -extensions v3_ca -keyout private\cakey.pem -out cacert.pem -days 365 -config .\openssl.cnf
pause