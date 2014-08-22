class aria2::install {
  # Defaults
  Exec {
    path      => '/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin',
    user      => 'root',
    group     => 'root',
    logoutput => 'on_failure',
  }

  # Clone the repository
  exec { "Clone webui-aria2 repository":
    creates => "${aria2::params::installdir}",
    command => "git clone ${aria2::params::repository} ${aria2::params::installdir}",
  }

  # Setup Apache webui-aria2 site
  network::apache::install_site { "aria2":
    ensure  => $aria2::params::ensure,
    target  => "aria2",
    source  => "aria2/apache2/aria2.conf",
  }

  # Setup init.d
  file { '/etc/init.d/aria2c':
    ensure => present,
    mode   => 0755,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/aria2/init.d/aria2c',
  }
  file { '/etc/aria2/aria2.conf':
    ensure => present,
    mode   => 0644,
    owner  => 'root',
    group  => 'root',
  }
}
