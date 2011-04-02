#!/usr/bin/env zsh

STATUS="$(git status --porcelain 2>/dev/null)"
[[ $? != 0 ]] && exit;

BRANCH="$(git symbolic-ref HEAD 2>/dev/null)"
BRANCH="<${BRANCH#refs/heads/}>"
BRANCH="${BRANCH/<master>/#}"
if [ "x$STATUS" = "x" ]
then
    echo $BRANCH
else
    echo "%{\e[31m%}$BRANCH%{\e[m%}"
fi
