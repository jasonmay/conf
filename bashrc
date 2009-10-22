# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions
alias ivm='vim'
alias bim='vim'
alias vo,='vim'
alias cim='vim'

alias ar="sudo /etc/init.d/httpd restart"
alias sl="ls"
alias p='perl -I/data/silverback/lib'
alias pp='perl -I/data/branch.prod/silverback/lib'
alias www='cd /data/silverback/www'
alias lib='cd /data/silverback/lib'
alias prod='cd /data/branch.prod/silverback'
alias elements='cd /data/silverback/lib/SB/AffiliateUI/Elements'
alias stats='cd /data/silverback/bin/stats'
alias ds='cd /data/silverback'
alias deliver='cd /data/silverback/bin/leads/deliver'
alias default='cd /data/silverback/etc/AffiliateUI/default'
alias common='cd /data/silverback/www/AffiliateUI/silverbackads.com/common'
alias crondev='vim /data/silverback/systems/jobs01/cron/sbcron'
alias cronprod='vim /data/branch.prod/silverback/systems/jobs01/cron/sbcron'

alias cpcron='cp /data/silverback/systems/jobs01/cron/sbcron /data/branch.prod/silverback/systems/jobs01/cron/sbcron'
alias crondevci='(cd /data/silverback && svn ci /data/silverback/systems/jobs01/cron/sbcron)'
alias cronprodci='(cd /data/branch.prod/silverback && svn ci /data/branch.prod/silverback/systems/jobs01/cron/sbcron)'

export PAGER=less

umask 002

export  PS1="[\u@\h \[\e[1;32m\]\w\[\e[m\]]\\$ "
export EDITOR='vim'
