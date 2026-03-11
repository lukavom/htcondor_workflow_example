#!/usr/bin/bash
# properties = {properties}
export HOME=$(pwd)
. /etc/profile
tar --extract -z --file venv_snakemake.tar.gz
module load miniforge/24.11.2-1-py312
. venv_snakemake/bin/activate

{exec_job}