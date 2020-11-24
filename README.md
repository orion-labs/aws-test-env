#aws-test-env

A Minimal AWS VPC with all the needed pieces to test the Orion PTT System

## Requirements

* [Terraform](https://www.terraform.io/downloads.html) v0.12 or greater installed in the PATH.

* [AWS API Credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) for 'programmatic access' installed in the default location.

## Instructions

### Initialize Terraform

    terraform init
    
### Create VPC

    terraform apply
    
### Remove VPC

    terraform destroy