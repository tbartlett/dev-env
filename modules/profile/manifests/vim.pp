class profile::vim(
  $plugins, # Array of vim plugins
  $user,
){
    require profile::git
    require profile::dev_tools

    $path = '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin'
    $home = "/home/${user}"
    $_plugins = any2array($plugins)
    $_plugins.each |$plug| {
      validate_string($plug)
    }

    Exec {
      path => $path,
      environment => ["HOME=${home}"],
    }

    package { 'vim':
      ensure => latest,
    }

    exec { 'clone vundle':
      command => "git clone https://github.com/VundleVim/Vundle.vim.git ${home}/.vim/bundle/Vundle.vim",
      returns => [0,128],
    }

    file { "${home}/.vimrc":
      ensure => present,
      content => template('profile/vimrc.erb'),
      require => Exec['clone vundle'],
    }

    exec { 'Install vim plugins':
      command => 'vim -u NORC +PluginInstall +qall',
      timeout => 600,
      require => [Exec['clone vundle'], File["${home}/.vimrc"]],
    }

    exec { 'python ./install.py --clang-completer':
      cwd     => "${home}/.vim/bundle/YouCompleteMe",
      timeout => 600,
      require => [Exec['Install vim plugins']],
    }
}
