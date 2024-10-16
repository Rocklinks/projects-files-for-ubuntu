sudo apt update -y

sudo apt install openjdk-17-jre unzip -y
## jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
## jenkins initial passwd file location
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

#### SonarQube
sudo adduser sonarqube
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip
unzip *
sudo chmod -R 755 /home/sonarqube-9.9.0.65466
sudo chowm -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.9.0.65466
cd sonarqube-9.9.0.65466/bin/linux-x86-64
./sonar.sh start

### docker
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins

