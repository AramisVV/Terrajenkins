pipeline {
    agent any

    environment {
        TERRAFORM_PATH = "C:\\terraform\\terraform.exe"
      
    }

    stages {
        stage('Preparar entorno') {
            steps {
                echo 'Inicializando Terraform...'
                bat "${env.TERRAFORM_PATH} init"
            }
        }

        stage('Validar configuración') {
            steps {
                echo 'Validando sintaxis de Terraform...'
                bat "${env.TERRAFORM_PATH} validate"
            }
        }

        stage('Simular plan') {
            steps {
                echo 'Simulando infraestructura...'
                bat "${env.TERRAFORM_PATH} plan -out=plan.txt"
            }
        }

        stage('Aplicar simulación') {
            steps {
                echo 'Creando infraestructura simulada (archivo)...'
                bat "${env.TERRAFORM_PATH} apply -auto-approve"
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: '*.txt, plan.txt', fingerprint: true
            echo '✅ Infraestructura simulada creada correctamente.'
        }
        failure {
            echo '❌ Error en el pipeline o en la configuración Terraform.'
        }
    }
}
