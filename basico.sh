echo "rpm install"
sudo yum install -y rpm

echo "dnfUpdate"
sudo dnf update -y

echo "installing vim and net-tools"
sudo yum install -y vim net-tools wget

echo "Installing Apache"
sudo yum install -y httpd httpd-tools

echo "Adding Apache service to autostart"
sudo chkconfig httpd on

echo "Starting Apache"
service httpd restart

echo "disabling selinux"
sudo -i
cd /etc/sysconfig/  
sudo sed -i "s/enforcing/disabled/" selinux
cd /etc/selinux/  
sudo sed -i "s/enforcing/disabled/" config


