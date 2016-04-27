class repos::remove_other_repos {

  $present = '".*base.repo\|.*updates.repo\|.*extras.repo\|.*centosplus.repo\|.*epel.repo\|.*puppet.repo\|.*puppet-deps.repo\|.*test.repo"'

  exec { 'remove_other_repos':
    command   => "find /etc/yum.repos.d/ -not -regex ${present} -type f -delete",
    path      => '/bin/',
    logoutput => 'on_failure',
  }
}
