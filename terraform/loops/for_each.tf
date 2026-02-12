resource "aws_instance" "webserver" {
    for_each = toset(var.aws_ami) 
    ami = each.value
    instance_type = "t3.micro" 
}

variable "aws_ami" {
     
    default = ["ami-0c1fe732b5494dc14", "ami-0b6c6ebed2801a5cb", "ami-06b5375e3af24939c"] #its a list data type but this does not accept in for_each loop 

}

output "aws_public_ip" {
    value = [for instance in var.aws_ami:
            aws_instance.wevserver[ami].public_ip ]
}

# for each loop will be used where instance have diff configs
#for loop will be used where you need outputs of the instance which are created using loops