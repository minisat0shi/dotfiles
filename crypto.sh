# Script to encrypt files
# Usage: 
#	./crypto.sh encrypt <sourcefile> <dest.enc>
#	./crypto.sh decrypt <source.enc> <destfile>

source config.sh

# Decrypt file
# printf "Decrypting $3 to $3..."
# case $1 in
# 	"encrypt") openssl enc -aes-256-cbc -salt -in $2 -out $3 -k "$CRYPTO_PW"; exit;;
# 	"decrypt") openssl enc -aes-256-cbc -d    -in $2 -out $3 -k "$CRYPTO_PW"; exit;;
# 	*) printf "crypto.sh: Command mot supported: only use encrypt/decrypt";;
# esac

opts="--no-tty --batch --passphrase-fd 0"

case $1 in 
	"encrypt") echo "$CRYPTO_PW" | gpg $opts --output $3 --symmetric $2;;
	"decrypt") echo "$CRYPTO_PW" | gpg $opts --output $3 --decrypt $2;;
	*) printf "crypto: Command not supported, only use encrypt/decrypt";;
esac
