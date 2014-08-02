#!/usr/bin/perl

#-------------------------------------------------------------
# Perforce download utility.
# This script downloads files from a perforce server
# to a local directory, remaining the depot tree structure.
#
# Usage example:
#   p4-download //depot/foo/bar/...
#
# In the above case, the directory "depot/foo/bar"
# will be automatically created in the current directory.
#
# ChangeLog:
#   2010-01-08 Created. -- M.Ohta
#-------------------------------------------------------------
use strict;

if (@ARGV == 0) {
    die "Usage: p4-download //depot/foo/bar/...\n";
}

my $path = join(' ', @ARGV);

for (`p4 files $path`) {
    chomp;
    s/#.*//;
    my $dst = substr($_, 2);  # remove '//' from the path.
    print "$dst\n";
    system("p4 print -o $dst -q $_");
}
