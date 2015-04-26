#!/bin/sh

RAW_FILES=$(ls -1)

FILES=$(basename -s .mp4 $RAW_FILES)

for i in $FILES;do ffmpeg -i $i.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts $i.ts;done

cat *.ts > all.ts

ffmpeg -i all.ts -c copy -bsf:a aac_adtstoasc all.mp4

# ffmpeg -i "concat:ar_liten.ts|badar.ts|bakar.ts|bygger.ts|ga_r_till_doktorn.ts|gar_ut.ts|leker_med_kisse.ts|och_malin.ts|stadar.ts" -c copy -bsf:a aac_adtstoasc output.mp4
