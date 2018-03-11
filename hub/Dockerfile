#Extension of jupyterhub

FROM jupyterhub/jupyterhub:0.7.2

MAINTAINER Rasmus Munk <rasmus.munk@nbi.ku.dk>

# Remote user authenticator with support for MIG mount
# SwarmSpawner with support for sshfs mount
# dateutil for cull_idle_servers
RUN pip install jhub_remote_user_auth_mig_mount \
    mig-swarmspawner \
    python-dateutil

CMD jupyterhub