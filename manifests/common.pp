# Class: php::common
#
# Class to avoid duplicate definitions for the php-common package, not meant to
# be used from outside the php module's own classes and definitions.
#
class php::common (
  $php_common_pkg  = $php::params::php_common_pkg,
  $php_modules  = []
) inherits php::params {

  package { 'php-common':
    name   => $php_common_pkg,
    ensure => installed,
  }

}

