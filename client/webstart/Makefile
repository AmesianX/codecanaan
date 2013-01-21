key:
	keytool -genkey -alias mykey -validity 1095

deploy:
	gradle fatJar
	mkdir -p lib
	cp -f build/libs/*.jar lib
	gradle clean

sign:
	read -p "password? " storepass; \
	find lib/ -name "*.jar" -exec jarsigner -storepass "$$storepass" {} mykey \; -print

run:
	gradle run -Dcore.script.type='groovy' -Dcore.script.url='http://dev.codecanaan.com:8080/webstart/launcher.groovy'

clean:
	gradle clean
	rm -rf .gradle

zip:
	mkdir -p toolkits
	for i in windows linux mac; do for j in java c cpp; do mkdir -p toolkits/$$i/$$j; done; done
	for i in windows linux mac; do for j in java c cpp; do cp toolkits-src/$$i/$$j/build.* toolkits/$$i/$$j; done; done
	cp toolkits-src/*.exe toolkits
	cp toolkits-src/*.scpt toolkits
	cp toolkits-src/*.png toolkits
	rm -f toolkits.zip
	cd toolkits && zip -r9 ../toolkits.zip *
	rm -rf toolkits

upload:
	s3cmd -P put toolkits.zip s3://assets.codecanaan.com/webstart/
	s3cmd -P put lib/ClientTools.jar s3://assets.codecanaan.com/webstart/
