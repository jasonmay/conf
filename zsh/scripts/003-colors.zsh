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
