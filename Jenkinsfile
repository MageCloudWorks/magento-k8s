pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                kubectl get all -A 
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
