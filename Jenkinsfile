pipeline {
    agent {
        image 'erickgichukimucheru/pythondev:latest'

    environment {
        SONAR_URL = "http://34.220.45.126:9000/"
        DOCKER_IMAGE_PREFIX = "erickgichukimucheru/cicdpipeline"
        REGISTRY_URL = "https://index.docker.io/v1/"
        GIT_REPO_NAME = "Java-maven-cicid"
        GIT_USER_NAME = "ErickGichuki"
    }
    stages{
        stage('Checkout'){
            steps {
                echo 'checking out code'  
                git branch: 'main', url: "https://github.com/ErickGichuki/Dockerize-python-app.git"
            }
        }
        
        stage('Build'){
            steps {
                echo 'Building Bericks Designs'
                // sh '''
                // python3 --version
                // python3 -m pip install --upgrade pip
                // python3 -m pip install -r requirements.txt 
                // '''
            }
        }//
        stage('Static Code Analysis'){
            steps {
                echo 'Running Sonarqube Analysis'
                withCredentials([string(credentialsId: 'sonarqube',variable: 'SONAR_AUTH_TOKEN')]){
                    sh '''
                    cd devops
                    sonar-scanner \
                        -Dsonar.projectKey=BericksDesigns \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=$SONAR_URL \
                        -Dsonar.login=$SONAR_AUTH_TOKEN
                    '''
                }
            }
        }
        stage('Build and Push Docker Image'){
            steps {
                script {
                    echo "building docker image..."
                    def imageTag = "${DOCKER_IMAGE_PREFIX}:${BUILD_NUMBER}"
                    sh "docker build -t ${imageTag} ."
                    docker.withRegistry(REGISTRY_URL, "docker-cred") {
                    docker.image(imageTag).push()
                }
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
    }
}
