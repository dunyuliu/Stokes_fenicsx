FROM dolfinx/lab@sha256:94c1ba686e74d32ba1ac5ce53aed4ee388e4a0d736458cb76e1ac0b1ca1c9c0b
RUN python3 -m pip install --no-cache-dir notebook jupyterlab
RUN pip install --no-cache-dir jupyterhub
ARG NB_USER=dunyu
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
