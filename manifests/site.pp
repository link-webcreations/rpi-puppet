#===============================================================================
# RESSOURCES DEFAULTS
#===============================================================================

Exec {
  path      => '/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin',
  cwd       => '/tmp',
  logoutput => 'on_failure',
}

#===============================================================================
# Nodes
#===============================================================================

$node_language    = "fr_FR"
$node_description = "Yves' Pi"

include account
include aria2
include git
include kanboard
include monitor
include rss
include system

package { "cifs-utils":
  ensure  => present,
}

mount { '/media/livestorage':
  device  => '//192.168.1.1/usb1',
  atboot  => 'true',
  ensure  => 'mounted',
  fstype  => 'cifs',
  options => 'guest,uid=1000,gid=1000,iocharset=utf8',
}
