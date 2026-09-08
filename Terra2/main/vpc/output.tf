output "vpc_id" {
    value = aws_vpc.practice.id
}

output "subnet_id" {
    value = aws_subnet.tejas_subnet.id 
}

output "sg_id" {
    value = aws_security_group.tejas_sg.id
}

output "sg_arn" {
    value = aws_security_group.tejas_sg.arn
}