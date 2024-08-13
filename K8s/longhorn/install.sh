sudo apt-get install open-iscsi nfs-common jq -y
# iscsi启动
sudo modprobe iscsi_tcp
sudo bash -c 'echo iscsi_tcp > /etc/modprobe.d/iscsi-tcp.conf'
sudo systemctl enable  iscsid.service
sudo systemctl restart   iscsid.service
sudo systemctl status  iscsid.service
# 检查项
##请确保在 iscsid 服务启动之前iscsi_tcp模块已加载。通常，它应该与软件包安装一起自动加载。
sudo lsmod | grep iscsi -i
##启用了支持NFSv4.1、NFSv4.2
cat /boot/config-`uname -r`| grep CONFIG_NFS_V4_1
cat /boot/config-`uname -r`| grep CONFIG_NFS_V4_2
# check script
curl -sSfL https://raw.githubusercontent.com/longhorn/longhorn/v1.5.3/scripts/environment_check.sh | bash
#warning multipath
sudo systemctl stop multipathd
sudo systemctl disable multipathd
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.5.3/deploy/longhorn.yaml
kubectl -n longhorn-system create secret generic basic-auth --from-file=data.auth
kubectl -n longhorn-system apply -f longhorn-ingress.yaml
