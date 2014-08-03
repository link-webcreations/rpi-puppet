class monitor::install {
  file { "${monitor::debpkg}":
    ensure => present,
    source => "puppet:///modules/monitor/pkg/${monitor::deb_name}",
    alias  => 'deb-rpimonitor',
  }
  package { 'rpimonitor':
    provider => 'dpkg',
    ensure   => latest,
    source   => "${monitor::debpkg}",
    require  => File['deb-rpimonitor'],
    notify   => Exec['rpimonitor_update'],
  } ~>
  exec {'rpimonitor_update':
    user        => 'root',
    group       => 'root',
    command     => 'apt-get update && service rpimonitor update',
    refreshonly => true,
  }

  # Setup Apache RPiMonitor site
  network::apache::install_site { "rpimonitor":
    ensure  => $monitor::params::ensure,
    target  => "rpimonitor",
    source  => "monitor/apache2/rpimonitor.conf",
  }
  file { '/etc/rpimonitord.conf':
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/monitor/etc/rpimonitord.conf',
    notify => Service['rpimonitor'],
  }
  file { '/etc/rpimonitord.conf.d/livestorage.conf':
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/monitor/etc/rpimonitord.conf.d/livestorage.conf',
    notify => Service['rpimonitor'],
  }
}
