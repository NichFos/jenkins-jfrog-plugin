pipeline {
    agent any
   tools {
        jfrog 'jfrog-cli-remote'
    }
    environment {
        AWS_REGION = 'us-east-1' 
    }
    stages {
        stage('Set AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'JenkinsCredentials3' 
                ]]) {
                    sh '''
                    echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"
                    aws sts get-caller-identity
                    '''
                }
            }
        }
        stage('Checkout Code') {
            steps {
                git branch: 'main', url:'https://github.com/NichFos/jenkins-jfrog-plugin.git' 
            }
        }
        stage ('Testing') {
            steps {
                jf '-v' 
                jf 'c show'
                jf 'rt ping'
                sh 'touch test-file'
                jf 'rt u test-file my-repo/'
                jf 'rt bp'
                jf 'rt dl my-repo/test-file'
            }
        } 
        stage('Initialize Terraform') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'JenkinsCredentials3'
                ]]) {
                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    terraform init
                    '''
                }
            }
        }
      
        stage('Plan Terraform') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'JenkinsCredentials3'
                ]]) {
                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    terraform plan -out=tfplan
                    '''
                }
            }
        }
    //     stage('Apply Terraform') {
    //         steps {
    //             input message: "Approve Terraform Apply?", ok: "Deploy"
    //             withCredentials([[
    //                 $class: 'AmazonWebServicesCredentialsBinding',
    //                 credentialsId: 'JenkinsCredentials3'
    //             ]]) {
    //                 sh '''
    //                 export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
    //                 export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
    //                 terraform apply -auto-approve tfplan
    //                 '''
    //             }
    //         }
    //     }
    // }
    // post {
    //     success {
    //         echo 'Terraform deployment completed successfully!'
    //     }
    //     failure {
    //         echo 'Terraform deployment failed!'
    //     }
    // }
}
}