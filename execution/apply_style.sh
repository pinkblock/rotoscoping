#!/bin/sh

#apply style
NEURAL_STYLE_PATH=implementation/neural_artistic_style/
MY_SUB=../../input_images/ns_content_image/golden_gate.jpg
MY_STYLE=../../input_images/ns_style_image/skrik.jpg
MY_OUT=../../output_images/demo_thing.jpg
MY_I=1
cd $NEURAL_STYLE_PATH
python neural_artistic_style.py \
    --subject $MY_SUB \
    --style $MY_STYLE \
    --output $MY_OUT \
    --iterations $MY_I
