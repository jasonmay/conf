export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

if [ -d "/usr/lib/gettext" ]
then
    export PATH="/usr/lib/gettext:$PATH"
fi

for brewdir in "$HOME/.brew" /usr/local
do
    if [ -d "$brewdir/Library/Formula" ]
    then
        export PATH="$brewdir/Cellar/python/2.7.1/bin:$PATH"
        export PATH="$brewdir/Cellar/python/2.7/bin:$PATH"
        export PATH="$brewdir/sbin:$PATH"
        export PATH="$brewdir/bin:$PATH"
        export INCLUDES="$brewdir/include"
        break
    fi
done

if [ -d "$HOME/.github/rakudo" ]
then
    export PATH="$HOME/.github/rakudo/parrot_install/bin:$PATH"
    export MANPATH="$HOME/.github/rakudo/parrot_install/man:$MANPATH"
fi

if [ -d "$HOME/repos/git/languages/rakudo" ]
then
    export PATH="$HOME/repos/git/languages/rakudo/parrot_install/bin:$PATH"
    export MANPATH="$HOME/repos/git/languages/rakudo/parrot_install/man:$MANPATH"
fi

if [ -d "$HOME/android" ]
then
    export PATH="$HOME/android/platform-tools:$HOME/android/tools:$PATH"
fi

[ -d "$HOME/.rvm" ] && \
    export PATH="$HOME/.rvm/bin:$PATH"

[ -d "$HOME/local/bin" ] && \
    export PATH="$HOME/local/bin:$PATH"

[ -d "$HOME/bin" ] && \
    export PATH="$HOME/bin:$PATH"

[ -d "/usr/local/texlive/2011/bin" ] && \
    export PATH="/usr/local/texlive/2011/bin/universal-darwin:$PATH"

[ -d "/opt/rt4/bin" ] && \
    export PATH="/opt/rt4/bin:$PATH"

[ -d "/usr/local/lib/node" ] && \
    export NODE_PATH="/usr/local/lib/node"

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
[ -d "$PERLBREW_ROOT" ] || export PERLBREW_ROOT=$HOME/.perlbrew
test -e $PERLBREW_ROOT/etc/bashrc && source $PERLBREW_ROOT/etc/bashrc

export MY_HOSTNAME=`hostname`

export HISTSIZE=100000
export SAVEHIST=100000

# I18N::LangTags::Detect - used in RT3
export IGNORE_WIN32_LOCALE=1

export ACK_COLOR_FILENAME=clear
export ACK_COLOR_MATCH=red

export DBIC_TRACE_PROFILE=console

export ANY_MOOSE=Moose

export PERL_PREFER_CPAN_CLIENT=cpanm
if [ -d "$HOME/.perl5/minicpan" ]
then
    export PERL_CPANM_OPT="--prompt --mirror file://$HOME/.perl5/minicpan/ --mirror http://cpan.pair.com --mirror http://cpan.metacpan.org"
elif [ -d "$HOME/.minicpan" ]
then
    export PERL_CPANM_OPT="--prompt --mirror file://$HOME/.minicpan/ --mirror http://cpan.pair.com --mirror http://cpan.metacpan.org"
else
    export PERL_CPANM_OPT="--prompt --mirror http://cpan.pair.com --mirror http://cpan.metacpan.org"
fi

# rid duplicates
typeset -U manpath path cdpath fpath
