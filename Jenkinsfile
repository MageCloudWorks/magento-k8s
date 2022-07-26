node {
  environment {
	  REPOMAGENTOCOM_USER = credentials('REPOMAGENTOCOM_USER')
	  REPOMAGENTOCOM_PASS = credentials('REPOMAGENTOCOM_PASS')
  }
  withKubeConfig(credentialsId: 'dev') {
    stage ('Checkout'){
	    checkout scm
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
	// If repo.magento.com user name is set then install sample data
	sh "[ ! -z $REPOMAGENTOCOM_USER ] && ./install-sample-data.sh"
    } 
    stage('Stand Up Test'){
        
    }
    stage('Unit Tests'){
        
    }
    stage('Acceptance Tests'){
        
    }
    stage('Deliver')
    
  }
}
