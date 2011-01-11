export PATH="$HOME/bin:$HOME/.brew/Cellar/ruby/1.9.1-p378/bin:$HOME/.github/rakudo/parrot_install/bin:$HOME/.brew/bin:$HOME/.brew/sbin:/opt/local/apache2/bin:/opt/local/lib/postgresql83/bin:/usr/local/bin:/usr/bin/perlbin/core:/opt/local/bin:$PATH"

export MANPATH="$HOME/.github/rakudo/parrot_install/man:/usr/local/man:/opt/local/man:$MANPATH"

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
test -e $HOME/.perl5/perlbrew/etc/bashrc && source $HOME/.perl5/perlbrew/etc/bashrc
test -e $HOME/.perlbrew/etc/bashrc && source $HOME/.perlbrew/etc/bashrc

export MY_HOSTNAME=`hostname`

export HISTSIZE=100000
export SAVEHIST=100000

export ACK_COLOR_FILENAME=clear
export ACK_COLOR_MATCH=red

export DBIC_TRACE_PROFILE=console

export ANY_MOOSE=Moose

# rid duplicates
typeset -U manpath path cdpath fpath
