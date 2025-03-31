pipeline {
    agent any

    stages{
        stage('checkout'){
            steps {
                url: "https://github.com/ErickGichuki/Dockerize-python-app.git",
                branch: 'main'
            }
        }

        stage('Build Docker'){
            steps {
                script {
                    sh '''
                    echo 'Build Docker Image'
                    docker build -t erickgichukimucheru/cicdpipeline .
                    '''
                }
            }
        }

        stage('Push the artifacts'){
            steps {
                script{
                    sh '''
                    echo 'push to the repo'
                    docker push erickgichukimucheru/cicdpipeline
                    '''
                }
            }
        }
    }
}