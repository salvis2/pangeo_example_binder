#!/bin/bash
# This file is lifted from https://github.com/scottyhq/pangeo-binder-test/blob/master/binder/postBuild
set -euo pipefail

# labextensions

jupyter labextension install @jupyter-widgets/jupyterlab-manager \
                             dask-labextension  
                             

# dask config
# ${KERNEL_PYTHON_PREFIX} is set by repo2docker to sys.prefix
# of the python that the kernel is run in.
mkdir -p ${KERNEL_PYTHON_PREFIX}/etc/dask
cp binder/dask_config.yaml ${KERNEL_PYTHON_PREFIX}/etc/dask/dask.yaml