class account::admin::andolfat {
  $sshpubkey = 'AAAAB3NzaC1kc3MAAACBALLqeGwjo0iDu9o2nyWrL7+jI10nd6P9fZKF6/ku3bh7F+amtcr/HsSmoGKphjF+YoZhaPFSaPqXk23UpyIeIpGYR/ujsiq42yOfQGO0tyu2CgR//v/TNRUHe5og7glMGulA6pZW5D+U41y1qdoLEe+LgBiAwTTTADEfJxGgv671AAAAFQDyLOvPh0jbfgJrJAuQx1HlE7U6OQAAAIEAiXGqnkTcipTwhbfcP2bYAEtCIO/j5eyoVCFhDGGQ1er3BxD0jh2O65RZsoOiBzTexqG/vBs/5qwKskby1uZUi8/IRmdTsX9jGLy7VLE103zWcaT0WY+YoKTK0kTOqYqi/LLzFbGAh54vmmRp+GPpeDV/N71/ctGPpQXYWqIkz8UAAACAYrFnuZm6JnS6oMGv1OcL/mJ8ZnPhjBNYoiIyd1VD8sG4KKgpF8sK7kMBNr+kuXBDWQVN5YLN54O/lb0h2fTFBwXfJLHXmEdQyBezLOaGedsWBh+zqu60lMcFj9mectF8q7zzu/dFoiog20EyVnnyv29iCYMsgkdUDnO+XgSyQUA='

  # Create user account
  account::add_user { 'andolfat':
    firstname => 'Yves',
    lastname  => 'ANDOLFATTO',
    passwd    => '$1$TE.4Xmxv$Z3DwFpRB1KnjbAVo4zWyB.',
    groups    => [
      'adm',
      'cdrom',
      'lpadmin',
      'sambashare',
      'admin',
      'git',
      'agents',
      'sudo',
    ],
    sshpubkey => $sshpubkey,
  }

  # Git configuration
  git::setup { 'andolfat':
    name  => 'Yves ANDOLFATTO',
    email => 'yves.andolfatto@gmail.com',
  }

  # Root access
  ssh_authorized_key { "authorized_key-root: andolfat":
    user   => 'root',
    ensure => present,
    type   => 'ssh-dss',
    key    => $sshpubkey,
  }
}
