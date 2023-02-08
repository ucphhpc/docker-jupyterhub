# Extension of jupyterhub
FROM jupyterhub/jupyterhub:3.1.1
LABEL MAINTAINER="Rasmus Munk <rasmus.munk@nbi.ku.dk>"

RUN apt-get update && apt-get install --no-install-recommends -yq \
    tzdata \
    quota \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Remote user authenticator with support for mount http header
# SwarmSpawner with support for sshfs mount
# https://github.com/jupyterhub/jupyterhub-idle-culler
# The JupyterHub 2.0 culler
RUN python3 -m pip install \
    git+https://github.com/ucphhpc/jhub-authenticators.git \
    dockerspawner \
    git+https://github.com/ucphhpc/swarmspawner.git \
    flatten_dict \
    jupyterhub-idle-culler \
    git+https://github.com/ucphhpc/ldap_hooks.git