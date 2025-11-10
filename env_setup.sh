#!/bin/bash
# Environment Setup Script

# Update package list
sudo apt update

# Install Git
sudo apt install -y git

# Install Python3 and pip
sudo apt install -y python3 python3-pip

# Create project directory
mkdir -p ~/projects/my_project

# Navigate to project directory
cd ~/projects/my_project
