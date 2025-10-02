#!/bin/bash
set -e
# Script para instalar Minikube en una VM Ubuntu

USERNAME="${admin_username}"

# Instalar Docker
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker $USERNAME

# Instalar kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# Ver ip publica
echo "Public IP: $(curl -s https://api.ipify.org)"
# Instalar Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube

# Iniciar Minikube con driver docker (recomendado)
sudo -u $USERNAME minikube start --driver=docker --listen-address=0.0.0.0 --ports=8443:8443 --apiserver-ips=$(curl -s https://api.ipify.org)

# Copiar kubeconfig a home del usuario
sudo -u $USERNAME -H bash -c "mkdir -p /home/$USERNAME/.kube"
sudo -u $USERNAME -H bash -c "minikube update-context"