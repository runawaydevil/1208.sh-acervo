#!/bin/sh
set -eu
cd "$(dirname "$0")"
test -f site/index.html
tar -C site -cf - . | ssh skullserver-claude 'set -eu
destino=/home/prova1208/htdocs/1208.sh
temporaria=$(mktemp -d)
tar -xf - -C "$temporaria"
rsync -a --delete "$temporaria"/ "$destino"/
chown -R prova1208:prova1208 "$destino"
rm -rf "$temporaria"'
echo "Enviado para https://1208.sh"
