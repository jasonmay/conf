# I wrote this to help myself remember all my shortcuts
# Kinda fortune-esque
export QUICK_NOTE=
function add_quick_note() {
    export QUICK_NOTE="$QUICK_NOTE$@\n"
}

unset zle_bracketed_paste

[ -e ~/.local.zsh ] && source ~/.local.zsh

# if [ -d "$HOME/.oh-my-zsh" ]
# then
#     ZSH=$HOME/.oh-my-zsh
#     ZSH_THEME="robbyrussell"
#     plugins=(git github safe-paste)
#     source $ZSH/oh-my-zsh.sh
# fi

if type -f jasonmay_after_omz > /dev/null; then
    jasonmay_after_omz
fi

[ -d ~/.zscripts ] &&  find ~/.zscripts/ \( -type f -o -type l \) -name '*.zsh' | sort | \
    while read z; do source "$z"; done

if type -f jasonmay_after_zscripts > /dev/null; then
    jasonmay_after_zscripts
fi

unsetopt correct_all

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

add_quick_note "ttttt: tmux list-sessions"
alias ttttt='tmux list-sessions'

function check_exec() {
    type "$1" 2>&1 >/dev/null
}

function running() {
    check_exec pgrep && pgrep "$1" > /dev/null
}

add_quick_note "netstat_useful: alias for netstat -a --inet --numeric-port"
alias netstat_useful="netstat -a --inet --numeric-port"

add_quick_note "grep: grep --color=auto"
alias grep='grep --color=auto'

add_quick_note "if you type cd too quickly, d will work too"
alias d=cd
add_quick_note "if you type ls and then cd too quickly, lsc will work too"
alias lsc=ls

add_quick_note "b: bundle exec"
alias b='bundle exec'

add_quick_note "tto: telnet termcast.org"
alias tto='telnet termcast.org'
add_quick_note "nao: telnet nethack.alt.org"
alias nao='telnet nethack.alt.org'

alias hhh='ssh 192.168.0.15'

# if check_exec gls
# then
#     alias ls='gls --color=auto'
# else
#     alias ls='ls -G'
# fi
alias sl='ls'
alias lcd='ls;cd'
for vim_typo in viim vmi bim cim vo, viom vin ivm vom; do alias "$vim_typo"='vim'; done
for rails_typo in ralis rials; do alias "$rails_typo"='rails'; done

add_quick_note 'typing "-" does popd'
alias -- '-'='popd'

alias irc='ssh -t jasonmay@n.jmay.me dtach -A .irssi.sock irssi'

add_quick_note 'ttt: tmux attach -t'
alias ttt='tmux attach -t'

function ag() {
    rg -p $@ | less -RSFX
}

function rr() {
    VFILE=$(history | awk '{if ($2 == "vim") print $3}' | tail -n 100 | sort | uniq | while read f; do [ -f "$f" ] && echo "$f"; done | fzf)
    print -z vim $VFILE
}

add_quick_note "abs function shows the absolute path"
function abs() { perl -MCwd=abs_path -le "print abs_path q[$1]" }

if [[ $(uname) == "Darwin" ]]
then
    add_quick_note "i <package> will install package"
    add_quick_note "s <package> will search for package"
    alias i='brew install'
    function s() {
        [ -z "$1" ] || brew search $*
    }
fi
if [[ ! -o interactive ]]; then
    return
fi

TMUX_SESSIONS="
$WORK_SESSIONS
"

function create_tmux_sessions() {
    which tmux >/dev/null 2>&1 || return
    [ -z $TMUX ] || return

    tmux_session() {
        session=$1
        spath=$2

        tmux list-sessions 2>&1 | grep -q $session && return
        tmux new-session -s ${session} -c "$HOME/${spath}" -d
        echo -e "\e[1;35m[tmux]\e[m Created session: \e[1;37m$session\e[m"
    }

    tmux new-session -s foo -d # prevent 'connection refused' error
    echo $TMUX_SESSIONS | while read session spath
    do
        [ -z $session ] && continue
        tmux_session $session $spath
    done
    tmux kill-session -t foo # kill throwaway session
}

