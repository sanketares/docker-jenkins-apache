pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone your repository if using Git
                // git 'https://github.com/your-repo/apache-web-app.git'
                
                // For a local setup, this step might not be necessary
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('apache-web-app')
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
