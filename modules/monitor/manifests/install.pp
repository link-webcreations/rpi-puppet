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
    command     => 'apt-get update && /usr/share/rpimonitor/scripts/updatePackagesStatus.sh',
    refreshonly => true,
  }

  # Setup Apache RPiMonitor site
  network::apache::install_site { "rpimonitor":
    ensure  => $monitor::params::ensure,
    target  => "rpimonitor",
    source  => "monitor/apache2/rpimonitor.conf",
  }
  file { '/etc/rpimonitor/daemon.conf':
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/monitor/etc/daemon.conf',
    notify => Service['rpimonitor'],
  }
  file { '/etc/rpimonitor/livestorage.conf':
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/monitor/etc/livestorage.conf',
    notify => Service['rpimonitor'],
  }
}
