pipeline {
    agent any
    
    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the correct branch
                script {
                    // Ensure you're checking out the correct branch (main or master)
                    git branch: 'main', url: 'https://github.com/d-Sujeeth/watchtower.git'
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    def app = docker.build('sujeethcloud/watchtower:latest')
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Reference the Docker Hub credentials in this stage
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image('sujeethcloud/watchtower:latest').push()
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
