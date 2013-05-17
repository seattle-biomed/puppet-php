# Define: php::module
#
# Manage optional PHP modules which are separately packaged.
# See also php::module:ini for optional configuration.
#
# Sample Usage :
#  php::module { [ 'php-ldap', 'php-mcrypt', 'php-xml' ]: }
#  php::module { 'php-odbc': ensure => absent }
#  php::module { 'php-pecl-apc': }
#
define php::module ( $ensure = installed ) {
  package { "${title}":
    ensure => $ensure,
  }
}

