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
                withCredentials([string(credentialsId: 'MY_SECRET', variable: 'APP_SECRET')]) {
                    sh "echo ${env.APP_SECRET} > /tmp/ciao.txt"
                    sh "cat /tmp/ciao.txt"
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

