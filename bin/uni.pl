#!/usr/bin/env perl
use strict;
use warnings;
use Encode;

exit unless @ARGV;

my $string = eval('"\N{U+'.$ARGV[0].'}"');
$string = Encode::encode_utf8($string);
print "$string\n";
