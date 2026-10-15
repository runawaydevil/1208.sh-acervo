#!/bin/sh
set -eu
cd "$(dirname "$0")"
git pull --ff-only -q
PROOF_GPG="${PROOF_GPG:-C:/Program Files/GnuPG/bin/gpg.exe}" ../proof-pablo/proof.exe publicar "$@"
git add -A
git diff --cached --quiet || git commit -q -m "Publicação"
git push -q
echo "Publicado. O servidor gera o site em até uma hora, ou na hora com: ssh skullserver-claude systemctl start proof-1208"
