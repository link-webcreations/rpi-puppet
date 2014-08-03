define network::apache::install_confd ($target, $content, $ensure) {
  include network::apache

  case $ensure {
    present: {
      # Install the file
      file { "${network::apache::apache_confd}/${target}":
        owner   => "root",
        group   => "root",
        mode    => 0644,
        content => template($content),
        require => Package['apache2'],
        notify  => Service['apache2'],
      }
    }
    absent: {
      # Delete the file
      file { "${network::apache::apache_confd}/${target}":
        ensure  => absent,
        require => Package['apache2'],
        notify  => Service['apache2'],
      }
    }
    default: {
      fail "Invalid 'ensure' value '$ensure' for network::apache::install_confd"
    }
  }
}
