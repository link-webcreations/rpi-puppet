# Defined type to set a git config option for a user
#
define git::setconf ($login, $ensure, $option, $value) {
  include git

  Exec {
    environment => $login ? {
      'root'  => ["HOME=/root"],
      default => ["HOME=/home/${login}"],
    },
    path => "/usr/bin",
    cwd  => $login ? {
      'root'  => '/root',
      default => "/home/${login}",
    },
    user    => $login,
    require => Package['git'],
  }

  case $ensure {
    present: {
      exec { "Set Git option ${option} for user ${login}":
        command => "git config --global ${option} \"${value}\"",
        unless  => "git config --global --get ${option}",
      }
    }
    absent: {
      exec { "Remove Git option ${option} for user ${login}":
        command => "git config --global --unset ${option}",
        onlyif  => "git config --global --get ${option}",
      }
    }
    default: {
      fail "Invalid 'ensure' value '$ensure' for git::setconf"
    }
  }
}
