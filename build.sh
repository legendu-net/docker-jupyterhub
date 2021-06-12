#!/bin/bash

docker pull dclong/jupyterlab:next
docker build -t dclong/jupyterhub:next .
