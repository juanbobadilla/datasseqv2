pipeline {
    agent any   
    stages {
        stage('Build') {
            steps {
                updateGitlabCommitStatus name: 'Deploy', state: 'pending'
                updateGitlabCommitStatus name: 'Build', state: 'running'  
                sh 'git config credential.helper store'                              
                sh 'make build'
            }
            post {
                failure {
                    updateGitlabCommitStatus name: 'Build', state: 'failed'
                }
                success {
                    updateGitlabCommitStatus name: 'Build', state: 'success'
                }
            } 
        }
        stage('Deploy') {
            steps {
                updateGitlabCommitStatus name: 'Deploy', state: 'running'
                sh 'make deploy'
            }
            post {
                failure {
                    updateGitlabCommitStatus name: 'Deploy', state: 'failed'
                }
                success {
                    updateGitlabCommitStatus name: 'Deploy', state: 'success'
                }
            }             
        }
        stage('Security_Scan') {
            steps {
                updateGitlabCommitStatus name: 'Deploy', state: 'running'
                sh 'make security_scan'
            }
            post {
                failure {
                    updateGitlabCommitStatus name: 'Deploy', state: 'failed'
                }
                success {
                    updateGitlabCommitStatus name: 'Deploy', state: 'success'
                }
            }             
        }

    }
}
