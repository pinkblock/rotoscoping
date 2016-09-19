#!/bin/sh

#Swap a face
FACE_REPLACE_PATH=./implementation/face-replace
python $FACE_REPLACE_PATH/change-face-in-video.py $FACE_REPLACE_PATH/demo/arni.jpg $FACE_REPLACE_PATH/demo/Barack_Obama.jpg $FACE_REPLACE_PATH/demo/demo_arni_Obama.mov

