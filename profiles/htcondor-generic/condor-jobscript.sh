#!/usr/bin/bash
# properties = {properties}
export HOME=$(pwd)
. /etc/profile

. venv_snakemake/bin/activate

{exec_job}
