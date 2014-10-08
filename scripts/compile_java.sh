cd target/nirvana
MVN_OPTS="-Xms384M -Xmx512M -XX:MaxPermSize=256M" mvn -Dmaven.test.skip=true -DskipTests=true -Darguments="-DskipTests" -DBUILD_ID=`date +%Y%m%d_%H%M%S` -DBUILD_NUMBER=$BUILD_NUMBER -P production clean package
