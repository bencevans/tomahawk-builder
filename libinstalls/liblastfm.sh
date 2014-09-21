git clone git://github.com/lastfm/liblastfm.git
mkdir liblastfm/build && cd liblastfm/build
cmake -DBUILD_WITH_QT4=ON ..
make
sudo make install