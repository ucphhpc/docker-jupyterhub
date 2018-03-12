from subprocess import Popen, PIPE, STDOUT


def test_nbi_jupyterhub():
    p = Popen(['jupyterhub', '--debug'], stdin=PIPE, stdout=PIPE, stderr=STDOUT)
    running = False
    for line in p.stdout:
        if 'JupyterHub is now running at' in str(line):
            running = True
            break

    assert running
