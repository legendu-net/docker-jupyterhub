#!/bin/bash
# This script is for launching a JupyterHub service 
# in situations where launch.sh in dclong/jupyterhub is overwritten (e.g., in dclong/vscode-server).
# There are 2 popular use cases.
# 1. Pass the CMD "/scripts/sys/init.sh /scripts/sys/launch_jhub.sh" to the docker command when launching a Docker container.
# 2. Run "/scripts/sys/launch_jhub.sh" in an already launched Docker container.

#@TODO: add --collaborative when it's stable

cd $HOME
case "$(id -un)" in
    root )
        jupyterhub -f /etc/jupyterhub/jupyterhub_config.py
        ;;
    gitpod )
        jupyterhub -f /etc/jupyterhub/jupyterhub_config.py --Spawner.notebook_dir=/workspace
        ;;
    *)
        jupyterhub -f /etc/jupyterhub/jupyterhub_config.py --Spawner.notebook_dir=/workdir
esac

