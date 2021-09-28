docker network rm jh_test
docker network create --driver overlay jh_test
docker service create -p 80:8000 --name jupyterhub \
 --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
 --mount type=bind,src=$(pwd)/swarm_jupyterhub_config.py,dst=/etc/jupyterhub/jupyterhub_config.py \
 --network jh_test ucphhpc/jupyterhub:edge jupyterhub -f /etc/jupyterhub/jupyterhub_config.py