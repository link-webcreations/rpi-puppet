class account::admin::besancon {
  $sshpubkey = 'AAAAB3NzaC1kc3MAAACAa4jJT4LrY9fHOe5/K1QUU3Tzz+qqRXJ0dGg2fH4AFyqxb6oPuNT4tl7vfUGmeqX0PKs+NB4fFWRRGUKxQ9DnLVpY/TwNAp/1DGjcyPmoUSz5mlSzhup7E1Z1eiNfsEzX+iEQhWmPAdjiJQbpDiSB/V2l2XYzzlO0rdJr5XHhtlcAAAAVAKpaEQ990bfvdU8znQlQwodqcD+RAAAAgERqrDmb9/H5sIoI9wI714ggiow9d9O4A/3eOuXKXst3/nPN14F53n9eb8zHR8ux8pI1ainm3IbGmn+uZLiQjK1hQJnghvqljCrYQRL/1oeN8Nn1zoEZzl7MrQ3gdazuVqg8p6/Xfwh4yCzfcT5Gv3QE8UTPJP82RywlySoDeVcwAAAAgGLhkRe97L/35zjdlWtVYOnaRqdOUq3oYBvpRJcOVp5TV9hTmEw0sH1C5hmEJNgUA+xSeTcD/CeXipU7hdq9PUYWeP1vyiNXhuzybtyLazPArfKVW07utNR66ihej3H9zzWSR6SsnpnycYpbaeyQSmvofYGci3inhiizX/gUG1x0'
  
  # Create user account
  account::add_user { 'besancon':
    firstname => 'Vincent',
    lastname  => 'BESANCON',
    passwd    => '$1$rNZ44J6o$evY0GRv7zBEnq9IqEGWqt1',
    groups    => [
      'adm',
      'cdrom',
      'lpadmin',
      'sambashare',
      'admin',
      'git',
      'agents',
    ],
    sshpubkey => $sshpubkey,
  }

  # Git configuration
  git::setup { 'besancon':
    name  => 'Vincent BESANCON',
    email => 'vincent.besancon@gmail.com',
  }

  # Root access
  ssh_authorized_key { "authorized_key-root: besancon":
    user   => 'root',
    ensure => present,
    type   => 'ssh-dss',
    key    => $sshpubkey,
  }
}
