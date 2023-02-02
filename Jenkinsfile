node {
    def WORKSPACE = "/Users/jeebanswain/.jenkins/workspace/spring-boot-docker/"
    def dockerImageTag = "spring-boot-docker${env.BUILD_NUMBER}"

    try{
//          notifyBuild('STARTED')
         stage('Clone Repo') {
            // for display purposes
            // Get some code from a GitHub repository
            git url: 'https://github.com/jeebannitw/springboot-hello-world.git',
                branch: 'main'
         }
          stage('Build docker') {
                 echo "building the docker image started"
                 echo "build number: ${env.BUILD_NUMBER}"
                 script{
                    sh 'docker build -t spring-boot-docker_test .'
                 }
                 echo "building the docker image finished"
          }

          stage('Deploy docker'){
                  echo "Docker Image Tag Name: ${dockerImageTag}"
                  echo "trying to run the docker application"
                  sh "docker run -p 9090:8072 spring-boot-docker:${env.BUILD_NUMBER}"
                  echo "running the docker application"
          }

    }catch(e){
//         currentBuild.result = "FAILED"
        throw e
    }finally{
//         notifyBuild(currentBuild.result)
    }
}


def notifyBuild(String buildStatus = 'STARTED'){

// build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESSFUL'
  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def now = new Date()
  // message
  def subject = "${buildStatus}, Job: ${env.JOB_NAME} FRONTEND - Deployment Sequence: [${env.BUILD_NUMBER}] "
  def summary = "${subject} - Check On: (${env.BUILD_URL}) - Time: ${now}"
  def subject_email = "Spring boot Deployment"
  def details = """<p>${buildStatus} JOB </p>
    <p>Job: ${env.JOB_NAME} - Deployment Sequence: [${env.BUILD_NUMBER}] - Time: ${now}</p>
    <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME}</a>"</p>"""


  // Email notification
    emailext (
         to: "jeebannitw@gmail.com",
         subject: subject_email,
         body: details,
         recipientProviders: [[$class: 'DevelopersRecipientProvider']]
       )
}
