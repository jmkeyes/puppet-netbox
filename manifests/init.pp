# = Class: netbox

class netbox (
  $vhost,
  $version,
  $directory       = "/opt/netbox-${version}",
  $manage_database = true,
  $db_hostname     = 'localhost',
  $db_database     = 'netbox',
  $db_username     = 'netbox',
  $db_password     = 'netbox',
) {
  contain '::netbox::install'
  contain '::netbox::config'
  contain '::netbox::service'

  if $manage_database {
    contain '::netbox::database'

    Class['::netbox::database'] ->
    Class['::netbox::config']
  }

  Class['::netbox::install'] ->
  Class['::netbox::config'] ~>
  Class['::netbox::service']
}
