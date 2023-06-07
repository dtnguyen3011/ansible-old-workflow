import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_packages(host):

    assert host.package('git').is_installed


def test_binaries(host):

    cmd = host.run('git --version')

    assert cmd.failed is False
