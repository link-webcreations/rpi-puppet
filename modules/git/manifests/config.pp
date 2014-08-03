class git::config {
  $varlib = "/var/lib/raspberry"
  $sharedir = "/usr/share/raspberry"

  file { "$varlib":
    ensure => directory,
  }
  file { "$sharedir":
    ensure => directory,
  } ~>
  file { "$sharedir/git":
    ensure => directory,
  }

  # Setup system wide git config file
  file { '/etc/gitconfig':
    owner   => 'root',
    group   => 'root',
    require => Package['git'],
    content => template('git/gitconfig.erb'),
  }

  # Set global gitignore file
  file { "$sharedir/git/gitignore":
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/git/etc/gitignore',
  }
}
