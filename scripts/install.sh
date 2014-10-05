mkdir -p target
cd target
#install protoc
#wget https://protobuf.googlecode.com/svn/rc/protobuf-2.5.0.tar.gz
#tar xfvz protobuf-2.5.0.tar.gz
cd protobuf-2.5.0
#./configure
#make
#sudo make install

#install nirvana-kernel
sudo wget http://lichen.egfit.com/nirvana/libnirvana-kernel.so -O /usr/local/lib/libnirvana-kernel.so
sudo ldconfig
cd -

#compile nirvana
git clone git@bitbucket.org:jcai/nirvana.git
cd nirvana
mkdir nirvana-c/build
mkdir support/dll
cd nirvana-c/build
rm -rf *
cmake -DSTATIC_LINK=on -DCMAKE_BUILD_TYPE=Release ..
#CC=gcc-4.1 CXX=g++-4.3 cmake  ..
make
cp src/*.so ../../support/dll/
rm -rf ../../nirvana-jni/src/main/java/nirvana/jni/services/gen
mkdir -p ../../nirvana-jni/src/main/java/nirvana/jni/services/gen
cp src/javaapi/* ../../nirvana-jni/src/main/java/nirvana/jni/services/gen
cd -
mvn -Dmaven.test.skip=true -DskipTests=true -Darguments="-DskipTests" -DBUILD_ID=`date +%Y%m%d_%H%M%S` -DBUILD_NUMBER=$BUILD_NUMBER -P production clean package
