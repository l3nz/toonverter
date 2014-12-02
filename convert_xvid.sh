#! /bin/bash

# see https://github.com/l3nz/toonverter

FILEIN="$1"
FILEOUT="$1.avi"


FFMPEG=ffmpeg
VSIZE=$(./optsize.pl "$FILEIN")

#set SIZE=-s 480:272 -b:v 600k
#set SIZE=-s 576:320 -b:v 800k

#set SIZE=-s 640x272 -b:v 820k
#SIZE="-s 640x288 -r 25 -b:v 1200k"
SIZE="-s $VSIZE -r 25 -b:v 1200k"
#set SIZE= -b:v 820k -r 25

echo "Converting $FILEIN as $SIZE"

#ONEMINUTE="-t 3:00"
#ONEMINUTE=
VIDEO="-vtag DIVX -c:v mpeg4 -f avi $SIZE"
AUDIO="-acodec libmp3lame -ac 2 -vol 256 -b:a 128k"
NOAUDIO="-an"

rm -f ffmpeg2pass-0.log
$FFMPEG  -i "$FILEIN" $ONEMINUTE $VIDEO $NOAUDIO -pass 1 -y /dev/null
$FFMPEG  -i "$FILEIN" $ONEMINUTE $VIDEO $AUDIO   -pass 2 "$FILEOUT"


