variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "minikube-rg"
}

variable "location" {
  description = "Región de Azure"
  type        = string
  default     = "East US"
}

variable "vm_name" {
  description = "Nombre de la VM"
  type        = string
  default     = "minikube-vm"
}

variable "vm_size" {
  description = "Tamaño de la VM"
  type        = string
  default     = "Standard_B2s"  # Suficiente para Minikube
}

variable "admin_username" {
  description = "Nombre de usuario administrador"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Ruta a la clave pública SSH"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  description = "Ruta a la clave pública SSH"
  type        = string
  default     = "~/.ssh/id_rsa"
}