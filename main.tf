terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "Instancia1" {
  ami           = "ami-0080974613cf1e8c7"
  instance_type = "t2.micro"
  key_name = "terraform"
  vpc_security_group_ids = ["sg-05515e429adccc534"]
  
  tags = {
    Name = "Instancia1"
  }
}
resource "aws_instance" "Instancia2nginx" {
  ami           = "ami-0080974613cf1e8c7"
  instance_type = "t2.micro"
  key_name = "terraform"
  vpc_security_group_ids = ["sg-05515e429adccc534"]
  user_data = file("userdata.sh")       
  
  tags = {
    Name = "Instancia2nginx"
  }
}

resource "aws_s3_bucket" "terraform-s3-bucket" {
    bucket = "terraform-bucket"
    
  
    tags = {
        Name = "terraform-bucketgit "
        Environment = "Dev"
    }
}

