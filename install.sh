#!/bin/sh


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
sudo apt-get install cmake
echo #

# Install from git hub if not already installed 
# install_cudarry
