- install java
```sudo apt update```
```sudo apt install openjdk-17-jre```
- install jenkins:
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

- Install docker as agent
- ```sudo apt update```
    ```sudo apt install docker.io -y```
- Grant jenkins and ubuntu user permissions to docker daemon
 ```sudo su - ```
 ```usermod -aG docker jenkins```
 ```usermod -aG docker ubuntu```
 ```systemctl restart docker```

 - configuring sonarqube: 
    ```apt install unzip```
    ```adduser sonarqube```
    ```sudo su - sonarqube```
    ```wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip```
    ```unzip *```
    ```chmod -R 755 /home/sonarqube/sonarqube-9.4.0.54424```
    ```chown -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.4.0.54424```
    ```cd sonarqube-9.4.0.54424/bin/linux-x86-64/```
    ```./sonar.sh start```
- access the server on ```http://<ip-address>:9000```
- Install docker pipeline, SonarQube scanner
- To integrate sonar with jenkins we'll setup the cred.
- Click on > My Account > Security > Give a token name and > Generate > Copy the token.
- Go back to Jenkins Dashboard under credentials add the secret with secret text kind and id as sonarqube

Role of SonarQube
- Ensuring code quality, security. It detects bugs, enforces cooding standards, measures code coverage, identifies code smells and improves maintainability.