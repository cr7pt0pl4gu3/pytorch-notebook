FROM nvidia/cuda:11.7.1-base-ubuntu20.04

# Set bash as the default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /app/

# Build with some basic utilities
RUN apt-get update && apt-get install -y \
    python3-pip \
    apt-utils \
    vim \
    git 

# alias python='python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip install \
    numpy \
    torch \
    jupyterlab \
    jupyter_http_over_ws

CMD ["jupyter", "serverextension", "enable", "--py", "jupyter_http_over_ws"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.allow_origin='https://colab.research.google.com'", "--NotebookApp.port_retries=0"]
EXPOSE 8888
