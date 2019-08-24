#!/bin/bash
set -e

# I wish ansible was a little more bare in its core dependencies
# let's do some automtion in a very non-ansible way


if ! which gcc > /dev/null 2>&1; then
    sudo yum -y install centos-release-scl yum-utils
    hash -r
    sudo yum-config-manager --enable rhel-server-rhscl-7-rpms
    sudo yum install -y devtoolset-6
	sudo yum -y install ansible epel-release git gcc zlib-devel bzip2-devel readline-devel sqlite-devel openssl-devel libffi-devel
fi

if [ ! -x "$HOME/.pyenv/bin/pyenv" ]; then
	curl -L https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
fi

export PATH="$HOME/.pyenv/bin:$PATH"
hash -r

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ ! -x "$(pyenv root)/versions/3.7.3/bin/python3" ]; then
  pyenv install 3.7.3
fi

/usr/bin/ansible-playbook $@
