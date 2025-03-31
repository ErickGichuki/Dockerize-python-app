pipeline {
    agent any

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

        stage('Push the artifacts to Dockerhub'){
            steps {
                script{
                    sh '''
                    echo 'Push to artifacts to the registry...'
                    docker push erickgichukimucheru/cicdpipeline
                    '''
                }
            }
        }
    }
}
