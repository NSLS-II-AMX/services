#!/bin/bash

export PATH=/opt/conda/bin/:$PATH
export USER=xf17id1
export HOME=/epics/iocs/notebook
export SHELL=bash

log_dir="/var/log/jupyter/"
jupyter_log="$log_dir/jupyter-amx_$(date "+%F_%H-%M-%S").log"

source /opt/conda/etc/profile.d/conda.sh

# conda activate /opt/conda_envs/collection-2019-3.0-fmx
conda activate /nsls2/conda/envs/2022-2.0-py39

conda env list

###############################################################################
# DAMA note (July 10, 2019): the corresponding kernel file is defined in      #
# /usr/share/jupyter/kernels-available/collection-2019-3.0/kernel.json, and   #
# symlinked to /usr/share/jupyter/kernels/collection-2019-3.0/kernel.json     #
###############################################################################

jupyter lab --no-browser --config=/epics/iocs/notebook/configs/jupyter_notebook_config.py --notebook-dir=/epics/iocs/notebook/notebooks/ --ip=0.0.0.0 --port=17000 > $jupyter_log 2>&1
