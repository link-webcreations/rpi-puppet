class account::service::webcontent {
  include network::apache

  # Create user account
  account::add_service_user { 'webcontent':
    comment => 'Web Content',
  }

  # Access
  ssh_authorized_key { "authorized_key-webcontent: besancon":
    user   => 'webcontent',
    ensure => present,
    type   => 'ssh-dss',
    key    => $account::admin::besancon::sshpubkey,
  }
  ssh_authorized_key { "authorized_key-webcontent: andolfat":
    user   => 'webcontent',
    ensure => present,
    type   => 'ssh-dss',
    key    => $account::admin::andolfat::sshpubkey,
  }

  # Boxes (VM, ISO...)
  file { '/var/www/boxes':
    ensure => directory,
    owner  => 'webcontent',
    group  => 'webcontent',
  }
}
