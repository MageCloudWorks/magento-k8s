node {
  withKubeConfig(credentialsId: 'dev') {
    stage ('Checkout'){
	    checkout scm
    }
    stage('Checkout and Install Magento to Kubernetes') {
	environment {
	  REPOMAGENTOCOM_USER = credentials('REPOMAGENTOCOM_USER')
	  REPOMAGENTOCOM_PASS = credentials('REPOMAGENTOCOM_PASS')
        }
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
        
    }
    stage('Unit Tests'){
        
    }
    stage('Acceptance Tests'){
        
    }
    stage('Deliver')
    
  }
}
