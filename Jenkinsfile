pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    def imageName = "my-web-app:latest"
                    def dockerImage = docker.build(imageName, "-f Dockerfile .")

                    // Push the Docker image to a registry (optional)
                    dockerImage.push()
                }
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the Docker container (e.g., using Docker Compose or Kubernetes)
                // You need to configure this step based on your deployment strategy.
            }
        }
    }

    post {
        always {
            // Clean up Docker images (optional)
            cleanWs()
            sh 'docker rmi -f my-web-app:latest || true'
        }
    }
}
