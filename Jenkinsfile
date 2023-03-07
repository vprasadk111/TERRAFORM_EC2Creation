pipeline {
   agent  any
    stages {
        stage("Cloine Git"){
            steps{
                git "https://github.com/vprasadk111/TERRAFORM_EC2Creation.git"
            }
        }
        
      stage("Print hostname"){
            steps{
                sh 'hostname -i'
            }
        }
    }

  }

