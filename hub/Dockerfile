# Extension of jupyterhub
FROM jupyterhub/jupyterhub:0.9.2
MAINTAINER Rasmus Munk <rasmus.munk@nbi.ku.dk>

RUN apt-get update && apt-get install --no-install-recommends -yq \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV JHUB_DIR=/opt/conda/share/jupyterhub
ENV NEW_PAGES_DIR=/srv/jupyterhub/pages

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

CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyter_config.py"]
