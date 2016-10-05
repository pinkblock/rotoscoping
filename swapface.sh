#!/bin/sh

# var
MY_MASK=input_images/fs_maskes/face1.jpg
MY_TARGET=input_images/fs_target_faces/face3.jpg
MY_OUT=output_images/demo_swap.jpg

# swap a face
python3 faceswap.py \
    $MY_MASK \
    $MY_TARGET \
    $MY_OUT
