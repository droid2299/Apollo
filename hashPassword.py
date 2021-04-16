import hashlib


def hashedPassword(password):

	text = password.encode()
	encrypted = hashlib.sha256(text).hexdigest()
	print(encrypted)
	return encrypted