function ReplayCommits() {
    target_branch="$1"
    git rebase -i $(git merge-base $target_branch HEAD)
}

#create_tmux_sessions
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:/usr/share/man:$MANPATH"

[ -d "$HOME/.local/gradle" ] && \
    export PATH="$HOME/.local/gradle/bin:$PATH"

export LESS="-r -f"
export EDITOR=vim
setopt noglobalrcs
export PAGER="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
check_exec lesspipe    && eval `lesspipe`
check_exec lesspipe.sh && eval `lesspipe.sh`

export MY_HOSTNAME=`hostname -s`
export OOO_FORCE_DESKTOP=gnome

export MY_HOSTNAME=`hostname`

export HISTSIZE=100000
export SAVEHIST=100000

REPORTTIME=5


# rid duplicates
typeset -U manpath path cdpath fpath
function vim {
    local zsh_hist_fname
    zsh_hist_fname=$HOME/.vim/hist$$
    command vim --cmd "let g:_zsh_hist_fname = '$zsh_hist_fname'" "$@"
    if [[ -r $zsh_hist_fname ]]; then
        while read line; do
            if echo $line | grep -q "[[:space:]']"; then
                line=${line/\'/\'\\\\\'\'}
                line="'$line'"
            fi
            if [[ $line != "GoToFile" ]]; then
                print -s "vim $line"
            fi
        done < $zsh_hist_fname

        fc -AI
        rm -f $zsh_hist_fname

        # remove all the 'v' entries in the history
        fc -R =(history | awk '{if ($2 != "v") { sub("^ *[0-9]+ *", ""); print $0 } }')
    fi
}
function test_tput {
    local tmp
    [[ -x "$(which tput 2>/dev/null)" ]] || return 1
    tmp=$(tput setf 0)
}
if test_tput; then
    GRAY=$(tput setf 8)
    BLACK=$(tput setf 0)
    RED=$(tput setf 4)
    HIRED=$(tput setf 9)
    GREEN=$(tput setf 2)
    HIGREEN=$(tput setf 10)
    YELLOW=$(tput setf 6)
    HIYELLOW=$(tput setf 11)
    BLUE=$(tput setf 1)
    HIBLUE=$(tput setf 12)
    MAGENTA=$(tput setf 5)
    HIMAGENTA=$(tput setf 13)
    CYAN=$(tput setf 3)
    HICYAN=$(tput setf 14)
    WHITE=$(tput setf 7)
    HIWHITE=$(tput setf 15)
    BOLD=$(tput bold)
    NORM=$(tput sgr0)
else
    GRAY=$(printf "\033[0;30m")
    BLACK=$(printf "\033[1;30m")
    RED=$(printf "\033[0;31m")
    HIRED=$(printf "\033[1;31m")
    GREEN=$(printf "\033[0;32m")
    HIGREEN=$(printf "\033[1;32m")
    YELLOW=$(printf "\033[0;33m")
    HIYELLOW=$(printf "\033[1;33m")
    BLUE=$(printf "\033[0;34m")
    HIBLUE=$(printf "\033[1;34m")
    MAGENTA=$(printf "\033[0;35m")
    HIMAGENTA=$(printf "\033[1;35m")
    CYAN=$(printf "\033[0;36m")
    HICYAN=$(printf "\033[1;36m")
    WHITE=$(printf "\033[0;37m")
    HIWHITE=$(printf "\033[1;37m")
    BOLD=$(printf "\033[0;39m")
    NORM=$(printf "\033[0m")
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _approximate _prefix
zstyle ':completion:*' list-prompt '[%p] %l'
zstyle ':completion:*' matcher-list 'r:|[_-/]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle :compinstall filename "$HOME/.zshcomplete"

if [[ -z "$BROKEN_WORKSERVER_DIR" || ! -d "$BROKEN_WORKSERVER_DIR" ]]; then
    autoload -Uz compinit
    compinit
fi

setopt extended_history
setopt hist_ignore_space

autoload copy-earlier-word
zle -N copy-earlier-word

autoload edit-command-line
zle -N edit-command-line

setopt nobeep               # make things in the shell not beep
setopt auto_cd              # ".." implies "cd ..", etc.
setopt auto_pushd           # "cd" implies pushd all the time
setopt pushd_minus          # popd -#
setopt multios
setopt extended_glob        # ** does recursive globbing
setopt nullglob             # don't error if glob returns nothing
setopt list_ambiguous
setopt no_nomatch
setopt interactivecomments
setopt listpacked
setopt complete_in_word     # Pressing tab on apit<cursor>de does what you want
setopt no_case_glob

bindkey -v

# emacs bindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^N" accept-and-infer-next-history
bindkey "^P" push-line
bindkey "^R" history-incremental-search-backward
bindkey "^Y" yank
bindkey "^T" transpose-chars

bindkey " " magic-space
bindkey "\e[3~" delete-char

# shift-tab (^[[Z) normally puts it in vi mode :(
bindkey "\e[Z" expand-or-complete

bindkey -M vicmd v edit-command-line
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line

# if you go into vi mode and insert mode you
# normally can't do this kind of stuff
bindkey -M viins "^?" backward-delete-char
bindkey -M viins "^H" backward-delete-char
bindkey -M viins "^W" backward-delete-word
bindkey -M viins "^U" backward-kill-line
bindkey -M viins "^Y" yank

if [ -e /etc/debian_version ]
then
    alias i='sudo apt-get install'
    function s() {
        [ -z "$1" ] || sudo apt-cache search $*
    }
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

function gupo() {
    branch=$(git branch | grep '*' | cut -f 2 -d ' ')
    print -z 'git push --set-upstream origin '"$branch"
}

if type -f jasonmay_after_everything > /dev/null; then 
    jasonmay_after_everything
fi
echo $QUICK_NOTE | python3 -c "
import fileinput
import random
lines = []
for line in fileinput.input():
    lines += [line]
print(\"\033[1;33m================================================================\033[m\")
print(\"{}\".format(random.choice(lines).strip()))
print(\"\033[1;33m================================================================\033[m\")
"

printf "\e[?2004l"
export TERM=xterm-256color

alias z='vim ~/.local.zsh'
alias Z='exec zsh'

alias rrr='pip install -r requirements'

function j() {
    print -z vim $(history | awk '$2 == "vim" { print $3 }' | tail -n50 | fzf)
}
if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
    export PATH="$HOME/.pyenv/shims:$PATH"
fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


if which jenv > /dev/null; then eval "$(jenv init -)"; fi

bindkey "^B" backward-word

/usr/bin/ssh-add -K

export VUNDLE_RTP="${HOME}/.vim/bundle/Vundle.vim"

export PATH="$PATH:/Applications/Postgres.app//Contents/Versions/11/bin"
export PATH="$HOME/.local/vim/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

function NT() {
    tmux new-session -d ';' split-window -h ipython ';' last-pane ';' attach
}

function GT() {
    tmux new-session -d ';' split-window -h modd ';' last-pane ';' attach
}

function KT() {
    echo "cool with killing this session?"
    read
    tmux kill-session
}

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
bindkey -s "^ ^ " '^E^Uprint -z vim $(fzf)^M'

alias cy='cal -y'
alias vvv='vim ~/.vimrc'
alias zzz='vim ~/.zshrc'

function vrg() {
    vim $(rg --color=never -l $1)
}

export HASS_SERVER=http://192.168.0.15:8123
export HASS_TOKEN=$(cat ~/.ha_token)
#export LEFTHAND=1
