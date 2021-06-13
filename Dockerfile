# NAME: dclong/jupyterhub
FROM dclong/jupyterlab
# GIT: https://github.com/dclong/docker-jupyterlab.git

RUN npm install -g configurable-http-proxy \
    && pip3 install --no-cache-dir jupyterhub \
    && npm cache clean --force

ADD settings/jupyter_server_config.py /etc/jupyter/
ADD settings/jupyterhub_config.py /etc/jupyterhub/
ADD scripts /scripts

EXPOSE 8000
