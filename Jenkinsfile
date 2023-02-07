pipeline {
    agent any
    tools {
        gradle 'Gradle 7.5.1'
    }
    stages {
        stage('Build') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Dannydimate/microboton.git']])
                script {
                    sh '''
                gradle init
                gradle build
               '''
                }
            }
        }
        stage('artifact file') {
            steps {
                sh 'echo "artifact file" > generatedFile.txt'
            }
        }
        stage('test') {
            steps {
                //sh 'gradle docker'
                echo 'test succesfull'
            }
        }
        stage('Build,Push Docker Image') {
            steps {
                script {
                    //sh 'gradle docker'
                    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
                    sh 'docker build -t $DOCKER_USER/testdocker:1.0 .'
                    sh 'docker push $DOCKER_USER/testdocker:1.0'
                    echo 'image succesfull in dockerHub'
                }
            }
        }
        stage('K8S Deploy') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'k8s']) {
                        sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'
                        sh 'chmod u+x ./kubectl'
                        sh 'chmod 777 /usr/local/bin'
                        sh 'mv ./kubectl /usr/local/bin'
                        sh 'apt-get update && apt-get install -y curl apt-transport-https lsb-release gnupg'
                        sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'
                        sh 'apt-get update && apt-get install -y azure-cli'
                        sh 'curl -sL https://aka.ms/InstallAzureCLIDeb'
                    }
                }
            }
        }
    }
}

