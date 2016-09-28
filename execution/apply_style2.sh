#!/bin/sh

#apply style
NEURAL_STYLE_PATH=implementation/neural-style/
MY_SUB=../../input_images/ns_content_image/golden_gate.jpg
MY_STYLE=../../input_images/ns_style_image/skrik.jpg
MY_OUT=../../output_images/demo_thing.jpg
MY_I=1
cd $NEURAL_STYLE_PATH

th neural_style.lua \
    -style_image $MY_STYLE \
    -content_image $MY_SUB \
    -output_image $MY_OUT \
    -num_iterations $MY_I \
    -gpu -1
