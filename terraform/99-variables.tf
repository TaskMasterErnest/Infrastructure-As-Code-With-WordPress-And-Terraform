# Envionment Variables
######################################################################################################

variable "name" {
  description = "Base name for resources"
  type        = string
  default     = "iac-wordpress"
}

variable "environment_type" {
  description = "type of the environment we are building"
  type        = string
  default     = "test"
}

variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "eu-west-2"
}

variable "zones" {
  description = "The AWS availability zone to deploy to"
  type        = list(any)
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "default_tags" {
  description = "The default tags to use across all of our resources"
  type        = map(any)
  default = {
    project     = "iac-wordpress"
    environment = "prod"
    deployed_by = "terraform"
  }
}


# Networking Variables
######################################################################################################

# variable "network_trusted_ips" {
#   description = "Optional list if IP addresses which need access, your current IP will be added automatically"
#   type        = list(any)
#   default = [
#   ]
# }

variable "vpc_address_space" {
  description = "The address space of VPC"
  type        = string
  default     = "10.0.0.0/24"
}


# Database Variables
######################################################################################################

variable "database_username" {
  description = "The username for the database"
  type        = string
  default     = "wordpress"
}

variable "database_name" {
  description = "name of database"
  type = string
  default = "wordpress"
}

variable "database_instance_class" {
  description = "name of instance to host database"
  type = string
  default = "db.t3.micro"
}

variable "database_allocated_storage" {
  description = "the allocated storage for the database"
  type = number
  default = 5
}

variable "database_engine" {
  description = "the database engine to use"
  type = string
  default = "mysql"
}

variable "database_engine_version" {
  description = "the databse engine version to use"
  type = string
  default = "5.7"
}

variable "database_parameter_group" {
  description = "the database parameter group to use"
  type = string
  default = "default.mysql5.7"
}

variable "database_skip_final_snapshot" {
  description = "should a final snapshot be created before the database is deleted"
  type = bool
  default = false
}


# Virtual Machine Variables
######################################################################################################

variable "instance_type" {
  description = "The size of the virtual machine"
  type        = string
  default     = "t2.micro"
}

variable "ami_most_recent" {
  description = "should the most recent version of the AMI be used?"
  type        = bool
  default     = true
}

variable "ami_filter_name" {
  description = "Which AMI should be used?"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}


variable "ami_filter_virtualization_type" {
  description = "What type of virtualiztion should we filter on?"
  type        = string
  default     = "hvm"
}

variable "ami_owners" {
  description = "Who owns the AMI we want to use?"
  type        = string
  default     = "099720109477" # Canonical
}


# Web Server and Wordpress Variables
######################################################################################################

variable "min_number_of_web_servers" {
  description = "How many web servers do we want to deploy"
  type        = number
  default     = 2
}

variable "max_number_of_web_servers" {
  description = "How many web servers do we want to deploy"
  type        = number
  default     = 4
}

variable "wp_title" {
  description = "The title of the Wordpress site"
  type        = string
  default     = "IAC Wordpress"
}

variable "wp_admin_user" {
  description = "The username for the Wordpress admin account"
  type        = string
  default     = "admin"
}

variable "wp_admin_email" {
  description = "The email address for the Wordpress admin account"
  type        = string
  default     = "test@test.com"
}