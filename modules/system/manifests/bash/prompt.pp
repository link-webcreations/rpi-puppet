# https://github.com/nojhan/liquidprompt
class system::bash::prompt {
  $confdir = '/etc/liquidprompt'

  # Defaults
  File {
    owner => 'root',
    group => 'root',
  }

  # Create config dir
  file { "$confdir":
    ensure => directory,
  }

  # Set conf in place
  file { "${confdir}/default.ps1":
    mode   => 0664,
    source => 'puppet:///modules/system/liquidprompt/default.ps1',
  }

  file { "${confdir}/liquidpromptrc":
    mode   => 0664,
    source => 'puppet:///modules/system/liquidprompt/liquidpromptrc',
    before => File["${confdir}/default.ps1"],
  }

  # Set prompt
  file { '/etc/bash.d/liquidprompt.bash':
    mode    => 0664,
    source  => 'puppet:///modules/system/bash.d/liquidprompt.bash',
    require => File["${confdir}/liquidpromptrc"],
  }
}
