FROM quay.io/uninett/deep-learning-tools:20180901-34973e4

MAINTAINER Anne Fouilloux <annefou@geo.uio.no>

# Install packages
USER root
RUN apt-get update && apt-get install -y dvipng latexmk texlive vim

# Install other packages
USER notebook

# Install requirements for Python 3
ADD environment.yml environment.yml

RUN conda env update -f environment.yml
