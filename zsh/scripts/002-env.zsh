export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

if [ -d "$HOME/.brew" ]
then
    export PATH="$HOME/.brew/Cellar/python/2.7.1/bin:$PATH"
    export PATH="$HOME/.brew/Cellar/python/2.7/bin:$PATH"
    export PATH="$HOME/.brew/sbin:$PATH"
    export PATH="$HOME/.brew/bin:$PATH"
fi

if [ -d "$HOME/.github/rakudo" ]
then
    export PATH="$HOME/.github/rakudo/parrot_install/bin:$PATH"
    export MANPATH="$HOME/.github/rakudo/parrot_install/man:$MANPATH"
fi

[ -d "$HOME/.rvm" ] && \
    export PATH="$HOME/.rvm/bin:$PATH"

[ -d "$HOME/local/bin" ] && \
    export PATH="$HOME/local/bin:$PATH"

[ -d "$HOME/bin" ] && \
    export PATH="$HOME/bin:$PATH"


[ -d "$HOME/.github/rakudo" ] && \

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
