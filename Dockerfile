FROM quay.io/uninett/deep-learning-tools:20181129-30925cb
#FROM quay.io/uninett/deep-learning-tools:20180901-34973e4
#FROM quay.io/uninett/deep-learning-tools:20190319-4881294

MAINTAINER Anne Fouilloux <annefou@geo.uio.no>

# Install packages
USER root
RUN apt-get update && apt-get install -y dvipng vim

# Install other packages
USER notebook

# Install requirements for Python 3
ADD jupyterhub_environment.yml jupyterhub_environment.yml

RUN conda env update -f jupyterhub_environment.yml
