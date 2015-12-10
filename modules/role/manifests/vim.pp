class role::vim {
    class { 'profile::vim':
      user    => 'tumny',
      plugins => ['rodjek/vim-puppet',
                  'godlygeek/tabular',
                  'Valloric/YouCompleteMe',
                  'markcornick/vim-vagrant',
                 ]
    }
}
