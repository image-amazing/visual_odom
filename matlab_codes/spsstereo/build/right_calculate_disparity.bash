#!/bin/bash
search_folder="/home/akhil/visual_odom/seq_0/right_rijvi_png_match/*"
folder1="/home/akhil/visual_odom/seq_0/left_rijvi_png_match"
folder2="/home/akhil/visual_odom/seq_0/right_rijvi_png_match"
images=()
j=0;
for i in $search_folder
do
images[$j]=$i
j=$(expr $j + "1")
done
tLen=$(expr ${#images[@]} - "1")
echo $tLen
for(( i=0; i<$tLen; i++));
do
k=$(expr $i + "1")
i1=$(expr $i + "3")
i2=$(expr $i + "4")
b="/home/akhil/right_rijvi_match_features/$k.txt"
im1="$folder1/$i1.png"
im2="$folder2/$i1.png"
echo $im1
echo $im2
./spsstereo $im1 $im2 
output="${i1}_left_disparity.png"
mv $output /home/akhil/visual_odom/seq_0/right_disparity/${i1}.png
done


