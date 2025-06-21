pipeline {
    agent {
        docker {
            image 'python:3.9-slim'  // Python image for pip
            args '-u root -v /var/run/docker.sock:/var/run/docker.sock'  // Mount Docker socket for docker-compose  
        }
    }

    stages {
        stage('Setup') {
            steps {
                echo 'Setting up environment...'
                sh 'apt-get update && apt-get install -y docker.io docker-compose'  // Install Docker and docker-compose 
            }
        }

        stage('Checkout') {
            steps {
                echo 'Checking out the code...'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the Flask app dependencies...'
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'echo "No tests yet, placeholder step"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker-compose build'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the Flask app...'
                sh 'docker-compose down'
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
