#aws-test-env

A Minimal AWS VPC with all the needed pieces to test the Orion PTT System

## Requirements

* Terraform v0.12 or greater installed in the PATH

* AWS API Credentials installed in the default location

## Instructions

### Initialize Terraform

    terraform init
    
### Create VPC

    terraform apply
    
### Remove VPC

    terraform destroy