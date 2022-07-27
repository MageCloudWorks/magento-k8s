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
	sleep 60 // wait for pods to start
        // Install Magento
        sh "./fresh-install.sh"
	// Install sample data, requires Access key https://marketplace.magento.com/customer/accessKeys/ stroed in username/password credential REPOMAGENTOCOM
        withCredentials([usernamePassword(credentialsId: 'REPOMAGENTOCOM', passwordVariable: 'REPOMAGENTOCOM_PASS', usernameVariable: 'REPOMAGENTOCOM_USER')]) {
          sh "./install-sample-data.sh"
	}
	
    } 
    stage('Stand Up Test'){
	// get ip address of first node of cluster to create URL to access the Magento instance
	def K8IP = sh(script: 'kubectl get nodes -o jsonpath={.items[0].status.addresses[?\(@.type==\"InternalIP\"\)].address} ', returnStdout: true)
	// 30081 is via Varnish cache, to access direct use 30080
	sh "curl -x http://$K8IP:30081/"
        
    }
    stage('Unit Tests'){
        
    }
    stage('Acceptance Tests'){
        
    }
    stage('Deliver')
    
  }
}
