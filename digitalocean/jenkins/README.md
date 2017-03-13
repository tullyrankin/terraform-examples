# Digital Ocean Droplet + Jenkins
This example spins up a new Centos 7 droplet in Digital Ocean running Jenkins inside a Docker container.

## Prerequisites
Move the file terraform.tfvars.example to terraform.tfvars and update accordingly.

## How to run:
The below will create the plan and apply the changes.

    terraform plan
    terraform apply

## Initial Setup
Jenkins will get installed with a random admin password. You will need this to log into the system for the first time.

You can retrieve the initial password by running the following:

    ssh root@$(terraform output | grep Jenkins_IP | awk '{print $3}') -- cat /var/lib/docker/volumes/jenkins_home/_data/secrets/initialAdminPassword 

### Jenkins Server Information
You can retrieve the IP and URL of the Jenkins server by running the following:

    terraform output

The output should show something similiar to the following:

    Jenkins_IP = 138.197.212.130
    Jenkins_URL = http://138.197.212.130

## Destroy Resources
Once you are done with the Jenkins server and resources you can destroy them by running the following:

    terraform plan -destroy -out=terraform.tfplan
    terraform apply terraform.tfplan
