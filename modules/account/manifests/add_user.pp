define account::add_user (
  $login = $title,
  $shell = 'bash',
  $firstname,
  $lastname,
  $passwd,
  $groups = undef,
  $sshpubkey = undef,
  $membership = 'minimum'
) {
  include account

  # Create the user and primary group
  user { "${login}":
    home       => "/home/${login}",
    managehome => true,
    shell      => "/bin/${shell}",
    password   => $passwd,
    comment    => "${firstname} ${lastname},,,",
    gid        => $login,
    groups     => $groups,
    membership => $membership,
    ensure     => present,
    require    => File['/etc/skel/.bashrc'],
  }

  group { "${login}":
    ensure => present
  }

  # Home
  file { "/home/${login}":
    ensure => directory,
    owner  => $login,
    group  => $login,
  }

  if $sshpubkey {
    ssh_authorized_key { "${login}-sshpubkey":
      user   => $login,
      ensure => present,
      type   => 'ssh-dss',
      key    => $sshpubkey,
      name   => "${firstname} ${lastname}",
    }
  }
}
