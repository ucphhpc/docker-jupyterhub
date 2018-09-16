# Extension of jupyterhub
FROM jupyterhub/jupyterhub:0.9.2
MAINTAINER Rasmus Munk <rasmus.munk@nbi.ku.dk>

RUN apt-get update && apt-get install --no-install-recommends -yq \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV JHUB_DIR=/opt/conda/share/jupyterhub
ENV NEW_PAGES_DIR=/srv/jupyterhub/pages

# Remote user authenticator with support for mount http header
# SwarmSpawner with support for sshfs mount
# dateutil for cull_idle_servers
RUN git clone https://github.com/rasmunk/jhub-authenticators.git \
    --single-branch --branch devel \
    && cd jhub-authenticators \
    && pip install -r requirements.txt \
    && python setup.py install

RUN git clone https://github.com/rasmunk/SwarmSpawner.git --single-branch --branch devel \
    && cd SwarmSpawner \
    && pip install -r requirements.txt \
    && python setup.py install

RUN pip install python-dateutil \
    dockerspawner

COPY pages $NEW_PAGES_DIR

RUN cp -r $NEW_PAGES_DIR/templates/* $JHUB_DIR/templates/ \
    && cp -r $NEW_PAGES_DIR/static/* $JHUB_DIR/static/

CMD jupyterhub
