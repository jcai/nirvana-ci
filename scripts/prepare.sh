mkdir -p target
cd target
#install snappy
git clone https://github.com/google/snappy.git
cd snappy
./autogen.sh
./configure --with-pic
make
sudo make install
cd -
#leveldb
git clone https://github.com/google/leveldb.git
cd leveldb
CXXFLAGS="-fPIC" make 
sudo cp -r include/* /usr/local/include/
sudo cp libleveldb.a /usr/local/lib/
cd -
#install protoc
wget https://github.com/google/protobuf/releases/download/v2.6.1/protobuf-2.6.1.tar.gz -O protobuf-2.6.1.tar.gz
tar xfvz protobuf-2.6.1.tar.gz
cd protobuf-2.6.1
./autogen.sh
./configure && make && sudo make install
cd -

#install nirvana-kernel
mkdir kernel
cd kernel
sudo wget http://lichen.egfit.com/nirvana/libnirvana-kernel.so -O /usr/local/lib/libnirvana-kernel.so
wget http://lichen.egfit.com/nirvana/kernel-header.tar.gz
tar xfvz kernel-header.tar.gz
sudo mv nirvana /usr/local/include/
cd -
#ldconfig all library
sudo ldconfig

