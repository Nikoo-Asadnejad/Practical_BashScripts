#!/bin/bash

error_exit() {
    echo "Error: $1"
    exit 1
}


echo "Updating package index..."
sudo apt-get update || error_exit "Failed to update package index."

echo "Installing required packages..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common || error_exit "Failed to install prerequisites."

echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg || error_exit "Failed to add Docker's GPG key."

echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || error_exit "Failed to add Docker repository."

echo "Updating package index for Docker repository..."
sudo apt-get update || error_exit "Failed to update package index after adding Docker repository."


echo "Installing Docker..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io || error_exit "Failed to install Docker."

echo "Starting and enabling Docker service..."
sudo systemctl start docker || error_exit "Failed to start Docker service."
sudo systemctl enable docker || error_exit "Failed to enable Docker service."

echo "Adding the current user to the Docker group..."
sudo usermod -aG docker $USER || error_exit "Failed to add user to the Docker group."


echo "Verifying Docker installation..."
docker --version || error_exit "Docker is not installed correctly."
sudo docker run hello-world || error_exit "Failed to run Docker test container."

echo "Docker installation and setup complete! Please log out and log back in for group changes to take effect."
