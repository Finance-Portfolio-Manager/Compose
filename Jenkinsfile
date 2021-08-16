pipeline {
    agent any

    environment {
        PATH = "$PATH:/usr/local/bin"
        KEYS_ALPHAVANTAGE = credentials('KEYS_ALPHAVANTAGE')
        NEWS_API_KEY = credentials('NEWS_API_KEY')
    }

    stages {
        stage('Compose down') {
            steps {
                sh 'PORT=80 docker-compose kill || true'
                sh 'docker rm $(docker ps -a -f status=exited -q) || true'
            }
        }
        stage('Compose up') {
            steps {
                sh 'PORT=80 KEYS_ALPHAVANTAGE=${KEYS_ALPHAVANTAGE} NEWS_API_KEY=${NEWS_API_KEY} docker-compose up -d'
            }
        }
    }
}
