for C in -aes-256-ctr -aes-256-cbc
do
  echo "===== CIPHER $C ====="
  for o in \
    "-md md5 -kfile /secure/pwd.txt" \
    "-md sha256 -kfile /secure/pwd.txt" \
    "-pbkdf2 -pass file:/secure/pwd.txt" \
    "-pbkdf2 -md sha256 -pass file:/secure/pwd.txt"
  do
    echo "=== Trying: $C $o"
    openssl enc -d $C $o -bufsize 8388608 \
      -in TARFILENAME.tar -out dec.gz 2>/dev/null
    head -c 2 dec.gz | xxd
    file dec.gz | head -n 1
  done
done


for o in \
  "-md md5 -kfile /secure/pwd.txt" \
  "-md sha256 -kfile /secure/pwd.txt" \
  "-pbkdf2 -pass file:/secure/pwd.txt" \
  "-pbkdf2 -md sha256 -pass file:/secure/pwd.txt"
do
  echo "=== Trying: $o"
  openssl enc -d -aes-256-ctr $o -bufsize 8388608 \
    -in TARFILENAME.tar -out /tmp/dec.gz 2>/dev/null
  head -c 2 /tmp/dec.gz | xxd
  file /tmp/dec.gz | head -n 1
done
