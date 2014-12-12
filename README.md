toonverter
==========

A set of scripts to convert cartoons for my kids' old DVD player

This old DVD player has a few limitations (that I learn about by toying with it):

* DIVX/XVID video streams
* MP3 audio streams
* Not sure it supports 800 pixels across. 640 works well. The vertical size seems to be an integer that is a multiple of 8.
* 25fps

So what I do is usually:

* Take video in any modern format
* Convert it to 640px making sure the vertical size is a multiple of 8, trying to minimize aspect ratio changes
* Do a two-pass conversion

Using it
--------

How to run the scripts:

	./convert_all.sh substring

Converts all the files that contain substring (case-sensitive) to .avi's.

	./convert_xvid.sh filename

Converts one single file to file.avi, having a size which is no more than 640px across,
and the correct number of vertical pixes, as the closest multiple of 8.


Special tweaks
--------------

* How do I change the screen width? edit optsize.pl
* How do I choose a specific audio-video stream? edit convert_xvid.sh and modify MAPS. "-map 0:a:1" means that 
  stream 0 for audio in the encoded file is stream 1 in the source.
* How do I add subtitles? 


See also
--------

See also: https://wiki.archlinux.org/index.php/FFmpeg

On quality: http://stackoverflow.com/questions/25569180/ffmpeg-convert-without-loss-quality



