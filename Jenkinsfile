pipeline {
    agent {label 'ec2-slave'}  // cont-slave / ec2-slave
    
    tools {

        git "Default"
    }
    stages {
        stage('Preperation') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Ahmed-Ali-Elbaz/jenkins_nodejs_example.git'

            }
        }
        
        stage('Ci') {
            steps {
                    
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) { 
                
                sh """
                    
                    docker build . -f dockerfile -t ahmedhedihed/nodeapp:$BUILD_NUMBER
                    docker login -u ${USERNAME} -p ${PASSWORD}
                    docker push ahmedhedihed/nodeapp:$BUILD_NUMBER
                    
                """
                
                }    

            }
        }        
        
        stage('CD') {
            steps {
                    
                 sh "docker run -d -p 3000:3000 ahmedhedihed/nodeapp:$BUILD_NUMBER"

            }
        }         
   
   
   
        stage('Print Branch name') {
            steps {
                    
                 echo "${env.GIT_BRANCH}"

            }
        }       
   
   
   
   
   
        
        
        
        
        
    }
}
