# SageMaker Jupyter-Notebook Instance (Terraform)
[![Build](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

---
## Description
It's a terraform code to build the infrastructure of AWS SageMaker Notebook Instance. Maybe, it's helpful to Machine Learning Engineers and Data Engineers to build their projects via this notebook.

----
## Feature
- Easy to create a sagemaker notebook instance 
- It automatically fetches Default VPC and subnet (if you would like to change Default VPC to custom VPC. Therefore, you can change that VPC id on vpc,tf file.)
- IAM Role and Policy created and attached to that notebook.
- A sample security group created for the same
- You can change the notebook name, instance type, and volume size as a variable (either it chooses the default value)

----
## Pre-Requests
```
-RedHat-
yum install git -y

-Debian-
sudo apt install git -y
```
- It needs to install terraform (use the below terraform git for installation)
```
git clone https://github.com/yousafkhamza/Terraform_installation.git
cd Terraform_installation
chmod +x terraform.sh
./ terraform.sh
```
- I just used the same with the IAM role attached EC2 instance as an infrastructure deployment machine. Therefore, if you're using your local machine please create an IAM user and configure the same in "_provider.tf_".
> Using with IAM role instance be like
```
provider "aws" {
  region = var.region
}
```
> LocalMachine be like
```
provider "aws" {
  region     = var.region
  access_key = var.access_key            <----------- Please create the same in variable.tf and mention the key in terraform.tfvars
  secret_key = var.secret_key            <----------- Please create the same in variable.tf and mention the key in terraform.tfvars
}
```

> Please reconfigure the file when after your cloned this repository. then you may use the below command for terraform initialization
```
terraform init
```
- Basic Knowledge of terraforming

---
## How to Get
```
git clone https://github.com/yousafkhamza/terraform-sagemaker-notebook.git
cd terraform-sagemaker-notebook
```

---
## Changable variables
_terraform.tfvars (Do you need to change any size or name please be change under the values)_
```
region = "ap-south-1"                    <---------------- Please enter your region as you wish
instance_type = "ml.t2.medium"           <---------------- Please enter your instance type as you wish
notebook_name = "my-notebook"            <---------------- Please enter your notebook name as you wish
volume_size = "6"                        <---------------- Please enter your instance volume size as you wish.
```
_vpc.tf (Do you want swiich your custome VPC ID please be change the values under this file)_
```
data "aws_vpc" "default" {
    default = true
#   id = "vpc-04218dfaf2b5c7216"         <--------------- Please comment the above default and uncomment this line and change your vpc id as you wish.
} 
```

---
## Execution
_Exicute the terraform code on your machine with terraform and aws integrated. if you're not configured the same please check the pre-request section and configure the same then please follow the below_
```
terraform init           <------------------- Please configure aws provider (check the pre-requests)
terraform plan
terraform apply
```
_Also, if you would like to remove the created infrastructure please use the below command to destroy the same_
```
terraform destroy
```
_Referance URL:: https://www.terraform.io/docs/cli/run/index.html_

----
## Architecture
![alt_txt](https://i.ibb.co/1dpM9Xg/tf.jpg)

----
## Output Be Like
### Screenshots
_Output_
![alt_txt](https://i.ibb.co/XVPHycH/output.png)
_Notebook instance_
![alt_txt](https://i.ibb.co/t4VY1MC/Screenshot-1.png)


### Output in lines
```
aws_iam_role.sagemaker_role: Creating...
aws_security_group.sg-sgmkr: Creating...
aws_security_group.sg-sgmkr: Creation complete after 1s [id=sg-0c50309cfaff067d7]
aws_iam_role.sagemaker_role: Creation complete after 3s [id=sagemaker_role]
aws_sagemaker_notebook_instance.sgmkr: Creating...
aws_iam_instance_profile.sagemaker_profile: Creating...
aws_iam_role_policy.sagemaker_policy: Creating...
aws_iam_role_policy.sagemaker_policy: Creation complete after 2s [id=sagemaker_role:sagemaker]
aws_iam_instance_profile.sagemaker_profile: Creation complete after 2s [id=sagemaker_profile]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [10s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [20s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [30s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [40s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [50s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [1m0s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [1m10s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [1m20s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [1m30s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [1m40s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [1m50s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [2m0s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [2m10s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [2m20s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [2m30s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [2m40s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [2m50s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [3m0s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Still creating... [3m10s elapsed]
aws_sagemaker_notebook_instance.sgmkr: Creation complete after 3m14s [id=my-notebook]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

aws_sagemaker_notebook_url = "my-notebook-qje6.notebook.ap-south-1.sagemaker.aws"           <----------- Notebook URL.
```

----
## Behind the Code
_sagemaker creation code (Please go and check other codes in GitHub...)
```
resource "aws_sagemaker_notebook_instance" "sgmkr" {
  name          = var.notebook_name
  role_arn      = aws_iam_role.sagemaker_role.arn
  instance_type = var.instance_type
  security_groups = [aws_security_group.sg-sgmkr.id]
  subnet_id = tolist(data.aws_subnet_ids.my_vpc.ids)[1]
  volume_size = var.volume_size

  tags = {
    Name = "SageMaker"
  }
}
```

----
## Conclusio
It's just a terraform code for build a sagemaker notebook instance infrastructure to an AWS account. The code created a sagemaker notebook instance and needful things with a click. Maybe it's helpful to ML/DE Engineers. 
### ⚙️ Connect with Me 

<p align="center">
<a href="mailto:yousaf.k.hamza@gmail.com"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"/></a>
<a href="https://www.linkedin.com/in/yousafkhamza"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/></a> 
<a href="https://www.instagram.com/yousafkhamza"><img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white"/></a>
<a href="https://wa.me/%2B917736720639?text=This%20message%20from%20GitHub."><img src="https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white"/></a><br />
