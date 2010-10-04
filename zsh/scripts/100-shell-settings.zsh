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
