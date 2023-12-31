pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker login https://index.docker.io/v1/ -u akashm311 -p Akashm@99'

                    def imageName = "akashm311/my-web-app:latest"
                    def dockerImage = docker.build(imageName, "-f Dockerfile .")

                    // Push the Docker image to a registry (optional)
                    dockerImage.push()
                }
            }
        }

        stage('Deploy') {
            steps {
                // Apply the Kubernetes YAML files (Deployment and Service)
                sh 'kubectl apply -f kubernetes-deployment.yaml'
                sh 'kubectl apply -f kubernetes-service.yaml'
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
