define system::bash::confusr (
  $login,
  $target = $name,
  $template
) {
  # Create a local user ~/.bash.d managed system wide
  file { "/home/${login}/.bash.d":
    ensure => directory,
    owner  => $login,
    group  => $login,
  }

  file { "/home/${login}/.bash.d/${target}":
    owner   => $login,
    group   => $login,
    content => template($template),
  }
}
