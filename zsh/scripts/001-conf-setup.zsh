function check_exec() {
    type "$1" 2>&1 >/dev/null
}

function running() {
    check_exec pgrep && pgrep "$1" > /dev/null
}

