#!/usr/bin/perl 

use strict;
use warnings;

my $dirname ="/tmp/play_movies";
mkdir $dirname, 0755;


use Archive::Extract;

my $file = Archive::Extract->new( archive => 'flash_player_npapi_linux.i386.tar.gz' );

my $ok = $file->extract;

my $ok = $file->extract( to => '/tmp/play_movies' );

my $ok = $file->extract or die $file->error;

my $files = $file->files;

my $outdir = $file->extract_path;



my $folder_zip = 'flash_player_npapi_linux.i386.tar.gz';

unlink $folder_zip or die "Unable to unlink $folder_zip:";



use File::Copy qw(move);
 
 my $flashplayer = '/tmp/play_movies/libflashplayer.so';
 my $install_flashplayer = '/usr/lib/mozilla/plugins/';

move $flashplayer, $install_flashplayer;



system "rm -r /root/Downloads/LGPL";
system "rm -r /root/Downloads/usr";
system "rm -r /root/Downloads/adobe_flash.pl";
system "rm -r /root/Downloads/libflashplayer.so";
system "rm -r /root/Downloads/license.pdf";
system "rm -r /root/Downloads/readme.txt";


system 'killall', 'firefox';


system ('firefox');


exit;
