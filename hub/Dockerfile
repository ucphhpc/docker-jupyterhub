# Extension of jupyterhub
FROM jupyterhub/jupyterhub:3.0
LABEL MAINTAINER="Rasmus Munk <rasmus.munk@nbi.ku.dk>"

RUN apt-get update && apt-get install --no-install-recommends -yq \
    tzdata \
    quota \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Remote user authenticator with support for mount http header
# SwarmSpawner with support for sshfs mount
# dateutil for cull_idle_servers
RUN python3 -m pip install jhub-authenticators \
    dockerspawner \
    jhub-swarmspawner \
    python-dateutil \
    flatten_dict

# JHUB Hooks
RUN python3 -m pip install ldap-hooks