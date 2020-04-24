pipeline {
    agent any 
	
    stages {
        stage('Maven Compile') { 
            steps {
	        withMaven(maven : 'mymaven') {
		     sh 'mvn clean compile'
	        }
                
            }
        }
        stage('Maven Test') { 
            steps {
	       withMaven(maven : 'mymaven') {
	           sh 'mvn test'
               }
            }
        }
        stage('Maven Package') { 
            steps {
                withMaven(maven : 'mymaven') {
	             sh 'mvn package'
            }
        }
    }
	stage('docker build ') { 
            steps {
	             sh 'docker build -t hw .'
            }
        }
    
       

   }
}
