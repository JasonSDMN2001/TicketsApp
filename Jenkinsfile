pipeline {
    agent any
 
    tools {
        nodejs 'NodeJS'  // Use the NodeJS installation configured in Jenkins
    }
 
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url:'https://github.com/JasonSDMN2001/TicketsApp.git', credentialsId: '8694e49b-1cc6-4d31-96de-81dae8cf3c54'
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
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
