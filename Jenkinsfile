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
	    
	    stage('Fix the docker permission issue') { 
            steps {
	             sh 'sudo chmod 666 /var/run/docker.sock'
            }
        }
	    
	    
	stage('docker build ') { 
            steps {
	             sh 'docker build -t image3 .'
            }
        }
	 stage('docker images') { 
            steps {
	             sh 'docker images'
            }
        }
         
	    stage('docker tag') { 
            steps {
	             sh 'docker tag image3 gcr.io/mystic-impulse-245222/image3'
            }
        }
	    stage('docker auth') { 
            steps {
	             sh 'gcloud auth configure-docker'
            }
        }
	   
	    stage('docker push') { 
            steps {
	             sh 'docker push gcr.io/mystic-impulse-245222/image3'
            }
        }
      
       
	  stage('create K8s cluster') {
           steps{

             sh 'gcloud container clusters create --zone us-central1-a --network sanvpc mycluster3 --num-nodes=2'
	   }
    }
	    
	    stage('depppp'){
	    steps{
             sh 'kubectl apply -f tomcat.yml'
             sleep 100
	    }
    }


    
    
    stage('Get Service or the External IP'){
	    steps{
             sh 'kubectl get service'
             sleep 100
	    }
    }

    stage('Delete Service') {
	    steps{
              sh 'kubectl delete service mydep3'
              sleep 60
	    }
    }
     stage('Delete cluster'){
	     steps{
            sh 'gcloud container clusters delete mycluster3 --zone us-central1-a --quiet'
	     }
     }

	    
	    
	    
	    
	    

   }
}
