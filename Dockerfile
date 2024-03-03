# NAME: dclong/jupyterhub
FROM dclong/jupyterlab
# GIT: https://github.com/legendu-net/docker-jupyterlab.git

RUN npm install -g configurable-http-proxy \
    && pip3 install --break-system-packages "SQLAlchemy<2.0.0" "jupyterhub<4.1.0" \
    && /scripts/sys/purge_cache.sh \
    && npm cache clean --force

ADD settings/jupyter_server_config.py /etc/jupyter/
ADD settings/jupyterhub_config.py /etc/jupyterhub/
ADD scripts /scripts

EXPOSE 8000
