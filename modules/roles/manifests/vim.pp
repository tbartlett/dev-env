class role::vim {
    class { 'profile::vim':
      plugins => ['rodjek/vim-puppet',
                  'godlygeek/tabular',
                  'Valloric/YouCompleteMe',
                  'markcornick/vim-vagrant',
                 ]
    }
}
