#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

. /etc/bash.bashrc

set -e

[ -f /opt/Anaconda3/etc/profile.d/conda.sh ] && . /opt/Anaconda3/etc/profile.d/conda.sh
conda activate

jupyter notebook  --ip 0.0.0.0 --no-browser "$@"

