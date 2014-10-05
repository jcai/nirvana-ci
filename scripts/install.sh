mkdir -p target
cd target
git clone git@bitbucket.org:jcai/nirvana.git
cd nirvana
mkdir nirvana-c/build
mkdir support/dll
cd nirvana-c/build
rm -rf *
CC=/usr/bin/gcc44 cmake -DSTATIC_LINK=on -DCMAKE_BUILD_TYPE=Release ..
#CC=gcc-4.1 CXX=g++-4.3 cmake  ..
make
cp src/*.so ../../support/dll/
rm -rf ../../nirvana-jni/src/main/java/nirvana/jni/services/gen
mkdir -p ../../nirvana-jni/src/main/java/nirvana/jni/services/gen
cp src/javaapi/* ../../nirvana-jni/src/main/java/nirvana/jni/services/gen
cd -
mvn -Dmaven.test.skip=true -DskipTests=true -Darguments="-DskipTests" -DBUILD_ID=`date +%Y%m%d_%H%M%S` -DBUILD_NUMBER=$BUILD_NUMBER -P production clean package
