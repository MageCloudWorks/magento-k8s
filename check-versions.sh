#!/bin/bash
# Required Versions https://devdocs.magento.com/guides/v2.4/install-gde/system-requirements.html
COMPOSER_REQ=2.1
ELASTICSEARCH_REQ=7.16
MARIADB_REQ=10.4
PHP_REQ=8.1
RABBITMQ_REQ=3.9
REDIS_REQ=6.2
VARNISH_REQ=7.0
APACHE_REQ=2.4

COMPOSER_VER=$(kubectl exec -n magento deployment/apache -it -- sh -c 'sudo -u www-data composer -V | cut -f3 -d" " | cut -c1-3')
ELASTICSEARCH_VER=$(kubectl exec -n magento deployment/apache -it -- curl -s 'http://elasticsearch:9200' | grep "number" | awk '{print $3}' | cut -c2-5)
MARIADB_VER=$(kubectl exec -n magento deployment/mariadb -it -- mysqld -V | awk '{print $3}' | cut -c1-4)
PHP_VER=$(kubectl exec -n magento deployment/apache -it -- php -v | head -1 | awk '{print $2}' | cut -c1-3)
RABBITMQ_VER=
REDIS_VER=$(kubectl exec -n magento deployment/redis-session -it -- redis-server -v |  awk '{print $3}' | cut -c3-5)
VARNISH_VER=$(kubectl exec -n magento deployment/varnish -it -- varnishd -V 2>&1  | head -1 |  awk '{print $2}' | cut -c10-12)
APACHE_VER=$(kubectl exec -n magento deployment/apache -it -- apache2 -v | awk  '{print $3}' | cut -c8-10 | head -1)

function check () {
  echo $1 $2 $3
}

check "Composer" $COMPOSER_REQ $COMPOSER_VER
check "Elastic Search" $ELASTICSEARCH $ELASTICSEARCH_VER
check "Mariadb" $MARIADB_REQ $MARIADB_VER
check "PHP" $PHP_REQ $PHP_VER
#check "RabbitMQ" $RABBITMQ_REQ $RABBITMQ_VER
check "Redis" $REDIS_REQ $REDIS_VER
check "Varnish" $VARNISH_REQ $VARNISH_VER
check "Apache" $APACHE_REQ $APACHE_VER
