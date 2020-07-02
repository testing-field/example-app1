pipeline {
    agent none

    stages {
        stage('Build') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'node --version'
                sh 'npm i'
                sh './node_modules/.bin/jasmine'
            }
        }

        stage('Build Image') {
            steps {
                script {
                    dockerImage = docker.build "wdalmut/mynode:${BUILD_NUMBER}"
                }
            }
        }
    }
}

