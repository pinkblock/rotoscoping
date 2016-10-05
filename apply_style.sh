#!/bin/sh

# var
MY_SUB=input_images/ns_content_image/golden_gate.jpg
MY_STYLE=input_images/ns_style_image/skrik.jpg
MY_OUT=output_images/demo_style.jpg
MY_I=1

# apply style
python3 neural_artistic_style.py \
    --subject $MY_SUB \
    --style $MY_STYLE \
    --output $MY_OUT \
    --iterations $MY_I
