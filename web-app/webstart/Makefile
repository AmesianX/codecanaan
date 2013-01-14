key:
	keytool -genkey -alias mykey -validity 1095

deploy:
	gradle jar
	cp -f build/libs/*.jar lib/

sign:
	read -p "password? " storepass; \
	find lib/ -name "*.jar" -exec jarsigner -storepass "$$storepass" {} mykey \; -print

run:
	gradle run -Dcore.script.type='groovy' -Dcore.script.url='http://dev.codecanaan.com:8080/webstart/test.groovy'
	
zip:
	mkdir -p toolkits/windows/java
	mkdir -p toolkits/linux/java
	mkdir -p toolkits/mac/java
	cp toolkits-src/mac/java/build.sh toolkits/mac/java
	cp toolkits-src/linux/java/build.sh toolkits/linux/java
	cp toolkits-src/windows/java/build.bat toolkits/windows/java
	rm -f toolkits.zip
	cd toolkits && zip -r ../toolkits.zip *
