node {
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
        // Install Magento
        sh "./fresh-install.sh"
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
