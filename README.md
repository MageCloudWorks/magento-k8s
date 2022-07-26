# Quick Start
#### Deploy full stack Magento in Kubernetes in under 5 minutes
### Clone repo
```
[~] $ git clone https://github.com/MageCloudWorks/magento-k8s.git
[~] $ cd magento-k8s/
```
### Run script to create namespace and deploy pods
```
[~/magento-k8s] $ ./deploy.sh 
```

Wait for all the pods to start
```
[~/magento-k8s] $ kubectl get pods -n magento
NAME                             READY   STATUS    RESTARTS   AGE
apache-76946547d8-ks4cr          1/1     Running   0          60s
elasticsearch-56c86dbfbb-hxgg7   1/1     Running   0          60s
mariadb-865fcff9cd-4kpsw         1/1     Running   0          60s
redis-session-56546df6b8-l985k   1/1     Running   0          59s
varnish-565ccdc56d-rvl9d         1/1     Running   0          59s
```
### Install Magento 
```
[~/magento-k8s] $ ./fresh-install.sh 
```

### Open Magento in your browser
Find address of your Kubernetes cluster.
```
[~/magento-k8s] $ kubectl cluster-info
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```
Apache is running on port 
```
[~/magento-k8s] $ kubectl get services -n magento apache
NAME     TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
apache   NodePort   10.107.52.91   <none>        80:30080/TCP   13m
```
To connect in your browser open the URL http://192.168.49.2:30080/

#### Connect via Varnish 
Varnish service is running on 30081
```
[~/magento-k8s] $ kubectl get services -n magento varnish
NAME      TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
varnish   NodePort   10.110.44.20   <none>        80:30081/TCP   17m
```
Open in your browser http://192.168.49.2:30081



# Jenkins
## Prerequistes 
- Jenkins Kubernetes CLI Plugin 
- kubectl available on Jenkins build node
- If you use a Jenkins Agent image (https://hub.docker.com/r/magecloudworks/jenkins-agent) ensure the Pod Template, Containers, Container Template, Name is "jnlp". 

## Sample Data
### To install sample data
Create access key https://marketplace.magento.com/customer/accessKeys/

Then in Jenkins create "Username with password" Credential REPOMAGENTOCOM

