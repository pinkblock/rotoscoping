#!/bin/sh

#apply style
NEURAL_STYLE_PATH=./implementation/neural_artistic_style
python $NEURAL_STYLE_PATH/style_network.py --subject ./output_images/face1.jpg --style $NEURAL_STYLE_PATH/images/starry_night.jpg  ./output_images/demo_thing.jpg

