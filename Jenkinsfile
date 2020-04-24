pipeline {
    agent any 
	
    stages {
	stage('sdd'){
            steps {
		    sh 'export MAVEN_HOME=/opt/maven'
		    sh 'export PATH=$PATH:$MAVEN_HOME/bin'
	    }
	}
			
        stage('Maven Compile') { 
            steps {
	        
		     sh 'mvn clean compile'
	        }
                
            }
        
        stage('Maven Test') { 
            steps {
	       
	           sh 'mvn test'
               }
            }
        
        stage('Maven Package') { 
            steps {
                
	             sh 'mvn package'
            }
        }
    
       

   }
}
