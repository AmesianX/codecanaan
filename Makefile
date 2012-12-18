server:
	export GRAILS_OPTS="-XX:MaxPermSize=1024m -Xmx1024M -server"
	grails run-app

commit:
	git commit . -m 'development update'
	git push

update:
	git pull

clean:
	grails clean

clean-cache:
	rm -rf ./web-app/.sass-cache

war:
	grails war

upload:
	s3cmd put -P target/codecanaan.war s3://s3.lyhdev.com/apps/

upload-secret:
	s3cmd put -P ~/.grails/codecanaan-config.groovy s3://s3.lyhdev.com/apps/

download:
	[ -d target ] || mkdir target
	wget -O target/codecanaan.war http://s3.lyhdev.com/apps/codecanaan.war

download-secret:
	wget -O ~/.grails/codecanaan-config.groovy http://s3.lyhdev.com/apps/codecanaan-config.groovy

done:
	make clean war upload && make remote-deploy

remote-deploy:
	ssh -t kyle@contpub.org 'cd codecanaan && make update && make download && sudo make deploy'

remote-log:
	ssh -t kyle@contpub.org 'cd codecanaan && make log'

deploy:
	rm -rf /var/lib/tomcat7/webapps-codecanaan/ROOT.war
	rm -rf /var/lib/tomcat7/webapps-codecanaan/ROOT
	cp target/codecanaan.war /var/lib/tomcat7/webapps-codecanaan/ROOT.war
	service tomcat7 restart

log:
	tail -f /var/lib/tomcat7/logs/catalina.out

syncdb:
	mysqldump -h contpub.org -usynconly -p contpub | mysql -h localhost -ucontpub -pcontpub contpub

services:
	mysqld_safe5 &
	rabbitmq-server &
