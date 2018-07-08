# Example config
c = get_config()

c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.hub_ip = '0.0.0.0'
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'

c.DockerSpawner.container_image = 'nielsbohr/base-notebook-devel:617bbbebfd01'
c.DockerSpawner.remove_containers = True

c.DockerSpawner.network_name = 'jh_test'

c.JupyterHub.authenticator_class = 'jhubauthenticators.DummyAuthenticator'
c.DummyAuthenticator.password = 'password'