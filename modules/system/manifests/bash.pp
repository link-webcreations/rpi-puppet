class system::bash {
  file { '/etc/bash.bashrc':
    owner  => 'root',
    group  => 'root',
    mode   => 644,
    source => 'puppet:///modules/system/bash/bash.bashrc',
  }

  file { '/etc/profile':
    owner  => 'root',
    group  => 'root',
    mode   => 644,
    source => 'puppet:///modules/system/bash/profile',
  }

  # /etc/bash.d
  file { '/etc/bash.d':
    ensure => directory,
  }

  # Delete old bash prompt
  # Replaced by liquidprompt
  file { '/etc/bash.d/prompt.bash':
    ensure => absent,
  }
  include system::bash::prompt
}
