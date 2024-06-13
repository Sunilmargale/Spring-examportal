pipeline {
    agent any
    stages {
        stage("code"){
            steps {
            echo "cloning the code" 
            git url:"https://github.com/Sunilmargale/Spring-examportal.git", branch: "main"
            }
        }
        stage("build"){
            steps {
                echo "building the image"
                sh "docker build -t spring-examportal ."
            }
        }
        stage("push to dockerhub"){
            steps {
                echo "pushing the image to dockerhub"
                withCredentials([usernamePassword(credentialsId:"docker-hub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"  
                sh "docker tag notes-app ${env.dockerHubUser}/spring-examportal:latest"
                sh "docker push ${env.dockerHubUser}/spring-examportal:latest"
                }
            } 
        }
        stage("deploy"){
            steps {
                echo "deploying the container"
                sh "docker run -p 5000:5000 spring-examportal:latest"
            }
        }
    }
}
