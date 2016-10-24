# = Class: netbox::service

class netbox::service {
  include '::nginx'

  python::gunicorn { $::netbox::vhost:
    ensure      => present,
    bind        => "unix:${::netbox::directory}/gunicorn.socket",
    dir         => "${::netbox::directory}/netbox",
    appmodule   => 'netbox.wsgi:application',
    environment => 'production',
    mode        => 'wsgi',
    timeout     => 30,
  }

  nginx::resource::vhost { $::netbox::vhost:
    proxy                => "http://unix:${::netbox::directory}/gunicorn.socket",
    server_name          => [ $::netbox::vhost, $::fqdn ],
    location_cfg_prepend => {
      'proxy_set_header X-Forwarded-Host'  => '$server_name',
      'proxy_set_header X-Real-IP'         => '$remote_addr',
      'proxy_set_header X-Forwarded-Proto' => '$scheme',
    },
  }

  nginx::resource::location { "${::netbox::vhost}-static":
    ensure         => 'present',
    location_alias => "${::netbox::directory}/netbox/static",
    vhost          => $::netbox::vhost,
    location       => '/static',
  }

  postgresql::validate_db_connection { 'netbox':
    database_name     => $::netbox::db_database,
    database_host     => $::netbox::db_hostname,
    database_username => $::netbox::db_username,
    database_password => $::netbox::db_password,
  }
}
