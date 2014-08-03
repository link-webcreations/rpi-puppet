define network::apache::mod ($module = $title, $ensure) {
  include network::apache

  case $ensure {
    present: {
      exec { "Enable Apache module ${module}":
        path    => "/bin:/usr/bin:/sbin:/usr/sbin",
        command => "a2enmod ${module}",
        onlyif  => "test ! -e /etc/apache2/mods-enabled/${module}.*",
        require => Package['apache2'],
        notify  => Service['apache2'],
      }
    }
    absent: {
      exec { "Disable Apache module ${module}":
        path    => "/bin:/usr/bin:/sbin:/usr/sbin",
        command => "a2dismod ${module}",
        onlyif  => "test -e /etc/apache2/mods-enabled/${module}.*",
        require => Package['apache2'],
        notify  => Service['apache2'],
      }
    }
    default: {
      fail "Invalid 'ensure' value '$ensure' for network::apache::mod"
    }
  }
}
