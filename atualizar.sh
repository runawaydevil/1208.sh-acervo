#!/bin/sh
set -eu
cd "$(dirname "$0")"
date
PROOF_GPG="C:/Program Files/GnuPG/bin/gpg.exe" ../proof-pablo/proof.exe atualizar
./enviar.sh
git add -A estados
git diff --cached --quiet || git commit -q -m "Carimbos atualizados"
