if match(expand("%:p:h"), "/Users/jasonmay/proj/neptune") == 0
    map <leader>su :silent let __run=system("(svc -d ~/.services/neptune/universe; sleep 1; svc -o ~/.services/neptune/universe) 2>&1 > /dev/null")<cr>:redraw!<cr>
    map <leader>st :silent let __run=system("(svc -d ~/.services/neptune/test; sleep 1; svc -o ~/.services/neptune/test) 2>&1 > /dev/null")<cr>:redraw!<cr>
    map <leader>sr :!sbt 'run-main org.jarsonmar.neptune.RedisReload'
    map <leader>sc :silent let __run=system("(svc -d ~/.services/neptune/controller; sleep 1; svc -o ~/.services/neptune/controller) 2>&1 > /dev/null")<cr>:redraw!<cr>
endif
