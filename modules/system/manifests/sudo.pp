class system::sudo {
  $sudoers_dir = '/etc/sudoers.d'

  package { 'sudo':
    ensure => 'installed'
  }

  file { '/etc/sudoers':
    require => [ Package['sudo'], File["${sudoers_dir}"] ],
    owner   => 'root',
    group   => 'root',
    mode    => 0440,
    source  => 'puppet:///modules/system/sudoers',
  }

  file { "${sudoers_dir}":
    ensure  => directory,
    require => Package['sudo'],
    owner   => 'root',
    group   => 'root',
  }
}

