echo '### installing models ###'
cd models
# wget -c https://gist.githubusercontent.com/ksimonyan/3785162f95cd2d5fee77/raw/bb2b4fe0a9bb0669211cf3d0bc949dfdda173e9e/VGG_ILSVRC_19_layers_deploy.prototxt
# wget -c --no-check-certificate https://bethgelab.org/media/uploads/deeptextures/vgg_normalised.caffemodel
wget -c http://www.robots.ox.ac.uk/~vgg/software/very_deep/caffe/VGG_ILSVRC_19_layers.caffemodel
wget -c http://www.vlfeat.org/matconvnet/models/imagenet-vgg-verydeep-19.mat
wget -c http://sourceforge.net/projects/dclib/files/dlib/v18.10/shape_predictor_68_face_landmarks.dat.bz2
cd ..
echo #

echo '### make link to models ###'
ln -sr models/imagenet-vgg-verydeep-19.mat implementation/neural_artistic_style/imagenet-vgg-verydeep-19.mat
ln -sr models/VGG_ILSVRC_19_layers.caffemodel implementation/neural-style/models/VGG_ILSVRC_19_layers.caffemodel
echo #
