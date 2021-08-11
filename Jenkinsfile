pipeline {
    agent any

    environment {
        KEYS_ALPHAVANTAGE = credentials('KEYS_ALPHAVANTAGE')
    }

    stages {
        stage('Compose down') {
            steps {
                sh 'docker-compose down'
            }
        }
        stage('Compose up') {
            steps {
                sh 'KEYS_ALPHAVANTAGE=${KEYS_ALPHAVANTAGE} docker-compose up -d'
            }
        }
    }
}
