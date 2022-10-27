
# Simple CICD using Jenkins


Build and deploy nodeapp on 2 jenkins slaves (aws-ec2 instance / Container locally)


## Demo

Create CICD using Jenkins, Provision the infrastructure on aws using Terraform, and configure the ec2 with ansible.

## Jenkins
- Create Multibranch Pipeline.
- Create CI to build docker image and push it to dockerhub.
- Create CD to deploy a container from our image once on aws-ec2 slave and another on container locally.
- Configure Github webhook.
- Configure slack integration.



## Terraform
- Create ec2 instance in the default vpc
- Create security group to allow ssh and http
- Upload Public-key using file function.




## Ansible
- Configure aws-ec2 instance
- apt update
- Create directory /home/ubuntu/jenkins_home
- install openjdk-11-jdk
- install dependencies
- add docker repository to apt
- install docker
- Ensure group "docker" exists
- adding ubuntu to docker group
## Authors

- Ahmed Ali


## 🚀 About Me
I'm a DevOps Engineer...
