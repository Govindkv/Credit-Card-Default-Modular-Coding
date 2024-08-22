# Research_Deployment_Practices
## Credit Card Default Prediction Project on AWS

## Workflows
1.Update config.yaml
2.params.yaml
3.Update entity 
4.Update the configuration manager in src config 
5.Update the components 
6.Update the pipeline 
7.Update the main.py 
8.Update the app.py



This project predicts credit card default statuses using a machine learning model. The deployment is handled on an AWS EC2 instance. This guide provides instructions on setting up the environment, deploying the application, and configuring the necessary services on AWS.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [AWS Setup](#aws-setup)
3. [Deploying the Project](#deploying-the-project)
4. [Running the Application](#running-the-application)
5. [Cleanup](#cleanup)
6. [Troubleshooting](#troubleshooting)

## Prerequisites

Before starting, ensure you have the following:
- An AWS account.
- Basic knowledge of AWS services.
- Installed AWS CLI and configured it with your AWS credentials.
- A local copy of the project.

## AWS Setup

### 1. Launching an EC2 Instance
1. Log in to the AWS Management Console.
2. Navigate to the **EC2 Dashboard**.
3. Click **Launch Instance**.
4. Choose an Amazon Machine Image (AMI) (e.g., Ubuntu 22.04 LTS).
5. Select an instance type (e.g., t2.micro for free-tier eligibility).
6. Configure instance details, then click **Next: Add Storage**.
7. Add storage if necessary, then click **Next: Add Tags**.
8. (Optional) Add a tag for easier identification.
9. Configure security groups:
    - Add a rule to allow HTTP (port 80).
    - Add a rule to allow SSH (port 22).
10. Review and launch the instance.
11. Download the key pair (.pem file) and keep it secure.

### 2. Connecting to Your EC2 Instance
1. Open your terminal or command prompt.
2. Navigate to the directory containing your `.pem` file.
3. Connect to the instance using SSH:
   ```bash
   ssh -i "your-key.pem" ubuntu@ec2-xx-xx-xx-xx.compute-1.amazonaws.com
   ```
4. After logging in, update the package list and install required dependencies:
   ```bash
   sudo apt-get update
   sudo apt-get install python3-pip python3-venv git
   ```

## Deploying the Project

### 1. Clone the Repository
1. Clone your project repository to the EC2 instance:
   ```bash
   git clone https://github.com/Govindkv/your-repository.git
   cd your-repository
   ```

### 2. Set Up a Python Virtual Environment
1. Create a virtual environment:
   ```bash
   python3 -m venv venv
   ```
2. Activate the virtual environment:
   ```bash
   source venv/bin/activate
   ```
3. Install the required Python packages:
   ```bash
   pip install -r requirements.txt
   ```

### 3. Set Up the Environment Variables
1. Create a `.env` file in your project directory and add the necessary environment variables:
   ```env
   MODEL_FILE_PATH=artifacts/model_training/models/model.pkl
   SCALER_PATH=artifacts/model_training/models/scaler.pkl
   ```

## Running the Application

### 1. Run the Application
1. If the `artifacts` directory is missing, the application will automatically trigger model training by running `python main.py`. Otherwise, it will load the existing model and scaler.
   ```bash
   python app.py
   ```

2. The application will start running on port 8080. You can access it by entering the following in your web browser:
   ```url
   http://ec2-xx-xx-xx-xx.compute-1.amazonaws.com:8080
   ```

### 2. Set Up Gunicorn and Nginx (Optional for Production)
1. Install Gunicorn:
   ```bash
   pip install gunicorn
   ```
2. Run the application using Gunicorn:
   ```bash
   gunicorn --bind 0.0.0.0:8080 app:app
   ```
3. Install Nginx and configure it to proxy requests to Gunicorn.

## Cleanup

### 1. Terminate EC2 Instance
1. Once you're done, terminate the EC2 instance to avoid unnecessary charges:
   - Go to the **EC2 Dashboard**.
   - Select your instance and click **Terminate**.

### 2. Remove Unused Resources
1. Delete any associated resources like Elastic IPs or S3 buckets if they are no longer needed.

## Troubleshooting

- **SSH Issues**: Ensure that the security group allows SSH access and you’re using the correct `.pem` file.
- **Application Errors**: Check the log output for any specific error messages, and ensure all dependencies are installed.

## Deploymen_Flow:
#1. IAM->Add user (ccd_prediction)->Attach policies-(1.AmazonEC2ContainerRegistryFullAccess 2.AmazonEC2FullAccess)
-> Click ccd_prediction->Security credential->access keys->CLI(Check mark)->next->create access->keys->downloadd csv

#2. ECR->Create repository->copy uri (011528263568.dkr.ecr.us-west-2.amazonaws.com/ccd_prediction)

#3. EC2-> Launch instances->name->ubuntu->keypair->allow http and https->30 gb->view instance->instance id->connect->connect

# Open EC2 and Install docker in EC2 Machine:
#optinal

sudo apt-get update -y

sudo apt-get upgrade

#required

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker ubuntu

newgrp docker

- Self-hosted-Runner configuration

setup secrets:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION
- AWS_ECR_LOGIN_URI
- ECR_REPOSITORY_NAME

- Push main.yaml


