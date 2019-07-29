
apiNames = ['./SampleAPI' , './SwaggerPetstore']

node('master') {
    stage('Setup APIM Environments') {

           withCredentials([usernamePassword(credentialsId: 'apim', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
             sh './config.sh'
           }

    }

    stage('Deploying to Test') {
            deploying_to_test(apiNames)
    }

    stage ('Testing test environment') {
           sh 'cd newman'
           sh 'npm install'
           sh 'npm run api-test'
    }

    stage('Deploying to Staging') {
                deploying_to_staging(apiNames)
    }

}

def deploying_to_test(list) {
    env.RETRY = '80'
    for (int i = 0; i < list.size(); i++) {
        sh "echo deploying API ${list[i]} to test environment"
        sh "apimcli import-api -f ${list[i]} -e test -k --preserve-provider=false --update --verbose"
    }
}

def deploying_to_staging(list) {
    env.RETRY = '80'
    for (int i = 0; i < list.size(); i++) {
        sh "echo deploying API ${list[i]} to staging environment"
        sh "apimcli import-api -f ${list[i]} -e staging -k --preserve-provider=false --update --verbose"
    }
}
