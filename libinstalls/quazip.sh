apt-get install -y subversion
svn co https://quazip.svn.sourceforge.net/svnroot/quazip/trunk/quazip
mkdir quazip/build && cd quazip/build
cmake ..
make
sudo make install