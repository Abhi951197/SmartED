pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        IMAGE_NAME = 'smarted-abhi-new-web' // Replace with your actual DockerHub username/repo
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Abhi951197/SmartED.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Run Tests in Docker') {
    steps {
        bat "docker run --rm %IMAGE_NAME% python -m pytest tests"
    }
}


        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    bat '''
                    echo %PASSWORD% | docker login -u %USERNAME% --password-stdin
                    docker push %IMAGE_NAME%
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                bat 'docker run -d -p 5000:5000 %IMAGE_NAME%'
            }
        }
    }
}
