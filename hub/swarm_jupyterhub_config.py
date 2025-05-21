# Example config
c = get_config()

c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.hub_ip = '0.0.0.0'
c.JupyterHub.spawner_class = 'jhub.SwarmSpawner'

# The name of the service that's running the hub
c.SwarmSpawner.jupyterhub_service_name = "jupyterhub_jupyterhub"

c.SwarmSpawner.start_timeout = 60 * 15

# The name of the overlay network that everything's connected to
c.SwarmSpawner.networks = ["jupyterhub_default"]

# Before the user can select which image to spawn,
# user_options has to be enabled
c.SwarmSpawner.use_user_options = True

c.SwarmSpawner.dockerimages = [
    {'image': 'ucphhpc/base-notebook:latest',
     'name': 'Basic Python Notebook'}
]

c.SwarmSpawner.container_spec = {
    'args': [
        "/usr/local/bin/start-singleuser.sh",
        "--ServerApp.ip=0.0.0.0",
        "--ServerApp.port=8888",
    ],
}

c.JupyterHub.authenticator_class = 'jhubauthenticators.DummyAuthenticator'
c.DummyAuthenticator.password = 'password'
