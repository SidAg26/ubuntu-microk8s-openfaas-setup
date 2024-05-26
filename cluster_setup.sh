# Pre-requisite: snapd should be installed
# install microk8s
sudo snap install microk8s --classic
# join the group
sudo usermod -a -G microk8s $USER
mkdir -p ~/.kube
sudo chown -f -R $USER ~/.kube
# re-enter the group
newgrp microk8s
# enable microk8s
microk8s status --wait-ready
# add alias to use commands
alias kubectl='microk8s kubectl'
alias kubectl='microk8s.kubectl'

# Enable community
microk8s enable community
# Enable openfaas
microk8s enable openfaas
# Retrieve password
PASSWORD=$(kubectl get secret -n openfaas basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 --decode)
echo "export OPENFAAS_PASSWORD=\"$PASSWORD\"" >> ~/.bashrc
# Retrieve gateway IP
# GATEWAY_IP=$(kubectl get svc -n openfaas gateway-external -o jsonpath="{.spec.clusterIP}")
GATEWAY_IP=$(hostname -I | awk '{print $1}')
echo "export OPENFAAS_URL=\"http://$GATEWAY_IP:31112\"" >> ~/.bashrc
# Install faas-cli
curl -sSL https://cli.openfaas.com | sudo sh