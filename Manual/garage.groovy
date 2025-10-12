pipeline{
    agent any
    stages{
        // stage1: code pull from github repo
        stage('code checkout'){
            steps{
                git branch: 'main', 'url': 'https://github.com/bheem-medi/bheem-one.git'
            }
        }
        stage('BUILD with maven'){
            steps{
                dir('Manual/garage'){
                sh 'mvn clean package'
                }
            }
        }
        stage('code quality anaysis'){
            steps{
                 dir('Manual/garage'){
                       withSonarQubeEnv('jenkins-sonar'){
                            sh ''' 
                                mvn sonar:sonar \
                                -Dsonar.projectKey=car-rent \
                                -Dsonar.projectName="car-renatl application" 
                            '''
                       }
                 }
            }
        }
    }
}
