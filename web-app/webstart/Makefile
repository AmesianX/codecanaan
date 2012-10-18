makekey:
	keytool -genkey -alias gwskey -validity 365

deploy:
	gradle jar
	cp -f build/libs/*.jar lib/
	read -p "password? " storepass; \
	find lib/ -name "*.jar" -exec jarsigner -storepass "$$storepass" {} gwskey \; -print

run:
	gradle run -Dcore.script.type='groovy' -Dcore.script.url='http://dev.codecanaan.com:8080/webstart/test.groovy'
