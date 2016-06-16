# Class packer
# ===========================
#
# Installs a specified version of packer
#
# Parameters
# ----------
#
# * `version`
# Optional. The version of go to install. Defaults to 0.8.6
#
# Examples
# --------
#
# @example
#   class { '::root':
#     password => '<your password hash>',
#   }
#
class root($password) {

  user { 'root':
    password       => $password,
    purge_ssh_keys => true,
    home           => '/root',
  }

  file { '/root/.ssh':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    require => User['root'],
  }

  $keys = hiera_hash('root::ssh_authorized_keys', undef)

  if !empty($keys) {
    create_resources(ssh_authorized_key, $keys, { user => 'root' })
  }
}

