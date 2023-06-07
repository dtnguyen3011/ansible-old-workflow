import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_packages(host):

    assert host.package('openjdk-8-jre').is_installed


def test_binaries(host):

    run1 = host.run('java -version')
    run2 = host.run('/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -version')

    assert run1.rc == run2.rc == 0
    assert run1.stderr and run1.stderr == run2.stderr
