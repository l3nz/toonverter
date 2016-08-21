#! /bin/bash

# see https://github.com/l3nz/toonverter

FILEIN="$1"
FILEOUT="$1.avi"


FFMPEG=ffmpeg
VSIZE=$(./optsize.pl "$FILEIN")

#set SIZE=-s 480:272 -b:v 600k
#set SIZE=-s 576:320 -b:v 800k

#set VSIZE=1280x880
#set SIZE=-s 640x272 -b:v 820k
#SIZE="-s 640x288 -r 25 -b:v 1200k"
SIZE="-s $VSIZE -r 25 -b:v 1300k"
#set SIZE= -b:v 820k -r 25

#video QM
#SIZE="-s 1280x880 -r 25 -b:v 1800k"



echo "Converting $FILEIN as $SIZE"

#ONEMINUTE="-t 13:00"
VIDEO="-vtag DIVX -c:v mpeg4 -f avi $SIZE"
AUDIO="-acodec libmp3lame -ac 2 -vol 256 -b:a 128k"
#MAPS="-map 0:0 -map 0:2"
#MAPS="-map 0:v:0 -map 0:a:0 -filter_complex '[0:v][0:s]overlay'"
NOAUDIO="-an"

LOGFILE=convertxvid_$$


rm -f $LOGFILE
$FFMPEG  -i "$FILEIN" $ONEMINUTE $VIDEO $MAPS $NOAUDIO -pass 1 -passlogfile $LOGFILE -y /dev/null
$FFMPEG  -i "$FILEIN" $ONEMINUTE $VIDEO $MAPS $AUDIO   -pass 2 -passlogfile $LOGFILE "$FILEOUT"


