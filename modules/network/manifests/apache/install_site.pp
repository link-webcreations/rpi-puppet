define network::apache::install_site ($target = $title, $source, $ensure) {
  case $ensure {
    present: {
      # Install the file
      file { "/etc/apache2/sites-available/${target}":
        owner   => "root",
        group   => "root",
        mode    => 0644,
        source  => "puppet:///modules/${source}",
        require => Package['apache2'],
        notify  => Exec["Enable Apache site ${target}"],
      }
      exec { "Enable Apache site ${target}":
        path        => "/bin:/usr/bin:/sbin:/usr/sbin",
        command     => "a2ensite ${target}",
        refreshonly => true,
      }
    }
    absent: {
      # Delete the file
      file { "/etc/apache2/sites-available/${target}":
        ensure => absent,
        require => Package['apache2'],
        notify => Exec["Disable Apache site ${target}"],
      }
      exec { "Disable Apache site ${target}":
        path => "/bin:/usr/bin:/sbin:/usr/sbin",
        command => "a2dissite ${target}",
        refreshonly => true,
      }
    }
    default: {
      fail "Invalid 'ensure' value '$ensure' for network::apache::install_site"
    }
  }
}
