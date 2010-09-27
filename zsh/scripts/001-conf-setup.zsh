function check_exec() {
    [ ! -z $(which "$1" | grep -v 'not found') ]
}

function running() {
    check_exec pgrep && pgrep "$1" > /dev/null
}

