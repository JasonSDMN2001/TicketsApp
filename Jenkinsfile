pipeline {
    agent any
 
    stages {
        stage('Checkout Code') {
            steps {
                // Clone the repository
                git 'https://github.com/JasonSDMN2001/TicketsApp'
            }
        }
        stage('Run Static Analysis') {
            steps {
                // Run the static analysis script from your git hooks PowerShell file
                powershell './git-hooks.ps1'
            }
        }
        stage('Run Dynamic Analysis') {
            steps {
                // Execute dynamic analysis (SQLMap, nmap, etc.) from the PowerShell script
                powershell './git-hooks.ps1'
            }
        }
    }
 
    post {
        always {
            // Clean up, archive results, or notify the team
            archiveArtifacts artifacts: '**/results/*', allowEmptyArchive: true
        }
    }
}