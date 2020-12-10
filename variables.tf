variable "vpc_network" {
  default = "10.44.0.0/21"
  description = "IPv4 CIDR for your VPC's network"
}

variable "vpc_name" {
  default = "Oriontest"
  description = "Name of the VPC"
}

variable "public_subnet_1_cidr" {
  default = "10.44.0.0/24"
  description = "First Public Subnet CIDR Block"
}

variable "public_subnet_2_cidr" {
  default = "10.44.1.0/24"
  description = "Second Public Subnet CIDR Block"
}

variable "private_subnet_1_cidr" {
  default = "10.44.4.0/24"
  description = "First Private Subnet CIDR Block"
}

variable "private_subnet_2_cidr" {
  default = "10.44.5.0/24"
  description = "First Private Subnet CIDR Block"
}

variable "public_subnet_1_az" {
  default = "us-east-1a"
  description = "Availability Zone for Public Subnet 1"
}

variable "public_subnet_2_az" {
  default = "us-east-1b"
  description = "Availability Zone for Public Subnet 2"
}

variable "private_subnet_1_az" {
  default = "us-east-1a"
  description = "Availability Zone for Private Subnet 1"
}

variable "private_subnet_2_az" {
  default = "us-east-1b"
  description = "Availability Zone for Private Subnet 2"
}
