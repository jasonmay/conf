alias rt='PERL5LIB=/opt/rt4/lib:$PERL5LIB'
function rtp() {
    pkill -f rt4test
    rm -rf var t/tmp
    prove --timer -wl $@
}

function rtp-mysql() {
    export RT_DBA_USER="$RT_DBA_USER_MYSQL"
    rtp $@
}

function rtpp() {
    RT_TEST_PARALLEL=1 rtp -j9 $@
}

function rtpp-mysql() {
    export RT_DBA_USER="$RT_DBA_USER_MYSQL"
    rtpp $@
}

alias rtversion="rt perl -MRT -le 'print \$RT::VERSION'"

function mack() {
    ack -a $@ share/html
}

function config-rt() {
    echo 'Set($WebPort, 5000);' >> etc/RT_SiteConfig.pm
    ./configure.ac --with-db-type=Pg \
        --with-db-rt-user=myrtuser \
        --with-db-rt-pass=myrtpass \
        --with-db-dba=jasonmay \
        --with-db-database=rt4 \
        --enable-devel-mode \
        --with-my-user-group \
        --enable-layout=inplace
}

function config-rt-mysql() {
    echo 'Set($WebPort, 5000);' >> etc/RT_SiteConfig.pm
    ./configure.ac --with-db-type=mysql \
        --with-db-rt-user=myrtuser \
        --with-db-rt-pass=myrtpass \
        --with-db-dba=root \
        --with-db-database=rt4 \
        --enable-devel-mode \
        --with-my-user-group \
        --enable-layout=inplace
}

function plackup-rt() {
    echo -n "Remvoe ./var? ^C to say no"; read
    rm -rf var
    plackup -MCwd -e 'do(Cwd::abs_path."/sbin/rt-server")'
}
