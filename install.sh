#!/bin/sh
sudo apt-get update

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
    var=$1
    make_func_name () {
        MY_FUNC_NAME="install_$var"
    }

    echo '### Install '$var' if it is not installed ###'
    if ! library_is_installed $var && ! command_is_installed $var;
        then
            make_func_name $var
            $MY_FUNC_NAME
        else 
            echo '#' $var 'Is already installed'
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
apt-get update

echo '### installing pips from requirements.txt ###'
pip install -r requirements.txt
echo #

echo '### installing apt-get files ###'
sudo apt-get install libx11-dev libboost-all-dev libprotobuf-dev protobuf-compiler
echo #

echo '### installing loadcaffe ###'
luarocks install loadcaffe
echo #

echo '### installing models ###'
./models/download_models.sh
echo #


# Install from git hub if not already installed 
install_cudarry
install_deeppy

install_if_not_installed th
install_if_not_installed opencv
