pipeline {
   agent any

       stages {
          stage("Checkout SCM") {
             steps {
                    echo 'Getting the latest sources from remote repository & compile those sources'
                    git branch: "${env.BRANCH_NAME}", url: 'https://github.com/jenkins-salle/master-salle-ci.git'
             }
          }
          stage("Clean") {
             steps {
                 sh script: "./clean.sh"
             }
          }
          stage("Build") {
             steps {
                 sh script: "./build.sh"
             }
          }
          stage("Test") {
             steps {
                sh script: "./test.sh"
             }
          }
          stage("Deploy") {
             steps {
                sh script: "./deploy.sh"
             }
          }
      }
      post {
         success {
            slackSend channel: '#tp-ci',
                       color: 'good',
                       message: "The pipeline ${currentBuild.fullDisplayName} completed successfully."
         }
         failure {
            slackSend channel: '#tp-ci',
                       color: 'red',
                       message: "The pipeline ${currentBuild.fullDisplayName} completed with errors."
         }
      }
}