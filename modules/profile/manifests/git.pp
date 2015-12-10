class profile::git {
    package { 'git':
      ensure => latest,
    }
}
