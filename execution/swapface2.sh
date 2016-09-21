#!/bin/sh

#faceswap ./faceswap.py <head image> <face image>
FACE_REPLACE_PATH=./implementation/faceswap
python $FACE_REPLACE_PATH/faceswap.py ./input_images/fs_target_faces/margrethe.jpg ./input_images/fs_masks/face1.jpg ./output_images/swap_for_style.mov

