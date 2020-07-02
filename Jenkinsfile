pipeline {
    agent none

    environment {
        registry = 'wdalmut/mynode'
        registryCredentials = 'dockerhub'
    }

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
                    dockerImage = docker.build "${registry}:${BUILD_NUMBER}"
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredentials) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}

