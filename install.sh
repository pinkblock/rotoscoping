echo '### installing pips from requirements.txt ###'
pip install -r requirements.txt
echo #

echo '### installing dev libs ###'
sudo apt-get install libx11-dev libboost-all-dev 
echo #

echo '### installing models ###'
./models/download_models.sh
echo #

echo '### install cudarry ###'
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
echo #


