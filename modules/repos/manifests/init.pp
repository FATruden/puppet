class repos {
  include repos::base
  include repos::epel
  include repos::puppet
  include repos::remove_other_repos
  include repos::yum_clean_all
}
