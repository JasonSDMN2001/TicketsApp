pipeline {
    agent any
 
    environment {
        // Add environment variables if needed
    }
 
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the GitHub repository
                git 'https://github.com/JasonSDMN2001/TicketsApp.git'
            }
        }
 
        stage('Install Dependencies') {
            steps {
                // Install dependencies (assuming Node.js project with npm or yarn)
                script {
                    if (fileExists('package.json')) {
                        sh 'npm install'  // or 'yarn install' if using yarn
                    } else {
                        error('No package.json file found!')
                    }
                }
            }
        }
 
        stage('Build') {
            steps {
                // Build the project (assuming it's a Node.js project)
                sh 'npm run build'
            }
        }
 
        stage('Test') {
            steps {
                // Run tests if you have any
                sh 'npm test'
            }
        }
 
        stage('Deploy') {
            steps {
                // Optionally deploy your app (for example, to Heroku, AWS, or Docker)
                // For example, deploy to Heroku:
                // sh 'git push heroku main'
            }
        }
    }
 
    post {
        always {
            // Archive the build artifacts
            archiveArtifacts artifacts: '**/dist/**/*.*', allowEmptyArchive: true
        }
 
        success {
            echo 'Pipeline completed successfully!'
        }
 
        failure {
            echo 'Pipeline failed.'
        }
    }
}
