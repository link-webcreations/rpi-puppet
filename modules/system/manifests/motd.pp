class system::motd {
  file { '/etc/motd':
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    content => template('system/motd.erb'),
  }
}
