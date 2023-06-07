import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')

crtlist = [
    'Bosch-CA-DE.crt',
    'Bosch-CA1-DE.crt',
    'Bosch-CA2-DE.crt',
    'BoschInternetProxyCA2.crt',
    'ProxyHTTP.crt'
]


def test_certs_directory_exists(host):

    assert host.file('/usr/share/ca-certificates').exists
    assert host.file('/usr/share/ca-certificates').is_directory


@pytest.mark.parametrize('crt', crtlist)
def test_download_bosch_certificates(host, crt):

    assert host.file('/usr/share/ca-certificates/' + crt).exists


@pytest.mark.parametrize('crt', crtlist)
def test_register_certificates(host, crt):

    assert host.file('/etc/ca-certificates.conf').contains(crt)


def test_update_certificate_index(host):

    update_response = host.run("/usr/sbin/update-ca-certificates").stdout

    assert update_response.index("0 added, 0 removed")
