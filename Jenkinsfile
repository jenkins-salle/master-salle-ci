pipeline {
   agent any

       stages {
          stage("Checkout SCM") {
             steps {
                    echo 'Getting the latest sources from remote repository & compile those sources'
                    git branch: 'develop', url: 'https://github.com/jenkins-salle/master-salle-ci.git'
             }
          }
          stage("Multi-build Pipeline") {
             steps {
                    sh script: './pipeline.sh'
             }
          }
      }
}
