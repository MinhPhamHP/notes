pipeline {
    agent any
    stages {
        stage('build'){
            steps {
                dir('/var/lib/jenkins/workspace/5_test-pipeline-1_master') {
                git 'https://github.com/MinhPhamHP/test-jenkinsfile-1.git'   
               }             
            }
         }
    }
}