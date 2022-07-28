echo "${encrypted_credentials}" | base64 --decode | keybase pgp decrypt
