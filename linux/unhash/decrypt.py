#!/usr/bin/python

#need to install pycryptodome
#pip install pycryptodome

import base64
from Crypto.Cipher import DES3

secret_input = str(input("Input value 'secret' from remmina.pref: "))
password_input = str(input("Input value 'password' from *.remmina: "))

#print(secret_input)
#print(password_input)

secret = base64.b64decode(secret_input)
password = base64.b64decode(password_input)

print(DES3.new(secret[:24], DES3.MODE_CBC, secret[24:]).decrypt(password).decode('utf-8'))