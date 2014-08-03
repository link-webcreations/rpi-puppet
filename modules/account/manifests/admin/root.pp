class account::admin::root {
  user { 'root':
    password => '$1$xHDuxHRi$JhZnDOm4MOXeCrzLuwvmf/',
    ensure   => present,
  }
}
