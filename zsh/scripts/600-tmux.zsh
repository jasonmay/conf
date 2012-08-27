TMUX_SESSIONS="
$WORK_SESSIONS
"

(
    which tmux >/dev/null 2>&1 || exit
    tmux list-sessions 2>&1 | grep -q tss && exit

    tmux_session() {
        session=$1
        spath=$2

        tmux set-option -g -s default-path "$HOME/${spath}"
        tmux new-session -s ${session} -d
        tmux send-keys -t ${session} "cd $HOME/${spath};clear" "ENTER"
        tmux set-option -s -t ${session} default-path "$HOME/${spath}"
    }

    tmux new-session -s foo -d # prevent 'connection refused' error
    echo $TMUX_SESSIONS | while read session spath
    do
        [ -z $session ] && continue
        tmux_session $session $spath
    done
    tmux kill-session -t foo # kill throwaway session
    tmux set-option -g default-path "$HOME"
)
