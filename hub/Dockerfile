# Extension of jupyterhub
FROM jupyterhub/jupyterhub:1.1.0
MAINTAINER Rasmus Munk <rasmus.munk@nbi.ku.dk>

RUN apt-get update && apt-get install --no-install-recommends -yq \
    tzdata \
    quota \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV JHUB_DIR=/usr/local/share/jupyterhub
ENV JHUB_SRV_DIR=/srv/jupyterhub
ENV NEW_PAGES_DIR=$JHUB_SRV_DIR/pages

RUN pip install --upgrade pip
# Remote user authenticator with support for mount http header
# SwarmSpawner with support for sshfs mount
# dateutil for cull_idle_servers
RUN pip install jhub-authenticators \
    dockerspawner \
    jhub-swarmspawner \
    python-dateutil \
    flatten_dict

# JHUB Hooks
RUN pip install ldap-hooks

COPY pages $NEW_PAGES_DIR

RUN cp -r $NEW_PAGES_DIR/templates/* $JHUB_DIR/templates/ \
    && cp -r $NEW_PAGES_DIR/static/* $JHUB_DIR/static/

WORKDIR $JHUB_SRV_DIR

# Create a default config that works without a specific config file
RUN touch $JHUB_SRV_DIR/jupyterhub_config.py \
    && echo "c.JupyterHub.data_files_path = '/usr/local/share/jupyterhub'" > $JHUB_SRV_DIR/jupyterhub_config.py

CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
