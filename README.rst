=============================
docker-nbi-jupyterhub
=============================
.. image:: https://travis-ci.com/ucphhpc/docker-nbi-jupyterhub.svg?branch=master
    :target: https://travis-ci.com/ucphhpc/docker-nbi-jupyterhub

.. image:: https://img.shields.io/docker/v/nielsbohr/jupyterhub
    :target: https://hub.docker.com/r/nielsbohr/jupyterhub

.. image:: https://img.shields.io/docker/pulls/nielsbohr/jupyterhub
    :target: https://hub.docker.com/r/nielsbohr/jupyterhub

.. image:: https://img.shields.io/docker/image-size/nielsbohr/jupyterhub
    :target: https://hub.docker.com/r/nielsbohr/jupyterhub

A jupyterhub docker image that by default supports the following extensions.

- `Jupyterhub Remote-User Authenticator <https://github.com/rasmunk/jhub-authenticators>`_
- `Jhub SwarmSpawner <https://github.com/rasmunk/SwarmSpawner>`_

-----------
Get Started
-----------

If you are simply interested in running the jupyterhub, simply run the
following command inside the repo directory::

    cd hub
    docker build -t nielsbohr/jupyterhub .
    # To run a single notebook in detached mode do the following
    docker run -d --name jupyterhub -p 8000:8000 nielsbohr/jupyterhub:edge

A container should now be running locally, double check with::

    docker ps

If the container is present, you should now be able to connect to it in your
browser @ 127.0.0.1:8000, double check by getting the log output from the
jupyterhub service::

    docker logs jupyterhub

To setup an authentication method either use the provided Remote-User
authenticator or use the testing dummy authenticator.
See https://github.com/jupyterhub/jupyterhub/wiki/Authenticators
for more information on this.

Testing Build
-------------

To also build and verify the image works in one go the following can be done instead::

    cd hub
    ./build.sh

Two images should now have been built, i.e. 'nielsbohr/jupyterhub:edge' and
'nielsbohr/jupyterhub:edge-test'

The test image is an extended version of the nielsbohr/jupyterhub:edge image
but a test script that verifies that the jupyterhub server is able to launch
correctly. This test can be run by simply running::

    docker run nielsbohr/jupyterhub:edge-test


