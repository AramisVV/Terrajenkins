terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.1"
    }
  }
}

provider "local" {}

# Variable opcional (para personalizar el nombre)
variable "shylocker_server" {
  description = "Nombre del servidor simulado"
  type        = string
  default     = "Servidor_Prueba"
}

# Este recurso crea un archivo local que representa la 'infraestructura'
resource "local_file" "infra" {
  filename = "${var.shylocker_server}.txt"
  content  = "Infraestructura simulada creada exitosamente. Timestamp: ${timestamp()}"
}
