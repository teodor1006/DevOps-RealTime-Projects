# 🚀 Deployment of 2-tier App on AWS by using Terraform

## 🏠 Architecture
![Architecture](architecture.gif)

## 🖥️ Install Terraform

### Create S3 Backend Bucket
Create an S3 bucket to store the .tfstate file in the remote backend

**Warning!** It is highly recommended that you `enable Bucket Versioning` on the S3 bucket to allow for state recovery in the case of accidental deletions and human error.

**Note**: We will need this bucket name in the later step

### Create a Dynamo DB table for state file locking
- Give the table a name
- Make sure to add a `Partition key` with the name `LockID` and type as `String`

### Generate a public-private key pair for our instances
We need a public key and a private key for our server so please follow the procedure I've included below.

```sh
cd modules/key/
ssh-keygen
```
The above command asks for the key name and then gives `client_key` it will create pair of keys one public and one private. you can give any name you want but then you need to edit the Terraform file

Edit the below file according to your configuration
```sh
vim root/backend.tf
```
Add the below code in root/backend.tf
```sh
terraform {
  backend "s3" {
    bucket = "BUCKET_NAME"
    key    = "backend/FILE_NAME_TO_STORE_STATE.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamoDB_TABLE_NAME"
  }
}
```
### 🏠 Let's set up the variable for our Infrastructure
Create one file with the name of `terraform.tfvars` 
```sh
vim root/terraform.tfvars
```
### 🔐 ACM certificate
Go to AWS console --> AWS Certificate Manager (ACM) and make sure you have a valid certificate in Issued status, if not , feel free to create one and use the domain name on which you are planning to host your application.

### 👨‍💻 Route 53 Hosted Zone
Go to AWS Console --> Route53 --> Hosted Zones and ensure you have a public hosted zone available, if not create one.

Add the below content into the `root/terraform.tfvars` file and add the values of each variable.
```javascript
region = ""
project_name = ""
vpc_cidr                = ""
pub_sub_1a_cidr        = ""
pub_sub_2b_cidr        = ""
pri_sub_3a_cidr        = ""
pri_sub_4b_cidr        = ""
pri_sub_5a_cidr        = ""
pri_sub_6b_cidr        = ""
db_username = ""
db_password = ""
certificate_domain_name = ""
additional_domain_name = ""

```

## ✈️ Now we are ready to deploy our application on the cloud ⛅
get into the project directory 
```sh
cd root
```
👉 let install dependency to deploy the application 

```sh
terraform init 
```

Type the below command to see the plan of the execution 
```sh
terraform plan
```

✨Then, HIT the below command to deploy the application...
```sh
terraform apply 
```

Type `yes`, and it will prompt you for approval..
It will take about 12-15 minutes to configure the whole modules..

After all the modules are created, you can copy the DNS Point from your Load Balancer and test the WebApp.

![WebApp](barista.png)

✨ Finally, REMOVE (Destroy) your project
```sh
terraform destroy --auto-approve
```

**Thank you so much for reading..😅**


