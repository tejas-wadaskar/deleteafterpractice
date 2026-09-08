module "ec2" {
    source = "/home/ubuntu/deleteafterpractice/Terra2/main/ec2"
    ami_id =  "ami-0b6c6ebed2801a5cb"
    key_name = "terraform-key"
    instance_type = "t3.micro"
    vpc_sg_ids = module.vpc.sg_id 
    disable_api_termination = true 
    subnet_id = module.vpc.subnet_id 



}

module "vpc" {
    source = "/home/ubuntu/deleteafterpractice/Terra2/main/vpc"
    vpc_cidr = "172.30.0.0/16"
    subnet_cidr = "172.30.128.0/20"
    public_ip = true 
    availability_zone = "us-east-1a" 
}