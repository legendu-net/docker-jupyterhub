# NAME: dclong/jupyterhub
FROM dclong/jupyterlab
# GIT: https://github.com/legendu-net/docker-jupyterlab.git

RUN npm install -g configurable-http-proxy \
    && pip3 install "SQLAlchemy<2.0.0" "jupyterhub<5.5.0" \
    && /scripts/sys/purge_cache.sh

COPY settings/jupyterhub_config.py /etc/jupyterhub/
COPY scripts /scripts

EXPOSE 8000
