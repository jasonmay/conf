#alias rt='PERL5LIB=/opt/rt4/lib:$PERL5LIB'
#function rtp() {
#    pkill -f rt4test
#    rm -rf var t/tmp
#    prove --timer -wl $@
#}
#
#function rtp-mysql() {
#    export RT_DBA_USER="$RT_DBA_USER_MYSQL"
#    rtp $@
#}
#
#function rtpp() {
#    RT_TEST_PARALLEL=1 rtp -j9 $@
#}
#
#function rtpp-mysql() {
#    export RT_DBA_USER="$RT_DBA_USER_MYSQL"
#    rtpp $@
#}
#
#alias rtversion="rt perl -MRT -le 'print \$RT::VERSION'"
#
#function rebuild-rt-db() {
#    dropdb rt4
#    make initdb
#}
#
#function rebuild-rt3-db() {
#    dropdb rt3
#    make initdb
#}
#
#function rebuild-rt-db-mysql() {
#    mysqladmin drop rt4 -uroot -p
#    make initdb
#}
#
#function rebuild-rt3-db-mysql() {
#    mysqladmin drop rt3 -uroot -p
#    make initdb
#}
#
#function mack() {
#    ack -a $@ share/html
#}
#
#function config-rt() {
#    ./configure.ac --with-db-type=Pg \
#        --with-db-rt-user=myrtuser \
#        --with-db-rt-pass=myrtpass \
#        --with-db-dba=jasonmay \
#        --with-db-database=rt4 \
#        --enable-devel-mode \
#        --with-my-user-group \
#        --enable-layout=inplace
#}
#
#function config-rt3() {
#    ./configure.ac --with-db-type=Pg \
#        --with-db-rt-user=myrtuser \
#        --with-db-rt-pass=myrtpass \
#        --with-db-dba=jasonmay \
#        --with-db-database=rt3 \
#        --enable-devel-mode \
#        --with-my-user-group \
#        --enable-layout=inplace
#}
#
#function config-rt-mysql() {
#    ./configure.ac --with-db-type=mysql \
#        --with-db-rt-user=myrtuser \
#        --with-db-rt-pass=myrtpass \
#        --with-db-dba=root \
#        --with-db-database=rt4 \
#        --enable-devel-mode \
#        --disable-graphviz \
#        --disable-gpg \
#        --with-my-user-group \
#        --enable-layout=inplace
#}
#
#function config-rt3-mysql() {
#    ./configure.ac --with-db-type=mysql \
#        --with-db-rt-user=myrtuser \
#        --with-db-rt-pass=myrtpass \
#        --with-db-dba=root \
#        --with-db-database=rt3 \
#        --enable-devel-mode \
#        --disable-graphviz \
#        --disable-gpg \
#        --with-my-user-group \
#        --enable-layout=inplace
#}
#
