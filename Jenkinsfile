pipeline {
    agent any
    
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/d-Sujeeth/watchtower.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('sujeethcloud/watchtower:latest')
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image('sujeethcloud/watchtower:latest').push()
                    }
                }
            }
        }

        stage('Stop Old Watchtower Container') {
            steps {
                script {
                    // Stop the existing Watchtower container
                    sh 'docker stop watchtower || true'
                }
            }
        }

        stage('Remove Old Watchtower Container') {
            steps {
                script {
                    // Remove the old container
                    sh 'docker rm watchtower || true'
                }
            }
        }

        stage('Deploy New Watchtower Container') {
            steps {
                script {
                    // Run the new Watchtower container
                    sh '''
                    docker run -d \
                        --name watchtower \
                        --restart unless-stopped \
                        -v /var/run/docker.sock:/var/run/docker.sock \
                        sujeethcloud/watchtower:latest
                    '''
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
