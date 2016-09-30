#!/bin/sh

### General Functions ###
library_is_installed () {
    pkg-config --exists $1
    return $?
}

command_is_installed () {
    if type "$1" &> /dev/null ; 
        then
            return 0 # 0 is true 
        else
            return 1 # 1 is false
    fi
}

install_if_not_installed () {
    echo '### Install '$1' if it is not installed ###'
    if ! library_is_installed $1 && ! command_is_installed $1;
        then
            install_$1
        else 
            echo '#' $1 'Is already installed'
    fi
    echo #
}


### Install Functions ###
install_cudarry () {
    echo '### Install CUDArray ###'
    git clone https://github.com/andersbll/cudarray.git
    ### with cuda 
    # CUDNN_ENABLED=1
    #
    # cd cudarry
    #
    # make
    # make install
    #
    # python setup.py install

    ### without cuda
    cd cudarray
    python setup.py --without-cuda install
    cd ..
    echo #
}

install_deeppy () {
    echo '### install DeepPy ###'
    git clone https://github.com/andersbll/deeppy.git
    cd deeppy
    python setup.py install
    cd ..
    echo #
}

install_opencv () {
    echo '### Install Opencv ###'
    # prerequisites
    # compiler 
    sudo apt-get install build-essential
    sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
    sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

    # get source
    git clone https://github.com/opencv/opencv.git
    cd opencv
    mkdir release
    cd release
    cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
    make
    sudo make install
    cd ..
    pwd
    echo #
}

install_th () {
    echo '### Install Torch ###'
    # get source
    git clone https://github.com/torch/distro.git ~/torch --recursive
    cd ~/torch; bash install-deps;
    ./install.sh
    echo #
}

### Install Script ###
sudo apt-get install python-scipy

echo '### installing pips from requirements.txt ###'
pip install -r requirements.txt
echo #

echo '### installing apt-get files ###'
sudo apt-get install libboost-all-dev python-dev libx11-dev libboost-all-dev libprotobuf-dev protobuf-compiler
echo #

echo '### installing models ###'
./models/download_models.sh
echo #

echo '### installing cmake ###'
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo apt-get update
sudo apt-get install cmake
echo #

echo '### installing dlib ###'
wget -qO- https://pypi.python.org/packages/24/e5/af6b0a964ff4b726146128ab4f9cd67293426357c7399effab8240d2b8be/dlib-19.1.0.tar.gz | tar xvz
cd dlib
python setup.py install
echo #

# Install from git hub if not already installed 
install_cudarry
install_deeppy

install_if_not_installed th
install_if_not_installed opencv
