if [[ $(uname) == "Darwin" ]]
then
    alias i='brew install'
    function s() {
        [ -z "$1" ] || brew install $*
    }
fi
