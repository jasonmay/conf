# Print hilighted messages & private messages to window named "hilight"
# for irssi 0.7.99 by Timo Sirainen
use Irssi;
use vars qw($VERSION %IRSSI);
$VERSION = "0.01";
%IRSSI = (
    authors	=> "Jason May",
    contact	=> 'jason.a.may@gmail.com',
    name	=> 'alertsfile',
    description	=> 'Send all hilight messages to a file for external apps to process',
    license	=> "Public Domain",
    url		=> "http://irssi.org/",
    changed	=> "2002-03-04T22:47+0100"
);

sub sig_printtext {
  my ($dest, $text, $stripped) = @_;

  if (($dest->{level} & (MSGLEVEL_HILIGHT|MSGLEVEL_MSGS)) &&
      ($dest->{level} & MSGLEVEL_NOHILIGHT) == 0) {
    $window = Irssi::window_find_name('hilight');

    open my $fh, '>>', "$ENV{HOME}/.growl-alerts";
    print $fh "$stripped\n";
    close $fh;
  }
}

Irssi::signal_add('print text', 'sig_printtext');
