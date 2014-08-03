define account::add_service_user ($login = $title, $shell = 'bash', $comment, $groups = undef, $homepath = "/home") {
  include account

  # Define the user home directory path
  $userhome = "${homepath}/${login}"
  
  # Create the user and primary group
  user { "${login}":
    home       => "${userhome}",
    managehome => true,
    shell      => "/bin/${shell}",
    password   => '!',
    comment    => "Service - ${comment},,,",
    gid        => $login,
    groups     => $groups,
    ensure     => present,
    require    => File['/etc/skel/.bashrc'],
  }

  group { "${login}":
    ensure => present
  }
}
