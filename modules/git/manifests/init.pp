# Init module that manage Git
#
class git {
  class { 'git::install': } ->
  class { 'git::config': }
}
