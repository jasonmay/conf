check_exec dtach \
    && check_exec svscan \
    && (
        [ -e $HOME/.svscansocket ] \
        || dtach -nc $HOME/.svscansocket svscan $HOME/.services
    )
