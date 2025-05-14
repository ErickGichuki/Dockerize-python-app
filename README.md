- install java
```sudo apt update```
```sudo apt install openjdk-17-jre```
- install jenkins from the official docs

- Install docker as agent
- ```sudo apt update```
    ```sudo apt install docker.io -y```
  
- Grant jenkins and ubuntu user permissions to docker daemon
 ```sudo su - ```
 ```usermod -aG docker jenkins```
 ```usermod -aG docker ubuntu```
 ```systemctl restart docker```

- install sonar-scanner 
```sudo apt update
    sudo apt install -y unzip
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip
    unzip sonar-scanner-cli-*.zip
    sudo mv sonar-scanner-*/ /opt/sonar-scanner
    sudo ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner
```
 - configuring sonarqube: 
 ```sudo adduser sonarqube
     sudo su - sonarqube
     wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip
     unzip *
     chmod -R 755 /home/sonarqube/sonarqube-9.4.0.54424
     chown -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.4.0.54424
     cd sonarqube-9.4.0.54424/bin/linux-x86-64/
     ./sonar.sh start```

- verify ```sonar-scanner --version```

- access the server on ```http://<ip-address>:9000```
- Install docker pipeline, SonarQube scanner
- To integrate sonar with jenkins we'll setup the cred.
- Click on > My Account > Security > Give a token name and > Generate > Copy the token.
- Go back to Jenkins Dashboard under credentials add the secret with secret text kind and id as sonarqube

Role of SonarQube
- Ensuring code quality, security. It detects bugs, enforces cooding standards, measures code coverage, identifies code smells and improves maintainability.
