FROM rocker/verse

RUN apt-get update && \
    apt-get -y install python3-pip && \
    pip3 install --no-cache-dir notebook==5.* && \
    echo "www-port=8888" >> /etc/rstudio/rserver.conf

