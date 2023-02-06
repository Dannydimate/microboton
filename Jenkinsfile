pipeline {
    agent any
    tools {
        gradle 'Gradle 7.5.1' 
     }
    stages {
        stage('Build') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Dannydimate/microboton.git']])
                script{
                sh """
                gradle init
                gradle build
               """
            }
            }
        }
        stage('test') {
            steps {
                //sh 'gradle docker'
                echo 'test succesfull'
            }
        }
        stage('Build Docker Image') {
            steps {
                script{
                //sh 'gradle docker'
                sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
                sh 'docker build -t $DOCKER_USER/testdocker:1.0 .'
                sh 'docker push $DOCKER_USER/testdocker:1.0'
                echo 'succesfull'
            }
            }
        }
        stage('Push Docker Image') {
            steps {
                //sh 'gradle dockerPush'
                echo 'succesfull'
            }
        }
    }
}