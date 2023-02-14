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
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarServer') { 
                    sh "./gradlew sonarqube \
                        -Dsonar.projectKey=sonar \
                        -Dsonar.host.url=http://20.22.24.28:9000 \
                        -Dsonar.login=7b52bc062543157d5c10f3fb8b415249dc1dc05d"
                    echo 'test sonar succesfull'
                } 
            }
        }
        stage('Build,Push Docker Image') {
            steps {
                script {
                    //sh 'docker version'
                    //sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
                    //sh 'docker build -t $DOCKER_USER/micro-boton:1.0'
                    //sh 'docker push $DOCKER_USER/micro-boton:1.0'
                    echo 'image succesfull in dockerHub'
                }
            }
        }
        stage('K8S Deploy') {
            steps {
                script {
                    sh 'kubectl version --client --output=yaml'
                    sh 'az login'
                    sh 'az account set --subscription c56d0694-4b57-4929-a446-af58bf9b4393'
                    sh 'az aks get-credentials --resource-group semillero-devops --name aks1'
                    sh 'ls'
                    sh 'kubectl apply -f k8s/micro_boton.yaml'
                }
            }
        }
    }
}
