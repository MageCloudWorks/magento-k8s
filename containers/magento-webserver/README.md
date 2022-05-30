# How to use this image.
## Fresh Magento Install  
Skip this step if you already have an existing Magento install. 
### Download and extract 
```
$ wget https://github.com/magento/magento2/archive/refs/tags/2.4.4.tar.gz
$ tar xvzf 2.4.4.tar.gz
```

#  Start container and set permissions
```
$ docker run --name magento-webserver -d -p8003:80 -v ./magento2-2.4.4/:/var/www/html  docker.io/magecloudworks/magento-webserver
$ docker exec -it magento-webserver chown -R www-data:www-data /var/www/html/ 
```
## Install composer
```
$ docker exec -it magento-webserver sudo -u www-data composer -d/var/www/html install
```

## Install Magento 
You will need a working mySQL and Elasticsearch server to install. 
```
$ docker exec -it magento-webserver sudo -u www-data php /var/www/html/bin/magento setup:install --db-host=myDatabase --db-name=magento --db-user=myDataBaseUser --db-password=XXXXX --elasticsearch-host=myElasticSearch --document-root-is-pub=true
```
# Access and setup website 
http://localhost:8003/

# Support and Kubernetes 
- Support (https://www.magecloudworks.co.uk/contact)
- Kubernetes deployment (https://github.com/MageCloudWorks/magento-k8s)
