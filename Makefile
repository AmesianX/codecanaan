server:
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

download:
	wget -O target/codecanaan.war s3://s3.lyhdev.com/apps/codecanaan.war

remote-deploy:
	ssh -t kyle@contpub.org 'cd codecanaan && make update download && sudo make deploy'

remote-log:
	ssh -t kyle@contpub.org 'cd codecanaan && make log'

deploy:
	service tomcat6 stop
	rm -rf /var/lib/tomcat6/webapps-codecanaan/ROOT.war
	rm -rf /var/lib/tomcat6/webapps-codecanaan/ROOT
	cp target/codecanaan.war /var/lib/tomcat6/webapps-codecanaan/ROOT.war
	service tomcat6 start

log:
	tail -f /var/lib/tomcat6/logs/catalina.out

syncdb:
	mysqldump -h contpub.org -usynconly -p contpub | mysql -h localhost -ucontpub -pcontpub contpub

services:
	mysqld_safe5 &
	rabbitmq-server &