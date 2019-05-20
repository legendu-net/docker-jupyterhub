FROM dclong/jupyterlab

RUN npm install -g configurable-http-proxy \
    && npm cache clean \
    && pip3 install --no-cache-dir jupyterhub

ADD settings/jupyter_notebook_config.py /etc/jupyter/
ADD settings/jupyterhub_config.py /etc/jupyterhub/
ADD scripts /scripts

EXPOSE 8000
