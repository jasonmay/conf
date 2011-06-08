
[ -z "$(pidof svscan)" ] && rm -f $HOME/.svscansocket

check_exec dtach               \
    && check_exec svscan       \
    && [ -z "$(pidof svscan)" ] \
    && (
        dtach -n $HOME/.svscansocket svscan $HOME/.services
    )
