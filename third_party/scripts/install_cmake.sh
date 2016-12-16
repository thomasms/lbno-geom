#sudo yum -y remove cmake
cd ${THIRD_PARTY_DIR}
wget www.cmake.org/files/v2.8/cmake-2.8.8.tar.gz
tar xvfz cmake-2.8.8.tar.gz
mv cmake-2.8.8.tar.gz ${THIRD_PARTY_DOWNLOADS}
cd cmake-2.8.8
./bootstrap
#cmake .
make
make install
cd ${THIRD_PARTY_DIR}
