resource "aws_instance" "practice" {
    ami =  var.ami_id
    key_name = var.key_name
    instance_type = var.instance_type
    subnet_id = var.subnet_id 
    vpc_security_group_ids = [var.vpc_sg_ids]
    disable_api_termination = var.disable_api_termination

    tags = {
        name = "example-instance"

    }





}