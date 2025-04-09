pipeline {
    agent any  // Run the pipeline on any available Jenkins agent

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the code...'
                // Jenkins automatically checks out the code if using SCM
                // If not using SCM, you can add manual checkout steps here
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
                // Add test commands here, e.g., sh 'pytest' if you have tests
                sh 'echo "No tests yet, placeholder step"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                sh 'docker-compose build'  // Build the Docker image using docker-compose.yml
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