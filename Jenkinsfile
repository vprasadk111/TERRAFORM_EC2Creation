pipeline {

    parameters {
        string(name: 'environment', defaultValue: 'TERRAFORMEC2', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any

    stages {
        stage('Clone Git') {
            steps {
                            
                            git branch: 'main', credentialsId: '19317b53-1a11-4058-bc37-57fa86794fb8', url: 'https://github.com/vprasadk111/TERRAFORM_EC2Creation'
                       
                    }
                }

        stage('Terraform Plan') {
            steps {

                sh 'terraform init -input=false'
                sh 'terraform workspace new ${environment}'
                sh 'terraform workspace select ${environment}'
                sh "terraform plan -input=false -out tfplan "
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Terraform apply Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "terraform apply -input=false tfplan"
            }
        }
    }

  }
