## OK image FROM quay.io/uninett/deep-learning-tools:20180901-34973e4
## too big image FROM quay.io/uninett/deep-learning-tools:20190821-df15ac1
## FROM quay.io/uninett/deep-learning-tools:20190821-df15ac1 works but obsolete image
FROM quay.io/uninett/jupyter-spark:20200420-1131dd2


MAINTAINER Anne Fouilloux <annefou@uio.no>

# Install packages
USER root
RUN apt-get update && apt-get install -y dvipng vim

# Install other packages
USER notebook

# Install requirements for Python 3
ADD jupyterhub_environment.yml jupyterhub_environment.yml

RUN conda env update -f jupyterhub_environment.yml

RUN /opt/conda/bin/nbdime extensions --enable
RUN /opt/conda/bin/jupyter labextension install jupyterlab-datawidgets nbdime-jupyterlab dask-labextension
RUN /opt/conda/bin/jupyter labextension install @jupyter-widgets/jupyterlab-sidecar


