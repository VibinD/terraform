## READ ME ##

This repo has sample code which used to run the terraform template against the AWS.

### Prerequisite ### 

1. AWS Account.
2. Create IAM user and capture secure key and access key (https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
3. terraform to be installed on your local machine. ( Watch the video for how to install terraform in mac - https://www.youtube.com/watch?v=SkKtoANmnbM)


###  NOTE - This tutorial works using the terraform version (Terraform v1.0.9). ###  

Details about the module or chapter. The terraform template will be creating the following infrastructure.

Chap 1. Create vpc.

Chap 2. Create vpc, security group.

Chap 3. Create vpc, security group, subnet.

Chap 4. Create vpc, security group, subnet, EC2.

Chap 5. Create App sync


###  How to run ### 

cd to each folder and run the following commands to see the magic

```
cd chap-1
terraform plan
terraform apply // prompt to enter yes or no
// the following command will destroy the infrastructure created by tf template
terraform destroy // prompt to enter yes or no
```


#### How to format the template ####
Run the following command in the folder

```
terraform fmt
```
Run the following command in the file

```
terraform fmt  demo-vpc.tf
```
