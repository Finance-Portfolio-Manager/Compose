pipeline {
    agent any

    environment {
        PATH = "$PATH:/usr/local/bin"
        KEYS_ALPHAVANTAGE = credentials('KEYS_ALPHAVANTAGE')
        NEWS_API_KEY = credentials('NEWS_API_KEY')
        DB_URL = credentials('DB_URL')
        DB_USER = credentials('DB_USER')
        DB_PASS = credentials('DB_PASS')
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
                sh 'PORT=80 DB_URL=${DB_URL} DB_USER=${DB_USER} DB_PASS=${DB_PASS} KEYS_ALPHAVANTAGE=${KEYS_ALPHAVANTAGE} NEWS_API_KEY=${NEWS_API_KEY} docker-compose up -d'
            }
        }
    }
}
