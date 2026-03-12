#!/usr/bin/bash
# properties = {properties}
export HOME=$(pwd)
. /etc/profile

tar --extract -z --file root://eosuser.cern.ch//eos/user/l/lvomberg/venvs/snakemake.tar.gz
conda activate snakemake

snakemake "$@"