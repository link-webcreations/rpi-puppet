# This defined type setup git for a user
#
define git::setup ($login = $title, $name, $email) {
  include git

  git::setconf { "${login}-user.name":
    ensure => present,
    login  => $login,
    option => "user.name",
    value  => $name,
  }
  git::setconf { "${login}-user.email":
    ensure => present,
    login  => $login,
    option => "user.email",
    value  => $email,
  }
}
