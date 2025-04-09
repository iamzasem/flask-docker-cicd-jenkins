                    pipeline {
    agent {
        docker {
            image 'python:3.9-slim'  // Base image with Python and pip
            args '-u root -v /var/run/docker.sock:/var/run/docker.sock'  // Run as root, mount Docker socket
        }
    }

    stages {
        stage('Setup') {  // New stage to install dependencies like docker-compose
            steps {
                echo 'Setting up environment...'
                sh 'apt-get update && apt-get install -y docker.io docker-compose'  // Install Docker and docker-compose
            }
        }

        stage('Checkout') {
            steps {
                echo 'Checking out the code...'
                // SCM checkout is automatic if configured in Jenkins job
            }
        }

        stage('Build') {
            steps {
                echo 'Building the Flask app dependencies...'
                sh 'pip install -r requirements.txt'  // Install Python dependencies
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'echo "No tests yet, placeholder step"'  // Placeholder, replace with real tests later
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker-compose build'  // Build using docker-compose.yml
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the Flask app...'
                sh 'docker-compose down'  // Stop any running containers
                sh 'docker-compose up -d'  // Start the app in detached mode
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
