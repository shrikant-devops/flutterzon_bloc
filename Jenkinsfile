pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'flutterzon-app'
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/tejasbadone/flutterzon_bloc.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }

        stage('Test') {
            steps {
                sh 'flutter test'
            }
        }

        stage('Build Web') {
            steps {
                sh 'flutter build web'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                sh 'docker run -d -p 5000:5000 flutterzon-app'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
