pipeline {
    agent any

    environment {
        // DOCKER_USERNAME = credentials('docker-username')
        // DOCKER_PASSWORD = credentials('docker-password')
        SONAR_URL = 'http://35.90.47.233:9000/'
        
    }
    stages{
        stage('Checkout'){
            steps {
                echo 'checking out code'  
                git branch: 'main', url: "https://github.com/ErickGichuki/Dockerize-python-app.git"
            }
        }

        stage('Static Code Analysis'){
            steps {
                echo 'Running Sonarqube Analysis'
                // withCredentials([string(credentialsId: 'sonarqube',variable: 'SONAR_AUTH_TOKEN')]){
                //     script{
                //         sonar(
                //             installationName: 'sonarqube',
                //             projectKey: 'BericksDesigns',
                //             projectName: 'BericksDesigns',
                //             projectVersion: '1.0',
                //             sources: '.',
                //             additionalProperties: [
                //                 "sonar.host.url": "$SONAR_URL",
                //                 "sonar.login": "$SONAR_AUTH_TOKEN"
                //             ]
                //         )
                //     }
                // }
            }
        }
        stage('Build Docker Image'){
            steps {
                script {
                    sh '''
                    echo 'Building docker image...'
                    docker build -t erickgichukimucheru/bericksdesign .
                    '''
                }
            }
        }

        stage('Push the artifacts to Dockerhub'){
            steps {
                script{
                    echo "Pushing the artifacts to the registry"
                    // sh '''
                    // echo 'Push to artifacts to the registry...'
                    // docker push erickgichukimucheru/bericksdesign
                    // '''
                }
            }
        }
        stage ('Deploy to k8s'){
            steps {
                script{
                    echo "Deploying the application to k8s"
                }
            }
        }

        // stage('Build and push the artifacts'){
        //     steps {
        //         script{
        //             withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]){
        //                 sh '''
        //                 echo 'building the image...'
        //                 docker build -t erickgichukimucheru/bericksdesign .

        //                 echo 'Pushing the Docker image...'
        //                 docker push erickgichukimucheru/bericksdesign
        //                 '''
        //             }
        //         }
        //     }
        // }
    }
}
