#compile nirvana jni
cd target/nirvana
mkdir nirvana-c/build
mkdir support/dll
cd nirvana-c/build
rm -rf *
cmake  -DCMAKE_CXX_FLAGS="-std=c++11" -DCMAKE_BUILD_TYPE=Release ..
make
#CC=gcc-4.1 CXX=g++-4.3 cmake  ..
cp src/*.so ../../support/dll/
rm -rf ../../nirvana-jni/src/main/java/nirvana/jni/services/gen
mkdir -p ../../nirvana-jni/src/main/java/nirvana/jni/services/gen
cp src/javaapi/* ../../nirvana-jni/src/main/java/nirvana/jni/services/gen

#wget nirvana-kernel4j
cd -
mkdir -p nirvana-kernel4j/src/main/resources/META-INF/native/windows32
mkdir -p nirvana-kernel4j/src/main/resources/META-INF/native/windows64
wget http://lichen.egfit.com/nirvana/dll/w32/nirvana_kernel4j.dll -O nirvana-kernel4j/src/main/resources/META-INF/native/windows3
wget http://lichen.egfit.com/nirvana/dll/w64/nirvana_kernel4j.dll -O nirvana-kernel4j/src/main/resources/META-INF/native/windows6

mkdir nirvana-kernel4j/c/build
cd nirvana-kernel4j/c/build
cmake -DCMAKE_BUILD_TYPE=Release -DARCH=w64 ..
make
mkdir -p ../../src/main/resources/META-INF/native/linux64/
cp src/*.so ../../src/main/resources/META-INF/native/linux64/
mkdir -p ../../src/main/java/nirvana/kernel/services/gen
cp src/javaapi/*.java ../../src/main/java/nirvana/kernel/services/gen
cd -

