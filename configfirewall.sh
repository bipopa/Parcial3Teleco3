echo "enabling forwarding"
sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

echo "configuring firewalld"
sudo -i
sudo service firewalld start
sudo chkconfig firewalld on

sudo firewall-cmd --zone=internal --change-interface=eth0
sudo firewall-cmd --zone=internal --change-interface=eth2
sudo firewall-cmd --zone=dmz --change-interface=eth1

sudo firewall-cmd --set-default-zone=dmz

sudo firewall-cmd --zone=dmz --add-service=http
sudo firewall-cmd --zone=internal --add-service=http 

sudo firewall-cmd --zone=internal --add-masquerade
sudo firewall-cmd --zone=dmz --add-masquerade

sudo firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -o eth1 -j MASQUERADE 
sudo firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i eth2 -o eth1 -j ACCEPT 
sudo firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i eth1 -o eth2 -m state --state RELATED,ESTABLISHED -j ACCEPT


sudo firewall-cmd  --zone=dmz --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=192.168.10.20
sudo firewall-cmd  --zone=dmz --add-forward-port=port=8080:proto=tcp:toport=8080:toaddr=192.168.10.20
sudo firewall-cmd  --zone=dmz --add-port=80/tcp
sudo firewall-cmd  --zone=dmz --add-port=8080/tcp

sudo firewall-cmd  --zone=internal --add-port=80/tcp
sudo firewall-cmd  --zone=internal --add-port=8080/tcp
sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --reload

sudo reboot