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
             sh 'gcloud container clusters create --zone us-central1-a --network sanvpc mycluster --num-nodes=2'
        
    }

    stage('Deploy the dokcer base image in Kubernetes') {
             sh 'kubectl create deployment mydep --image=gcr.io/mystic-impulse-245222/soloo0000'
    }

    stage('Create a LoadBalancer Service to expose the url'){ 
             sh 'kubectl expose deployment mydep --type=LoadBalancer --port 80 --target-port 8080'
             sleep 120 // seconds
    }
    
    stage('Get Service or the External IP'){
             sh 'kubectl get service'
             sleep 100
    }

    stage('Delete Service') {
              sh 'kubectl delete service mydep'
              sleep 60
    }
     stage('Delete cluster'){
            sh 'gcloud container clusters delete mycluster --zone us-central1-a --quiet'
     }

	    
	    
	    
	    
	    

   }
}
