terraform {
 backend "s3"{
       bucket = "drithirajni-s3-backend"
       region = "us-east-1"
       key = "terraform/remotestate/terraform.tfstate"

       dynamodb_table = "backend1"
     } 
}

module "module-vpc" {
    source = "./Terraform/modules/"
    vpc-cidr-block = "10.0.0.0/16"
    PvtSub-cidr-block = "10.0.2.0/24"
    PubSub-cidr-block = "10.0.1.0/24"
    public_instance_name = "Public-Instance"
    private_instance_name = "Private-Instance" 
    key_pair = "test"
    ami = "ami-0557a15b87f6559cf"
    instance-type = "t2.micro"
}
