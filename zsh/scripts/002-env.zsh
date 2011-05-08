export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/lib/postgresql83/bin:$PATH"
export PATH="/opt/local/apache2/bin:$PATH"
export PATH="$HOME/.brew/Cellar/python/2.7.1/bin:$PATH"
export PATH="$HOME/.brew/Cellar/python/2.7/bin:$PATH"
export PATH="$HOME/.brew/sbin:$PATH"
export PATH="$HOME/.brew/bin:$PATH"
export PATH="$HOME/.github/rakudo/parrot_install/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="$HOME/.github/rakudo/parrot_install/man:$MANPATH"

export LESS="-r -f"
export EDITOR=vim
setopt noglobalrcs
export PAGER=less
check_exec vimpager    && export PERLDOC_PAGER=vimpager PERLDOC="-t"
check_exec vimmanpager && export MANPAGER=vimmanpager
check_exec lesspipe    && eval `lesspipe`
check_exec lesspipe.sh && eval `lesspipe.sh`

export MY_HOSTNAME=`hostname -s`
export OOO_FORCE_DESKTOP=gnome

export PERLBREW_ROOT=$HOME/.perl5/perlbrew
test -e $PERLBREW_ROOT/etc/bashrc && source $PERLBREW_ROOT/etc/bashrc

export MY_HOSTNAME=`hostname`

export HISTSIZE=100000
export SAVEHIST=100000

export ACK_COLOR_FILENAME=clear
export ACK_COLOR_MATCH=red

export DBIC_TRACE_PROFILE=console

export ANY_MOOSE=Moose

export PERL_PREFER_CPAN_CLIENT=cpanm
export PERL_CPANM_OPT='--prompt'

export INCLUDES="$HOME/.brew/include"

# rid duplicates
typeset -U manpath path cdpath fpath
