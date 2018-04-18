c = get_config()

c.JupyterHub.spawner_class = 'mig.SwarmSpawner'

c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.hub_ip = '0.0.0.0'

c.SwarmSpawner.start_timeout = 60 * 5
# # The name of the service that's running the hub
c.SwarmSpawner.jupyterhub_service_name = "jupyterhub"
#
# # The name of the overlay network that everything's connected to
c.SwarmSpawner.networks = ["jh_test"]
#
# # Before the user can select which image to spawn,
# # user_options has to be enabled
c.SwarmSpawner.use_user_options = True

c.SwarmSpawner.dockerimages = [
    {'image': 'jupyterhub/singleuser:0.8.1',
     'name': 'Default jupyterhub singleuser notebook'},
    {'image': 'jupyter/base-notebook:30f16d52126f',
     'name': 'Minimal jupyter notebook',
     'mounts': []},
    {'image': 'jupyter/scipy-notebook',
     'name': 'scipy-notebook'}
]

c.SwarmSpawner.container_spec = {
    'args': ['/usr/local/bin/start-singleuser.sh']
}

c.JupyterHub.authenticator_class = 'dummyauthenticator.DummyAuthenticator'
c.JupyterHub.password = "password"
