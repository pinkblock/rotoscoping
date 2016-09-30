#!/bin/sh

#Swap a face
MY_MASK=input_images/ns_content_image/golden_gate.jpg
MY_TARGET=input_images/ns_style_image/skrik.jpg
MY_OUT=output_images/demo_style.jpg

python2 faceswap.py \
    $MY_MASK \
    $MY_TARGET \
    MY_OUT
