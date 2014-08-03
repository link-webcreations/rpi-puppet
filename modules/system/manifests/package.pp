class system::package {
  # Default packages to install on systems
  package {[
    'bc',
    'dkms',
    'htop',
    'iotop',
    'make',
    'tree',
    'mc',
    'curl',
    'pv',
    'traceroute',
    'tcptraceroute',
    'nmap',
    'screen',
    'aptitude',
    'vim-nox',
    'build-essential',
    'libmysqlclient-dev',
    'ack-grep',
    'fail2ban',
  ]:
    ensure => present,
  }
}

