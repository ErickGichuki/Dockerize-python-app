pipeline {
    agent any
    environment {
        DOCKER_USERNAME = credentials('docker-username')
        DOCKER_PASSWORD = credentials('docker-password')
    }
    stages{
        stage('Checkout'){
            steps {
                echo 'checking out code'  
                git branch: 'main', url: "https://github.com/ErickGichuki/Dockerize-python-app.git"
            }
        }

        stage('Build Docker Image'){
            steps {
                script {
                    sh '''
                    echo 'Building docker image...'
                    docker build -t erickgichukimucheru/cicdpipeline .
                    '''
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    sh '''
                    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                    '''
                }
            }
        }

        stage('Push the artifacts to Dockerhub'){
            steps {
                script{
                    sh '''h
                    echo 'Push to artifacts to the registry...'
                    docker push erickgichukimucheru/cicdpipeline
                    '''
                }
            }
        }
    }
}
