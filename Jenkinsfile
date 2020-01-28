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

      post {
          success {
            mail to: 'ricardo.muhamed@gmail.com', subject: 'Build success :D', body: 'success'
          }
          failure {
            mail to: 'ricardo.muhamed@gmail.com', subject: 'The Pipeline failed :(', body: 'failed'
          }
   }
}
