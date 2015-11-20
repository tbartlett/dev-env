class profile::vim(
  $plugins, # Array of vim plugins
){
    require profile::git
 
    $_plugins = any2array($plugins)
    $_plugins.each |plug| {
      validate_string($plug)
    }

    package { 'vim':
      ensure => latest,
    }

    exec { 'clone vundle':
      command => 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
    }

    file { '~/.vimrc':
      ensure => present,
      content => template('profile/vimrc.erb'),
      require => Exec['clone vundle'],
    }

    exec { 'Install vim plugins':
      command => 'vim +PluginInstall +qall',
      timeout => 600,
      require => [Exec['clone vundle'], File['~/.vimrc']],
    }
}
