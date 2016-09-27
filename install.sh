install dlib

pip install requirments.txt

sudo apt-get install libx11-dev libboost-all-dev 

# install the models
./models/download_models.sh


# install cudarry
git clone https://github.com/andersbll/cudarray.git
### with cuda 
# CUDNN_ENABLED=1
#
# make
# make install
#
# python setup.py install

# without cuda
python ./cudarray/setup.py --without-cuda install


