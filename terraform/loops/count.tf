resource "aws_instance" "webserver" {
    count = 3
    ami = "ami-0c1fe732b5494dc14"
    instance_type = "t3.micro"

}

#count loop will be used where you have to create instances with same configuration