#!/usr/bin/env zsh

BRANCH="$(git symbolic-ref HEAD 2>/dev/null)"
BRANCH="${BRANCH#refs/heads/}"
#[[ "$BRANCH" == "master" ]] && BRANCH="%{$(uni.pl 22a1)%G%}";
if [ -z "$BRANCH" ]
then
    BRANCH="$(git tag --contains HEAD 2>/dev/null | ( while read i; do echo $(git show $i~ --format='%at'| head -n1 | awk '{print $1}') $i 2>/dev/null; done ) | sort -n | awk '{print $2}' | head -n1)"
    [ -z "$BRANCH" ] || BRANCH="%{\e[32m%}$BRANCH%{\e[31m%}"
fi
if [ -z "$BRANCH" ]
then
    BRANCH="$(git rev-parse --short HEAD 2>/dev/null)"
    [ -z "$BRANCH" ] || BRANCH="%{\e[32m%}$BRANCH%{\e[31m%}"
fi
if [ -z "$(git ls-files --modified 2>/dev/null)" ]
then
    DIRTY_REPO=1
fi;
[ -z "$BRANCH" ] && exit
if [ ! -z "$DIRTY_REPO" ]
then
    echo "<${BRANCH}%{\e[m%}>"
else
    echo "%{\e[31m%}<%{\e[m%}$BRANCH%{\e[31m%}>%{\e[m%}"
fi
