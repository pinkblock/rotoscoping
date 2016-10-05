numpy - pip install

faceswap.py
    cv2 - prereq
    dlib - prereq
    
        mkdir -p ~/src
        cd ~/src
        tar xf dlib-18.16.tar.bz2
        cd dlib-18.16/python_examples
        mkdir build
        cd build
        cmake ../../tools/python
        cmake --build . --config Release
        sudo cp dlib.so /usr/local/lib/python2.7/dist-packages

    
neural_artistic_style.py
    scipy - pip install 
    deeppy - prereq
        cudarray - prereq
            cython - prereq
    matconvnet
