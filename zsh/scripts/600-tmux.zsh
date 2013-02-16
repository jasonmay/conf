TMUX_SESSIONS="
$WORK_SESSIONS
vimrc .vim/bundle/jasonmay
"

function create_tmux_sessions() {
    which tmux >/dev/null 2>&1 || return
    [ -z $TMUX ] || return

    tmux_session() {
        session=$1
        spath=$2

        tmux list-sessions 2>&1 | grep -q $session && return
        tmux set-option -g default-path "$HOME/${spath}" > /dev/null
        tmux new-session -s ${session} -d
        tmux send-keys -t ${session} "cd $HOME/${spath};clear" "ENTER"
        tmux set-option -t ${session} default-path "$HOME/${spath}" > /dev/null
        echo -e "\e[1;35m[tmux]\e[m Created session: \e[1;37m$session\e[m"
    }

    tmux new-session -s foo -d # prevent 'connection refused' error
    echo $TMUX_SESSIONS | while read session spath
    do
        [ -z $session ] && continue
        tmux_session $session $spath
    done
    tmux kill-session -t foo # kill throwaway session
    tmux set-option -g default-path "." > /dev/null
}

create_tmux_sessions
