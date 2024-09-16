pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = 'apache-web-app'
                    def imageTag = 'latest'

                    // Build the Docker image
                    docker.build("${imageName}:${imageTag}", "-f Dockerfile .")
                    echo 'build done'
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove the old container if it exists
                    sh '''
                        docker stop apache-web-app || true
                        docker rm apache-web-app || true
                    '''
                    
                    // Run the new container
                    docker.run(
                        image: 'apache-web-app',
                        name: 'apache-web-app',
                        ports: [ '8080:80' ],
                        detach: true
                    )
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker images and containers after the build
            sh '''
                docker system prune -f
            '''
        }
    }
}
