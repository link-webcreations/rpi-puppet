class system::openssh {
  # Install package
  package { 'openssh-server':
    ensure => present,
  }

  # Client configuration
  file { '/etc/ssh/ssh_config':
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template('system/ssh/ssh_config.erb'),
    require => Package['openssh-server'],
  }

  service { 'ssh':
    ensure     => running,
    hasrestart => true,
    require    => Package['openssh-server'],
    subscribe  => File['/etc/ssh/ssh_config'],
  }
}
