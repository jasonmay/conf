#!/bin/bash

# I wish ansible was a little more bare in its core dependencies
# let's do some automtion in a very non-ansible way

if [ ! -x /usr/local/bin/brew ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ ! -x /usr/local/bin/ansible-playbook ]; then
  /usr/local/bin/brew install ansible
fi

if [ ! -x /usr/local/bin/pyenv ]; then
  /usr/local/bin/brew install pyenv pyenv-virtualenv
fi

if [ ! -x "${HOME}/.pyenv/versions/3.7.3/bin/python3" ]; then
  CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" /usr/local/bin/pyenv install 3.7.3
fi

if [ ! -d "${HOME}/.pyenv/versions/conf-ansible" ]; then
  /usr/local/bin/pyenv virtualenv 3.7.3 conf-ansible
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ ! -x "${HOME}/.pyenv/versions/conf-ansible/bin/ansible-playbook" ]; then
  "${HOME}/.pyenv/versions/conf-ansible/bin/pip3" install ansible
fi

"${HOME}/.pyenv/versions/conf-ansible/bin/ansible-playbook" $@
