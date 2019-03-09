#!/bin/bash

read -ep "Your domain name: " domainnme
sed -i "s/arch\.localhost/arch\.$domainnme/" nginx.conf
docker build -t arch-mirroring .

read -ep "Start the container right now(y|n)? " yn

case "$yn" in
  Y*|y* ) docker run --restart always -d -p 80:80 arch-mirroring
      ;;
  N*|n* ) echo "Start container with \"docker run --restart always -d -p 80:80 arch-mirroring.\""
      ;;
esac
