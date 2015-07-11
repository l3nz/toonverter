toonverter
==========

A set of scripts to convert cartoons for my kids' old DVD player.

This old DVD player has a few limitations (that I learnt about by toying with it):

* DIVX/XVID video streams
* MP3 audio streams
* Not sure it supports 800 pixels across. 640 works well. The vertical size 
  seems to be an integer that is a multiple of 8.
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
* How do I choose a specific audio-video stream? uncomment and set the MAPS variable. How? see below.
* How do I add subtitles? 

### Working with multiple audio streams

If you want to choose the audio stream to be included, you first have to map which streams are 
present in the file using "ffmpeg -i".

    Output #0, matroska, to 'output.mkv':
    Stream #0:0: Video 
    Stream #0:1: Audio EN
    Stream #0:2: Audio IT
    Stream #0:3: Subtitle EN

Say we want to keep only the video stream and the Italian audio. We would edit the line MAPS to

    MAPS="-map 0:0 -map 0:2"

to tell ffmpeg to process the file 'as-if' it only contained the video stream and the IT audio stream.

See also
--------

See also: https://wiki.archlinux.org/index.php/FFmpeg

On quality: http://stackoverflow.com/questions/25569180/ffmpeg-convert-without-loss-quality

On audio streams: http://ffmpeg.gusari.org/viewtopic.php?f=25&t=611

