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
