class profile::tom(
 $user = 'tom',
){

  $home = "/home/${user}"

  user { $user:
    ensure => present,
    groups => ['wheel', 'docker'],
    shell  => '/bin/zsh',
  }

}
