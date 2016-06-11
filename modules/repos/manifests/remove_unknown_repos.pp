class repos::remove_unknown_repos {

  $repos_list = hiera_array('repos_list')

  $regex = $repos_list.reduce |$memo, $value| {
    "${memo}.repo\|.*${value}"
  }

  exec { 'remove_unknown_repos':
    command => "find /etc/yum.repos.d/ -not -regex '.*${regex}.repo' -type f -delete",
    path    => '/bin/',
  }
}
