# This class install git on systems
#
class git::install {
  # Install git package
  package { 'git': ensure => present }
}
