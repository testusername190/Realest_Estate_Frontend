pipeline {
     environment{
        dockerimage=""
    }
    agent any
    stages {
        stage('Git clone') {
            steps {
              git 'https://github.com/testusername190/Realest_Estate_Frontend.git'
            }
        }
        stage('Docker Build Image') {
            steps {
                script{
                    dockerimage=docker.build "vishalsin25/spe-major-front:latest"   
                }
            }
        }
                 stage('Delete Docker Containers and Existing Images') {
            steps {
                script{
                    // here we are checking if there are any containers running in our system if so then delete them.
                    // def running_containers = sh (returnStdout: true, script: 'docker ps -q').trim()
                    // if (running_containers) {
                    //     sh 'docker rm -f $(docker ps -aq)'
                    // }
                    
                    // sh 'docker image rm -f sbrc1996/speminiproject'
                    sh '''
                        # Remove all images with the tag <none>
                        docker rmi --force $(docker images | grep "<none>" | awk '{print $3}')
                        '''
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script{
                    docker.withRegistry('','dockerhub'){
                    dockerimage.push()
                    }
                }
            }
        }
      
    }
}
