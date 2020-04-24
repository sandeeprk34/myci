pipeline {
    agent any 
	
    stages {
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
