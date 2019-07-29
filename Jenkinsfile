
abcs = ['./SampleAPI' , './SwaggerPetstore']

node('master') {
    stage('Setup APIM Environments') {
        steps{
           withCredentials([usernamePassword(credentialsId: 'apim', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
             sh './config.sh'
           }
        }
    }

    stage('Deploying to Test') {
        loop_of_sh(abcs)
    }

    stage('Deploying to Staging') {
        loop_with_preceding_sh(abcs)
    }

    stage('Deploying to Production') {
        traditional_int_for_loop(abcs)
    }
}

@NonCPS // has to be NonCPS or the build breaks on the call to .each
def echo_all(list) {
    list.each { item ->
        echo "Hello ${item}"
    }
}
// outputs all items as expected

@NonCPS
def loop_of_sh(list) {
    list.each { item ->
        sh "echo Hello ${item}"
       environment{
         ENV = 'test'
         RETRY = '80'
       }
       steps {
         echo 'Deploying to Test'
         sh 'apimcli import-api -f  ${item} -e $ENV -k --preserve-provider=false --update --verbose'
       }
    }
}
// outputs only the first item

@NonCPS
def loop_with_preceding_sh(list) {
    sh "echo Going to echo a list"
    list.each { item ->
        sh "echo Hello ${item}"
    }
}
// outputs only the "Going to echo a list" bit

//No NonCPS required
def traditional_int_for_loop(list) {
    sh "echo Going to echo a list"
    for (int i = 0; i < list.size(); i++) {
        sh "echo Hello ${list[i]}"
    }
}