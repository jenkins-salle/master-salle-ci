pipeline {
   agent any

       stages {
          stage("Compile") {
             steps {
                    echo 'Getting the latest sources from remote repository & compile those sources'
                    git 'https://github.com/jenkins-salle/master-salle-ci.git'
                    sh script: './mvnw compile'
             }
          }
          stage("Tests") {
             steps {
	            echo 'Test cases execution'
	            sh script: './mvnw test'
            	    junit 'target/surefire-reports/*.xml'
             }
          }
          stage("Static code analysis") {
             steps {
                    echo 'Performing static code analysis by PMD'
                    sh script: './mvnw pmd:check'
             }
          }
          stage('Package') {
              steps {
                     echo 'Packaging in process'
                     sh script: './mvnw package -DskipTests'
              }
          }
          stage("Integration tests") {
             steps {
	     	    echo 'Execute integration test cases'
	            sh script: './mvnw verify'
             }
          }
          stage("Deploy") {
             steps {
                    echo 'Deploy the app'
                    sh script: 'java -jar ./target/code-with-quarkus-1.0.0-SNAPSHOT-runner.jar'
             }
          }
   }
}
