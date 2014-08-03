class account {
  group {[
    'adm',
    'cdrom',
    'lpadmin',
    'sambashare',
    'admin',
    'sudo',
    'git',
    'agents',
  ]:
    ensure => present,
  }

  include account::admin

  # Remove old files
  file { '/etc/skel/.bashrc':
    ensure => absent,
  }
}
