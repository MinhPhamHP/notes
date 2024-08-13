#check product uuid
sudo cat /sys/class/dmi/id/product_uuid
#update os
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y
#turn off swap file and modify file /etc/fstab
sudo swapoff -a && sudo sed -i '/swap/ s/^\(.*\)$/#\1/g' /etc/fstab
sudo hostnamectl set-hostname "workernode2"
# add to /etc/hosts
#10.10.2.30 master-node
#10.10.2.31 worker01
#10.10.2.32 worker02
#configure the IPV4 bridge
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter
# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
# Apply sysctl params without reboot
sudo sysctl --system
#update
sudo apt-get update
#install ca tool
sudo apt-get install -y apt-transport-https ca-certificates curl
#sudo mkdir /etc/apt/keyrings
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
#add repo to apt
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
#install kube tool
sudo apt install -y kubeadm kubelet kubectl
sudo apt-mark hold kubeadm kubelet kubectl
#install_docker.sh
#sudo mkdir /etc/containerd
sudo sh -c "containerd config default > /etc/containerd/config.toml"
sudo sed -i 's/ SystemdCgroup = false/ SystemdCgroup = true/' /etc/containerd/config.toml
sudo systemctl restart containerd.service
sudo systemctl restart kubelet.service
sudo systemctl enable kubelet.service
#only for masternode
sudo kubeadm config images pull
sudo kubeadm init --pod-network-cidr=10.10.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/custom-resources.yaml -O
sed -i 's/cidr: 192\.168\.0\.0\/16/cidr: 10.10.0.0\/16/g' custom-resources.yaml
kubectl create -f custom-resources.yaml
#only for workernode
kubeadm join 10.10.2.30:6443 --token y62cyl.g0pz8waox5d2uxbx --discovery-token-ca-cert-hash sha256:9055017ea519360a7e2a9a32a097eb9452226d2920d87c7b87dbb0111723bbcc
#kubectl run in ps:  $env:PATH = $env:PATH + ';.'