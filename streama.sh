echo "installing java"
cd
sudo yum install java -y
java -version

echo "downloading streama"
sudo wget https://github.com/streamaserver/streama/releases/download/v1.10.4/streama-1.10.4.jar
sudo mkdir /opt/streama
sudo mv streama-1.10.4.jar /opt/streama/streama.jar
sudo mkdir /opt/streama/media
sudo chmod 664 /opt/streama/media



