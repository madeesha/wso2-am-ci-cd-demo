
apiNames = ['./SampleAPI' , './SwaggerPetstore']

node('master') {
    stage('Setup APIM Environments') {

           withCredentials([usernamePassword(credentialsId: 'apim', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
             sh './config.sh'
           }

    }

    stage('Deploying to Test') {
         environment{
              ENV = 'test'
              RETRY = '80'
         }
            deploying_to_test(apiNames)
    }

}

def deploying_to_test(list) {
    env.RETRY = '80'
    sh "echo Going to echo a list"
    for (int i = 0; i < list.size(); i++) {
        sh "echo Hello ${list[i]}"
        sh "apimcli import-api -f ${list[i]} -e test -k --preserve-provider=false --update --verbose"
    }
}