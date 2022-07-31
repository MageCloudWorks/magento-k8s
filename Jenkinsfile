node {
  withKubeConfig(credentialsId: 'dev') {
    stage ('Checkout'){
	    checkout scm
    }
    stage ('Lint'){
	sh ""
    }
    stage('Checkout and Install Magento to Kubernetes') {
        // Clean up anything in the namespace
	sh "kubectl get namespaces"
        sh "kubectl get namespaces magento && kubectl delete namespace magento"
        // Create pods in Kubernetes
        sh "./deploy.sh"
	sleep 60 // wait for pods to start
        // Install Magento
        sh "./fresh-install.sh"
	// Install sample data, requires Access key https://marketplace.magento.com/customer/accessKeys/ stroed in username/password credential REPOMAGENTOCOM
        withCredentials([usernamePassword(credentialsId: 'REPOMAGENTOCOM', passwordVariable: 'REPOMAGENTOCOM_PASS', usernameVariable: 'REPOMAGENTOCOM_USER')]) {
          sh "./install-sample-data.sh"
	}
	
    } 
    stage('Stand Up Test'){
	sh 'sh ./standup-test.sh'
        
    }
    stage('Unit Tests'){
      sh 'kubectl exec -n magento deployment/apache -it -- sudo -u www-data php /var/www/html/bin/magento setup:upgrade dev:tests:run unit' 
    }
    stage('Acceptance Tests'){
        
    }
    stage('Deliver')
    
  }
}
