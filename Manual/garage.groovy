pipeline{
    agent any
    tools {
        maven 'jenkins-maven'
    }
    stages{
        stage('code checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/bheem-medi/bheem-one.git'
            }
        }
        stage('Build with MVN'){
            steps{
                dir('Manual/garage'){
                    sh 'mvn clean package'
                }
            }
        }
        stage('sonarqube analysis'){
            steps{
                dir('Manual/garage'){
                    withSonarQubeEnv('jenkins-sonar'){
                        sh '''
                            mvn sonar:sonar \
                            -Dsonar.projectKey=car-rental \
                            -Dsonar.projectName="car-rental-application"
                        '''
                    }
                }
            }
        }
        stage('Code quality analysis'){
            steps{
                dir('Manual/garage'){
                    script{
                        try {
                            timeout(time: 2, unit: 'MINUTES') {
                                waitForQualityGate abortPipeline: false
                            }
                        } catch (Exception e) {
                                echo "SonarQube timeout - Continuing deployment anyway"
                        }
                    }
                }
            }
        }
        stage('Build DockerImage'){
            steps{
                dir('Manual/garage'){
                    sh 'docker build -t bheem05/garage:garage_image .'
                }
            }
        }
        stage('Image Scan'){
            steps{
                sh 'trivy image bheem05/garage:garage_image'
            }
        }
        stage('Deploy Container'){
            steps{
                script{
                    sh '''
                        # Stop old container if running
                        docker stop garage-app || true
                        docker rm garage-app || true
                        
                        # Run new container
                        docker run -d \
                            --name garage-app \
                            -p 8081:8080 \
                            bheem05/garage:garage_image
                        
                        echo "Container deployed successfully!"
                    '''
                }
            }
        }
    }
}
