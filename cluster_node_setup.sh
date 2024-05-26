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

# run the following commands on the master node
# microk8s add-node
# copy the output of the above command and run it on the worker node

