#!/usr/bin/env perl
use strict;
use warnings;

if (system('dzil', 'new', @ARGV) == 0) {
    (my $dir = $ARGV[0]) =~ s/::/-/g;

    rename $dir => lc($dir);
    warn "[JM] renamed ./$dir to ./".lc($dir)."\n";
}

