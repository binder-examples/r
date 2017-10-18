FROM rocker/rstudio:3.4.1

RUN apt-get update && \
    apt-get -y install python3-pip && \
    pip install --no-cache-dir notebook==5.* 


ENV NB_USER rstudio 
ENV NB_UID 1000
ENV HOME /home/rstudio

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID}:${NB_GID} ${HOME}
USER ${NB_USER}


