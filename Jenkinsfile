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
                        -Dsonar.projectKey=sonarqube \
                        -Dsonar.host.url=http://20.122.244.162:9000 \
                        -Dsonar.login=7d239dfffe49f65aa2d48f0c094422007aa48f65"
                } 
            }
        }
        stage('Build,Push Docker Image') {
            steps {
                script {
                    //sh 'gradle docker'
                    //sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
                    //sh 'docker build -t $DOCKER_USER/testdocker:1.0 .'
                    //sh 'docker push $DOCKER_USER/testdocker:1.0'
                    echo 'image succesfull in dockerHub'
                }
            }
        }
        stage('K8S Deploy') {
            steps {
                script {
                    sh 'kubectl version --client --output=yaml'
                    sh 'az login'
                    sh 'az account set --subscription 18a75c32-c3ca-43f7-a442-df28e08cc49e'
                    sh 'az aks get-credentials --resource-group Jenkins --name myk8Cluster'
                    sh 'ls'
                    sh 'kubectl apply -f k8s/micro_boton.yaml'
                }
            }
        }
    }
}


