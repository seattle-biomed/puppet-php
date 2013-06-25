class php::params {

  $php_packgae = $operatingsystem ? {
     /(?i-mx:ubuntu|debian)/        => 'php5',
     /(?i-mx:centos|fedora|redhat)/ => 'php',
   }

  $php_common_pkg = $operatingsystem ? {
     /(?i-mx:ubuntu|debian)/        => 'php5-common',
     /(?i-mx:centos|fedora|redhat)/ => 'php-common',
   }

  $php_cli_packgae = $operatingsystem ? {
     /(?i-mx:ubuntu|debian)/        => 'php5-cli',
     /(?i-mx:centos|fedora|redhat)/ => 'php-cli',
   }

  $php_mod_package = $operatingsystem ? {
     /(?i-mx:ubuntu|debian)/        => 'libapache2-mod-php5',
     /(?i-mx:centos|fedora|redhat)/ => 'php',
   }

  $php_ini_file = $operatingsystem ? {
     /(?i-mx:ubuntu|debian)/        => '/etc/php5/php.ini',
     /(?i-mx:centos|fedora|redhat)/ => '/etc/php.ini',
   }

   $httpd_php_conf = $operatingsystem ? {
     /(?i-mx:ubuntu|debian)/        => '/etc/apache2/conf.d/php.conf',
     /(?i-mx:centos|fedora|redhat)/ => '/etc/httpd/conf.d/php.conf',
   }
}
