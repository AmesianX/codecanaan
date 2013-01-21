deploy:
	gradle distZip
	cp build/distributions/*.zip ./
	gradle fatJar
	unzip ClientTools.zip
	rm -f ClientTools/lib/*.jar
	cp build/libs/ClientTools.jar ClientTools/lib
	cp README.txt ClientTools
	rm -f ClientTools.zip
	zip -r ClientTools.zip ClientTools
	rm -rf ClientTools
	gradle clean
	s3cmd -P put ClientTools.zip s3://assets.codecanaan.com/standalone/
