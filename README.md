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
* Convert it to 640x making sure the vertical size is a multiple of 8, trying to minimize aspect ratio changes
* Do a two-pass conversion


See also: https://wiki.archlinux.org/index.php/FFmpeg




