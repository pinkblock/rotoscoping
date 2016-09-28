#!/bin/sh

#faceswap ./faceswap.py <head image> <face image>
FACE_REPLACE_PATH=./implementation/faceswap

cd $FACE_REPLACE_PATH
python2 faceswap.py \
    face1.jpg \
    face2.jpg \
    output.jpg

