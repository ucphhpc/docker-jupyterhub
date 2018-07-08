docker run --mount type=bind,src=$(pwd)/swarm_jupyterhub_config.py,dst=/etc/jupyterhub/jupyterhub_config.py \
 --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  -p 80:8000 --name jupyterhub --network jh_test -d nielsbohr/jupyterhub-devel:edge \
   jupyterhub -f /etc/jupyterhub/jupyterhub_config.py