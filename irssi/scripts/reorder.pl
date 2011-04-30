# XXX NOTE this is a fork that is not intended to be merged
# I just wanted to format the file this way because I can just
# set the line number in vim to see what the channel will be. :)
#   - jasonmay
#
# Save window layout to an arbitrary file and load layouts upon demand
# Useful for being able to temporarily reorder your windows and then reverting to your "normal" layout
# Also useful as an easy way to reorder your windows
#
# A special thanks to billnye, Zed` and Bazerka for their help
#
# Usage:
#  /layout_save filename
#    Saves the layout to the textfile "filename.layout"
#  /layout_load filename
#    Loads the layout from the textfile "filename.layout"
#  /set layout_savepath path
#    Use to set a default path for layouts

use strict;
use Irssi;
use Data::Dumper;
use vars qw($VERSION %IRSSI);
use POSIX 'strftime';

%IRSSI = (
    authors     => "Isaac G",
    contact     => "irssi\@isaac.otherinbox.com",
    name        => "reorder",
    description => "Reordering windows based on a textfile.",
    license     => "GPL",
);

sub doFilenameFixing {
    my ($filename) = @_;

    my $i=1;

    unless (length($filename)) {
        my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
            = localtime(time);

        $filename = POSIX::strftime("%y%m%d",
                        $sec, $min, $hour, $mday, $mon, $year);
    }

    my $glob = glob($filename);
    $filename = $glob if $glob;

    if ($filename !~ m[^/] and $filename =~ m[/]) {
        # XXX why is this bad exactly...?
        die "I don't like /'s in filenames. " .
            "Unless you want to specify an absolute path."
    }

    $filename .= '.layout' unless $filename =~ /.layout$/;
    my $path = Irssi::settings_get_str('layout_savepath');
    $path .= '/' unless $path =~ m[/$];
    $filename = $path . $filename unless $filename =~ m[/];

    return $filename;
}

sub canReadFile {
    my ($filename) = @_;

    warn "No such file $filename"      unless -f $filename;
    warn "Can not read file $filename" unless -r $filename;

    return 1;
}

# Save a list of refnum and window info to file
sub cmd_layout_save {
    my ($filename, $data, $more) = @_;
    my $fh;

    $filename = doFilenameFixing($filename);
    return unless $filename;

    # Order by ref. Print ref and an id tag
    my %layout;
    for my $win (Irssi::windows()) {
        my $id = $win->{name} ||
        "$win->{active}->{name}:$win->{active}->{server}->{tag}";

        $layout{ $win->{'refnum'} } = $id;
    }
    my @refs = sort { $a <=> $b } keys %layout;

    open my $fh, ">", $filename
        or die "Can not open $filename";

    foreach my $line (1 .. $refs[-1]) {
        printf $fh "%s\n", exists($layout{$line}) ? $layout{$line} : '';
    }

    close $fh;
    print "Layout saved to $filename";
}

# Load a list and use it to reorder
sub cmd_layout_load {
    # Check filename supplied, exists and readable
    my ($filename, $data, $more) = @_;
    $filename = doFilenameFixing($filename);

    return unless $filename;
    return unless canReadFile($filename);

    my @layout;

    # Pull the refnum and id
    open my $fh, "<", $filename
        or die "Can not open file $filename.";

    while (my $line = <$fh>) {
        chomp $line;
        next unless $line =~ /\S/;

        # track current line in $fh, and $line itself
        push @layout, {refnum => $., id => $line};
    }
    close $fh;

    # For each layout item from the file, find the window and set it's ref to that number
    for my $position (sort {$a->{'refnum'} <=> $b->{'refnum'}} @layout) {
        for my $win (Irssi::windows()) {
            my $chan = $win->{active}->{name};
            my $network = $win->{active}->{server}->{tag};

            my $id = $win->{name} || "$chan:$network";

            if ($id eq $position->{id} or $id.'2' eq $position->{id}) {
                $win->set_refnum($position->{refnum});
                last;
            }
        }
    }
}

Irssi::settings_add_str('misc', 'layout_savepath', Irssi::get_irssi_dir());
Irssi::settings_add_bool('misc', 'layout_loadonstart', 1);

Irssi::command_bind( 'layout_save', 'cmd_layout_save' );
Irssi::command_bind( 'layout_load', 'cmd_layout_load' );

# XXX not really sure what this is aiming to do, but I don't want it
#cmd_layout_load() if (Irssi::settings_get_bool('layout_loadonstart'));
