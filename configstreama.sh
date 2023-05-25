echo "configuring streama as a service"
sudo -i
sudo touch /etc/systemd/system/streama.service
cd /etc/systemd/system/
sudo echo -e "[Unit]\nDescription=Streama Server\nAfter=syslog.target\nAfter=network.target\n" >> streama.service
sudo echo -e "[Service]\nUser=root\nType=simple\nExecStart=/bin/java -jar /opt/streama/streama.jar\nRestart=always\nStandardOutput=syslog\nStandardError=syslog\nSyslogIdentifier=Streama" >> streama.service
sudo echo -e "[Install]\nWantedBy=multi-user.target" >> streama.service
echo "starting streama"
sudo systemctl start streama
sudo systemctl enable streama
sudo systemctl status streama

echo "configuring gateway"

sudo echo "GATEWAY=192.168.10.30" >> /etc/sysconfig/network
sudo route del -net 0.0.0.0 gw 10.0.2.2 netmask 0.0.0.0 dev eth0

sudo reboot