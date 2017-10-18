FROM buildpack-deps:zesty

# Set up locales properly
RUN apt-get update && \
    apt-get install --yes --no-install-recommends locales && \
    apt-get purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use bash as default shell, rather than sh
ENV SHELL /bin/bash

# Set up user
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
       less \
       nodejs-legacy \
       npm \
       && apt-get purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install --yes \
       python3 \
       python3-dev \
       python3-venv \
       && apt-get purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 8888

# Almost all environment variables
ENV APP_BASE /srv
ENV VENV_PATH ${APP_BASE}/venv
ENV NB_PYTHON_PREFIX ${VENV_PATH}
# Special case PATH
ENV PATH ${VENV_PATH}/bin:${PATH}
RUN mkdir -p ${VENV_PATH} && \
chown -R ${NB_USER}:${NB_USER} ${VENV_PATH}

USER ${NB_USER}
RUN python3 -m venv ${VENV_PATH}

RUN pip install --no-cache-dir \
    notebook==5.0.0 \
    jupyterhub==0.7.2 \
    ipywidgets==6.0.0 \
    jupyterlab==0.24.1 && \
jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
jupyter serverextension enable --py jupyterlab --sys-prefix



# Copy and chown stuff. This doubles the size of the repo, because
# you can't actually copy as USER, only as root! Thanks, Docker!
USER root
COPY src/ ${HOME}
RUN chown -R ${NB_USER}:${NB_USER} ${HOME}

# Run assemble scripts! These will actually build the specification
# in the repository into the image.
USER ${NB_USER}
RUN pip3 install --no-cache-dir -r requirements.txt


# Container image Labels!
# Put these at the end, since we don't want to rebuild everything
# when these change! Did I mention I hate Dockerfile cache semantics?


# We always want containers to run as non-root
USER ${NB_USER}
