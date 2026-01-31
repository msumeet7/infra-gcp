#!/bin/bash
set -e

apt update -y
apt install -y openjdk-17-jdk curl gnupg

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ \
  > /etc/apt/sources.list.d/jenkins.list

apt update -y
apt install -y jenkins

systemctl enable jenkins
systemctl start jenkins
