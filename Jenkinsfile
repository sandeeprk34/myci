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
	             sh 'docker build -t hw .'
            }
        }
	 stage('docker images') { 
            steps {
	             sh 'docker images'
            }
        }
         
	    stage('docker tag') { 
            steps {
	             sh 'docker tag hw gcr.io/mystic-impulse-245222/hw:1.0'
            }
        }
	    
	    stage('docker push') { 
            steps {
	             sh 'docker push gcr.io/mystic-impulse-245222/hw:1.0'
            }
        }
      
       
	  stage('create K8s cluster') {
           steps{

             sh 'gcloud container clusters create --zone us-central1-a --network sanvpc mycluster --num-nodes=2'
	   }
    }

    stage('Deploy the dokcer base image in Kubernetes') {
	    steps{
             sh 'kubectl create deployment mydep --image=gcr.io/mystic-impulse-245222/soloo0000'
	    }
    }

    stage('Create a LoadBalancer Service to expose the url'){ 
	    steps{
             sh 'kubectl expose deployment mydep --type=LoadBalancer --port 80 --target-port 8080'
             sleep 120 // seconds
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
              sh 'kubectl delete service mydep'
              sleep 60
	    }
    }
     stage('Delete cluster'){
	     steps{
            sh 'gcloud container clusters delete mycluster --zone us-central1-a --quiet'
	     }
     }

	    
	    
	    
	    
	    

   }
}
