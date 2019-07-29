
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

     }
    }

}