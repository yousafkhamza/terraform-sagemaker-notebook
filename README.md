# SageMaker Jupyter-Notebook Instance (Terraform)
[![Build](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

---
## Description
It's a terraform code to build infrastructure of AWS SageMaker Notebook Instance. Maybe, it's helpful to Machine Learning Engineers and Data Engineers to build his projects via this notbook.

----
## Feature
- Easy to create a sagemaker notebook instance 
- It's automatically fetch Default VPC and subnet (if you would like to change Default VPC to custom VPC. Therefore, you can change that VPC id on vpc,tf file.)
- IAM Role and Policy created and attached to that notebook.
- A sample security group created for the same
- You can change the notebook name, instance type and volume size as a variable (either it choose the default value)

----
## Pre-Requests
```
-RedHat-
yum install git -y

-Debian-
sudo apt install git -y
```
- It's need to install terraform (use the below terraform git for installation)
```
git clone https://github.com/yousafkhamza/Terraform_installation.git
cd Terraform_installation
chmod +x terraform.sh
./ terraform.sh
```
- I just used the same with IAM role attached EC2 instance as a infrastrucuture deployment machine. Therfore, if you're using your local machine please create a IAM user and configure the same in "_provider.tf_".
> Using with IAM role instance
```
provider "aws" {
  region = var.region
}
```
> LocalMachine
```
provider "aws" {
  region     = var.region
  access_key = var.access_key            <----------- Please create the same in variable.tf and mention the key in terraform.tfvars
  secret_key = var.secret_key            <----------- Please create the same in variable.tf and mention the key in terraform.tfvars
}
```

---
## How to Get


----
## Output Be Like


----
## Behind the Code


----
## Conclusion


### ⚙️ Connect with Me 

<p align="center">
<a href="mailto:yousaf.k.hamza@gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"/></a>
<a href="https://www.linkedin.com/in/yousafkhamza"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/></a> 
<a href="https://www.instagram.com/yousafkhamza"><img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white"/></a>
<a href="https://wa.me/%2B917736720639?text=This%20message%20from%20GitHub."><img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white"/></a><br />
