pipeline {
   agent any

       stages {
       	  stage("Checkout from SCM") {
	       	  steps {
	       	  		echo "Getting the latest sources from remote repository"
	       	  		git 'https://github.com/jenkins-salle/master-salle-ci.git'
	       	  }
       	  }
          stage("Compile") {
             steps {
                    echo 'Compiling sources'
                    sh script: './mvnw compile'      
             }
          }
          stage("Tests") {
          	 steps {
	          		echo 'Do Junit test cases'
	          		sh script: './mvnw test'
            		junit 'target/surefire-reports/*.xml'
             }
          }
          stage("Static code check by PMD") {
             steps {
                    echo 'Static code analysis'
                    sh script: './mvnw pmd:check'      
             }
          }
          stage('Package') {
              steps {
                sh script: './mvnw package -DskipTests'
              }
          }
          stage("Integration tests") {
          	 steps {
	          		echo 'Do integration tests'
	          		sh script: './mvnw verify'
             }
          }
          stage("Deploy") {
             steps {
                    echo 'Deploy to artifactory'
             }
          }
   }
}
