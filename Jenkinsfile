pipeline {
    agent {
        label 'master'
    }

    environment {
        registry = 'wdalmut/mynode'
        registryCredentials = 'dockerhub'
    }

    stages {
        stage('Prepare') {
            steps {
                withCredentials([string(credentialsId: 'MY_SECRET', variable: 'APP_SECRET'), file(credentialsId: 'my-config', variable: 'MY_CONFIG')]) {
                    sh "echo ${env.APP_SECRET}"
                    sh "cat ${env.MY_CONFIG}"
                    sh "cp ${env.MY_CONFIG} secret.txt"
                }
            }
        }

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

