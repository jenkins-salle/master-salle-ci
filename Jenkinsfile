pipeline {
   agent any

       stages {
          stage("Checkout SCM") {
             steps {
                    echo 'Getting the latest sources from remote repository & compile those sources'
                    git branch: 'develop', url: 'https://github.com/jenkins-salle/master-salle-ci.git'
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
      }
}