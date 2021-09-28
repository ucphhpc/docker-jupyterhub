# Example config
c = get_config()

c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.hub_ip = '0.0.0.0'

c.JupyterHub.data_files_path = '/usr/local/share/jupyterhub'
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'

c.DockerSpawner.container_image = 'ucphhpc/base-notebook:latest'
c.DockerSpawner.remove_containers = True

c.DockerSpawner.network_name = 'jupyterhub_default'

c.JupyterHub.authenticator_class = 'jhubauthenticators.DummyAuthenticator'
c.DummyAuthenticator.password = 'password'
