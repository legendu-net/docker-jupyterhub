FROM dclong/jupyterlab

RUN conda install -c conda-forge \
        jupyterhub  

ADD settings/jupyter_notebook_config.py /etc/jupyter/
ADD settings/jupyterhub_config.py /etc/jupyterhub/
ADD scripts /scripts

EXPOSE 8000
