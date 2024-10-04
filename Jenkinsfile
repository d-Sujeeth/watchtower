pipeline {
    agent any
    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/d-Sujeeth/watchtower.git'
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
                    // Reference the Docker Hub credentials in this stage
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image('sujeethcloud/watchtower:latest').push()
                    }
                }
            }
        }
    }
}
