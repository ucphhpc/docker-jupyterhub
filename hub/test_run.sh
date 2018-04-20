docker service create -p 80:8000 --name jupyterhub \
 --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
 --network jh_test --network bridge nielsbohr/jupyterhub:edge
