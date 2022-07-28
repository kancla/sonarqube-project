pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    environment {
        registry = '020361875850.dkr.ecr.us-east-1.amazonaws.com/geolocation_ecr_rep'
        registryCredential = 'jenkins-ecr'
        dockerimage = ''
  } 
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/kancla/sonarqube-project.git' 
            }
        }
        stage('Code Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
// Building Docker images
        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        // Uploading Docker images into AWS ECR
        stage('Pushing to ECR') {
            steps{
                script {
                    sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 020361875850.dkr.ecr.us-east-1.amazonaws.com'
                    sh 'docker build -t geolocation_ecr_rep'
                    sh 'docker tag geolocation_ecr_rep:latest 020361875850.dkr.ecr.us-east-1.amazonaws.com/geolocation_ecr_rep:latest'
                    sh 'docker push 020361875850.dkr.ecr.us-east-1.amazonaws.com/geolocation_ecr_rep:latest'
                }
            }
        }
