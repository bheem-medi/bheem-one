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
    }
}
