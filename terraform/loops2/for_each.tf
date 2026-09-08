provider "aws" {
    region = "ap-south-1"
    profile = "configs"
}

resource "aws_instance" "webserver" {
    for_each = toset[var.aws_ami]
    ami = each.value
    instance_type = "t3.micro"

}

variable "aws_ami" { 
    default = ["ami-0cskfsdjfjskajfsd", "ami-423irfisauaiufwsddf", "slakfsaofiwauwrwe"]
}


output "aws_public_ip" {
    value = [for ami in var.aws_ami 
        :aws_instance.webserver[ami].public_ip]
             
}