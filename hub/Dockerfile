# Extension of jupyterhub

FROM jupyterhub/jupyterhub:0.8.1

MAINTAINER Rasmus Munk <rasmus.munk@nbi.ku.dk>

RUN apt-get update && apt-get install --no-install-recommends -yq \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV JHUB_DIR=/opt/conda/share/jupyter/hub
ENV NEW_PAGES_DIR=/srv/jupyterhub/pages

# Remote user authenticator with support for MIG mount
# SwarmSpawner with support for sshfs mount
# dateutil for cull_idle_servers
RUN pip install jhub_remote_user_auth_mig_mount==0.0.5 \
    mig-swarmspawner==0.0.8 \
    python-dateutil==2.7.0

COPY pages $NEW_PAGES_DIR

RUN cp -r $NEW_PAGES_DIR/templates/* $JHUB_DIR/templates/ \
    && cp -r $NEW_PAGES_DIR/static/* $JHUB_DIR/static/

CMD jupyterhub -D
