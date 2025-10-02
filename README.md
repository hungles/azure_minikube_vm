# Minikube VM en Azure con Terraform

Este proyecto permite crear una máquina virtual en Azure con Minikube instalado, utilizando Terraform para la gestión de la infraestructura.

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/es-es/cli/azure/install-azure-cli)
- Una cuenta de Azure con permisos suficientes

## Estructura del proyecto

```
minkube_vm/
├── main.tf
├── variables.tf
└── README.md
```

## Pasos para desplegar

1. **Clona el repositorio**
   ```bash
   git clone <url-del-repositorio>
   ```

2. **Autentícate en Azure**
   ```bash
   az login
   ```

3. **Inicializa Terraform**
   ```bash
   terraform init
   ```

4. **Revisa y personaliza las variables en `variables.tf`**

5. **Aplica la infraestructura**
   ```bash
   terraform apply
   ```

## ¿Qué se crea?

- Grupo de recursos en Azure
- Máquina virtual con Ubuntu
- Instalación automática de Minikube y dependencias
- Red y reglas de acceso necesarias

## Limpieza

Para eliminar los recursos creados:
```bash
terraform destroy
```

## Notas

- Asegúrate de tener suficiente cuota en tu suscripción de Azure.
- Puedes modificar los archivos `.tf` para personalizar la configuración de la VM y Minikube.

## Referencias

- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)