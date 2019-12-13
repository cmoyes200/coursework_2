#! /bin/bash
# This script must be run using the sudo command

docker run --rm -d -u root --name jenkins-container \
-p 8080:8080 \
-v ~/jenkins-data:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v "$HOME":/home \
jenkinsci/blueocean

docker exec jenkins-container cat \
/var/jenkins_home/secrets/initialAdminPassword

docker run -d --name sonarqube-container -p 9000:9000 sonarqube

docker exec -it jenkins_container bash
cd /var/jenkins_home
mkdir sonarqube && cd sonarqube
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
unzip sonar-scanner-cli-3.3.0.1492-linux.zip

rm /var/jenkins_home/sonarqube/sonar-scanner-3.3.0.1492-linux/jre/bin/java		
ln -s /usr/lib/jvm/java-1.8-openjdk/bin/java /var/jenkins_home/sonarqube/sonar-scanner-3.3.0.1492-linux/jre/bin/java
exit