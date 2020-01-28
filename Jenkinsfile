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
                 sh "docker-compose down"
             }
          }
          stage("Build") {
             steps {
                 sh "docker-compose build"
             }
          }
          stage("Test") {
             steps {
                 sh "docker-compose up -d quarkus-app"
                 sh "docker-compose run quarkus-build ./mvnw test"
             }
          }
      }
}