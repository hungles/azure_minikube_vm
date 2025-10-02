#!/bin/bash

# 1. Obtener IP pública de la VM
PUBLIC_IP=$(curl -s https://api.ipify.org)

# 2. Rutas a los archivos de Minikube
KUBECONFIG_IN="$HOME/.kube/config"
KUBECONFIG_OUT="$HOME/kubeconfig-portable.yaml"

# 3. Hacer una copia
cp "$KUBECONFIG_IN" "$KUBECONFIG_OUT"

# 4. Reemplazar la dirección del servidor (127.0.0.1 o localhost → IP pública)
sed -i -E "s/(localhost|127\.0\.0\.1|([0-9]{1,3}\.){3}[0-9]{1,3})/$PUBLIC_IP/g" "$KUBECONFIG_OUT"
sed -i "s/localhost/$PUBLIC_IP/g" "$KUBECONFIG_OUT"

# 5. Embeber los certificados en base64 (esto es lo clave)
CRT=$(base64 -w 0 "$HOME/.minikube/profiles/minikube/client.crt")
KEY=$(base64 -w 0 "$HOME/.minikube/profiles/minikube/client.key")
CA=$(base64 -w 0 "$HOME/.minikube/ca.crt")

# 6. Reemplazar las rutas por datos embebidos
sed -i "s|client-certificate:.*|client-certificate-data: $CRT|" "$KUBECONFIG_OUT"
sed -i "s|client-key:.*|client-key-data: $KEY|" "$KUBECONFIG_OUT"
sed -i "s|certificate-authority:.*|certificate-authority-data: $CA|" "$KUBECONFIG_OUT"

# 7. Mostrar resultado (opcional)
echo "✅ kubeconfig portable generado en: $KUBECONFIG_OUT"
echo "👉 Copia este archivo y guárdalo como secreto en GitHub"
