# Extension of jupyterhub

FROM jupyterhub/jupyterhub:0.8.1

MAINTAINER Rasmus Munk <rasmus.munk@nbi.ku.dk>

# Remote user authenticator with support for MIG mount
# SwarmSpawner with support for sshfs mount
# dateutil for cull_idle_servers
RUN git clone https://github.com/rasmunk/jhub_remote_user_auth_mig_mount.git --single-branch --branch devel \
    && cd jhub_remote_user_auth_mig_mount \
    && pip install -r requirements.txt \
    && python setup.py install

RUN git clone https://github.com/rasmunk/SwarmSpawner.git --single-branch --branch devel \
    && cd SwarmSpawner \
    && pip install -r requirements/base.txt \
    && python setup.py install

RUN pip install python-dateutil \
    jupyterhub-dummyauthenticator \
    dockerspawner

CMD jupyterhub --debug