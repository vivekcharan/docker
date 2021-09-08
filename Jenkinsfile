node{
    stage('scm checkout'){
        git credentialsId: 'git-creds', url: 'https://github.com/vivekcharan/docker'
    }
    stage('Mvn package'){
        def mvnHome = tool name: 'maven-3', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package" 
   }
    stage('Build docker image'){
       sh 'docker build -t charan/my-app:1.0 .'
    }
    stage('push docker image'){
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u vivekcharan -p ${dockerHubPwd}"
    }
        sh 'docker push charan/my-app:1.0'
    }
    stage('deploy a container in a server'){
        def dockerRun = 'docker run -p 8080:80  -d --name my-app  vivekcharan/my-app:1.0'
        sshagent(['server']) {
            sh "ssh -o StrictHostKeyChecking=no ec2-user@private-ip ${dockerRun}" 
        } 
   }
}
