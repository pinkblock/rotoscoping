#!/bin/sh

MY_MASK=input_images/fs_masks/face1.jpg
MY_FACE=input_images/fs_target_faces/margrethe.jpg
MY_OUT=output_images/swap_out.jpg

#Swap a face
python2 faceswap.py \
    $MY_MASK \
    $MY_FACE \
    $MY_OUT
