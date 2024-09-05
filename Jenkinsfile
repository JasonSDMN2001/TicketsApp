pipeline {
    agent any
 
    environment {
        NODE_ENV = 'production'   // Example of setting an environment variable
    }
 
    stages {
        stage('Checkout') {
            steps {
                // Fetch code from Git
                git 'https://github.com/JasonSDMN2001/TicketsApp.git'
            }
        }
 
        stage('Install Dependencies') {
            steps {
                // Install project dependencies
                sh 'npm install'
            }
        }
 
        stage('Build') {
            steps {
                // Build the project
                sh 'npm run build'
            }
        }
 
        stage('Test') {
            steps {
                // Run tests
                sh 'npm test'
            }
        }
    }
 
    post {
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
