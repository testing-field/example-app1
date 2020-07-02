pipeline {
    agent none

    stages {
        stage('Build') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'node --version'
                sh 'sleep 2'
                sh 'echo "OK" > $HOME/ciao.txt'
            }
        }

        stage('Build Image') {
            steps {
                script {
                    dockerImage = docker.build "wdalmut/mynode:14-alpine"
                }
            }
        }
    }
}

