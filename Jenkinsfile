
abcs = ['./SampleAPI' , './SwaggerPetstore']

node('master') {
    stage('Setup APIM Environments') {

           withCredentials([usernamePassword(credentialsId: 'apim', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
             sh './config.sh'
           }

    }

    stage('Deploying to Test') {
     list.each { item ->
        sh "echo Hello test ${item}"
       environment{
         ENV = 'test'
         RETRY = '80'
       }
         sh 'apimcli import-api -f  ${item} -e $ENV -k --preserve-provider=false --update --verbose'
     }
    }

    stage('Deploying to Staging') {
      list.each { item ->
        sh "echo Hello staging ${item}"
       environment{
         ENV = 'test'
         RETRY = '80'
       }
         sh 'apimcli import-api -f  ${item} -e $ENV -k --preserve-provider=false --update --verbose'
      }
    }

    stage('Deploying to Production') {
      list.each { item ->
        sh "echo Hello prod ${item}"
       environment{
         ENV = 'test'
         RETRY = '80'
       }
         sh 'apimcli import-api -f  ${item} -e $ENV -k --preserve-provider=false --update --verbose'
     }
   }
}