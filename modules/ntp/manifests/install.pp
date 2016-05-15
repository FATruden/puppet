class ntp::install {
  package { 'chrony': ensure => 'present' }
}
