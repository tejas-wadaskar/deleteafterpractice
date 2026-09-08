resource "aws_vpc" "practice" { 
    cidr_block = var.vpc_cidr 
}

resource "aws_subnet" "tejas_subnet" {
    vpc_id = aws_vpc.practice.id 
    cidr_block = var.subnet_cidr 
    map_public_ip_on_launch = var.public_ip
    availability_zone = var.availability_zone

}

resource "aws_security_group" "tejas_sg" {
    vpc_id = aws_vpc.practice.id 

    ingress {
        from_port = 80 
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080 
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0 
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }



}