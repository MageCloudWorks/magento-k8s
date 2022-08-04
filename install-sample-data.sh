#!/bin/bash 
# Work around for microk8s
shopt -s expand_aliases
source ~/.bash_aliases
source env.sh

echo install sample data
kubectl exec -n magento deployment/apache -it -- sudo -u www-data composer -d/var/www/html/ config repositories.magento composer https://repo.magento.com
kubectl exec -n magento deployment/apache -it -- sudo -u www-data composer -d/var/www/html/ config http-basic.repo.magento.com $REPOMAGENTOCOM_USER $REPOMAGENTOCOM_PASS
kubectl exec -n magento deployment/apache -it -- sudo -u www-data php /var/www/html/bin/magento sampledata:deploy
kubectl exec -n magento deployment/apache -it -- sudo -u www-data php /var/www/html/bin/magento setup:upgrade

