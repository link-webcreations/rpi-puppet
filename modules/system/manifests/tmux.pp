class system::tmux {
  package { 'tmux': ensure => present }
  file { '/etc/tmux.conf':
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source  => 'puppet:///modules/system/tmux/tmux.conf',
    require => Package['tmux'],
  }
}
