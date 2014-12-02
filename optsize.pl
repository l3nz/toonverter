#! /usr/bin/perl
use strict;

sub adjSize {
	my ( $size, $block ) = @_;

	$size = int($size);
	my $remainder = $size % $block;
	if (  $remainder != 0) {
		if ( $remainder < ($block/2) ) {
			$size = $size - $remainder;
		} else {
			$size = $size + ( $block - $remainder );
		}
	}
	return $size;
}

# Makes sure that all sizes are on a $BLOCK boundary

my $FILE=$ARGV[0];
my $maxwidth=640;
my $BLKSIZE=8;

my $width=0;
my $height=0;

my $ffmpeg = qx/ffmpeg -i "$FILE" 2>&1/;

if ( $ffmpeg =~ / (\d\d+)x(\d\d+)/ ){
	$width=$1;
	$height=$2;
} else {
	print $ffmpeg;
	exit(-1);
}



my $ratio=$height/$width;
my $realwidth=adjSize( $width, $BLKSIZE);

if ( $realwidth > $maxwidth ) {
	$realwidth = $maxwidth;
}

my $realheight=adjSize( $realwidth * $ratio, $BLKSIZE);

print "${realwidth}x${realheight}"
