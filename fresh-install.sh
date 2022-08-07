#!/bin/bash 

echo Get Magento and extract
kubectl exec -n magento deployment/apache -it -- bash -c 'curl -L  https://github.com/magento/magento2/archive/refs/tags/2.4.4.tar.gz| tar xz --strip-components=1 -C /var/www/html/'
kubectl exec -n magento deployment/apache -it -- chown -R www-data:www-data /var/www/html/ 
kubectl exec -n magento deployment/apache -it -- sudo -u www-data composer -d/var/www/html install

echo Run Magento install
kubectl exec -n magento deployment/apache -it -- sudo -u www-data php /var/www/html/bin/magento setup:install  -v --db-host=mariadb --db-name=magento --db-user=root --db-password=my_super_secret --elasticsearch-host=elasticsearch --document-root-is-pub=true --use-rewrites=1 \
--session-save redis \
--session-save-redis-host=redis-session

