# = Class: netbox::install

class netbox::install {
  package { [ 'libffi-dev', 'libxml2-dev', 'libxslt1-dev']:
    ensure => 'installed',
  }

  class { '::python':
    version    => 'system',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'present',
  }

  file { $::netbox::directory:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  } ->

  archive { "netbox-${::netbox::version}.tar.gz":
    source          => "https://github.com/digitalocean/netbox/archive/v${::netbox::version}.tar.gz",
    path            => "/tmp/netbox-${::netbox::version}.tar.gz",
    extract_command => 'tar xzf %s --strip-components=1',
    extract_path    => $::netbox::directory,
    extract         => true,
  }
}
