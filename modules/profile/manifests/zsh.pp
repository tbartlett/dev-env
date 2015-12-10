class profile::zsh(
 $user, 
){

  $home = "/home/${user}"

  package { 'zsh':
    ensure => latest,
  }

 
  file { "${home}/.zshrc":
    ensure  => present,
    content => template('profile/zshrc.erb'),
    require => package['zsh'],
  }

}
