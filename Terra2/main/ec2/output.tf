output "public_ip" {
    value = aws_instance.practice.public_ip
}

output "private_ip" {
    value = aws_instance.practice.private_ip
}

output "instance_id" {
    value = aws_instance.practice.id
}


