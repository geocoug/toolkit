ARG BASE_CONTAINER=jupyter/pyspark-notebook

FROM $BASE_CONTAINER

USER root

# install the locales you want to use
RUN set -ex \
    && sed -i 's/^# en_US.UTF-8 UTF-8$/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# Install Python 3 packages
RUN mamba install --quiet --yes \
    'netCDF4' \
    && mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Update apt packages and install new dependencies
RUN apt-get update \
    && apt-get install -y \
    gcc \
    gdal-bin \
    libgdal-dev \
    proj-bin

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

COPY ./requirements.txt .

RUN pip wheel --no-cache-dir --wheel-dir /usr/local/app/wheels -r requirements.txt

USER ${NB_UID}

WORKDIR "${HOME}"
