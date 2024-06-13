pipeline {
    options {
      timeout(time: 1, unit: 'HOURS') 
  }
    agent any
    triggers {
        pollSCM '*/5 * * * *'
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                docker compose up -d
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                apt update
                apt install python3-pip -y
                python3 -m venv /venv
                source /venv/bin/activate
                pip install pytest selenium
                docker compose up -d
                sleep 15
                python test_devopstest.py
                '''
            }
        }
        stage('Deliver') {
            steps {
                sh '''
                echo "Ready to deliver"
                '''
            }
        }
    }
}