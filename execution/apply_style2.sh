#!/bin/sh

#apply style
NEURAL_STYLE_PATH=./implementation/neural-style
th $NEURAL_STYLE_PATH/neural_style.lua -style_image input_images/ns_style_image/starry_night.jpg -content_image ./output.jpg -output_image ./output_images/output_style.jpg -num_iterations 10 -gpu -1
