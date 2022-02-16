#!/bin/bash

__conda_setup="$('/afs/crc.nd.edu/user/t/tshaffe1/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/afs/crc.nd.edu/user/t/tshaffe1/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/afs/crc.nd.edu/user/t/tshaffe1/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/afs/crc.nd.edu/user/t/tshaffe1/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

conda activate python39

exec "$@"
