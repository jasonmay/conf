check_exec dtach \
    && check_exec svscan \
    && (
        running svscan \
        || dtach -nc $HOME/.svscansocket svscan $HOME/.services
    )
