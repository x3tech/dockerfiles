#!/bin/bash

if [ "$1" == "start" -a ! -f "/etc/ssl/hipache.crt" ]; then
  # Generate the certificate if it does not yet exist

  if [ -z "$CERT_SUBJECT" ]; then
    echo "Empty CERT_SUBJECT!"
    exit 1
  fi
  
  openssl req -nodes -new -x509 \
          -subj "$CERT_SUBJECT" \
          -keyout /etc/ssl/hipache.key \
          -out /etc/ssl/hipache.crt
fi 
