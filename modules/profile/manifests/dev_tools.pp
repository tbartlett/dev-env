class profile::dev_tools {

  $packages = ['automake',
               'gcc',
               'gcc-c++',
               'kernel-devel',
               'cmake',
               'python-devel',
              ]

  $packages.each |String $package| {
    package { "${package}":
      ensure => latest,
    }
  }
}
