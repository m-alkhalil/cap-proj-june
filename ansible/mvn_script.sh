#!/bin/bash

echo "Download the JDK 13 Binaries"
sudo wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
sudo tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
sudo mv jdk-13.0.1 /opt/

scho "set java home path"
sudo export JAVA_HOME=/opt/jdk-13.0.1
sudo export PATH=$JAVA_HOME/bin:$PATH



echo "Verify the Java installation"
java -version


# Update package index
sudo apt update

# Install required packages
sudo apt install -y wget tar

# Download Maven 3.6.3
wget https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

# Extract the downloaded archive
tar -xzf apache-maven-3.6.3-bin.tar.gz

# Move the Maven directory to /opt
sudo mv apache-maven-3.6.3 /opt/

# Set up environment variables
sudo bash -c 'cat <<EOF > /etc/profile.d/maven.sh
export M2_HOME=/opt/apache-maven-3.6.3
export MAVEN_HOME=/opt/apache-maven-3.6.3
export PATH=\${M2_HOME}/bin:\${PATH}
EOF'

# Make the script executable
sudo chmod +x /etc/profile.d/maven.sh

# Load the environment variables
source /etc/profile.d/maven.sh

echo "Verify the Maven installation"
mvn -version
