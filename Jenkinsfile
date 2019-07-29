
abcs = ['./SampleAPI' , './SwaggerPetstore']

node('master') {
    stage('Setup APIM Environments') {

           withCredentials([usernamePassword(credentialsId: 'apim', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
             sh './config.sh'
           }

    }

    stage('Deploying to Test') {
             traditional_int_for_loop(abcs)
    }

}

def traditional_int_for_loop(list) {
    sh "echo Going to echo a list"
     environment{
        ENV = 'test'
        RETRY = '80'
     }
    for (int i = 0; i < list.size(); i++) {
        sh "echo Hello ${list[i]}"
        sh 'apimcli import-api -f ${list[i]} -e $ENV -k --preserve-provider=false --update --verbose'
    }
}