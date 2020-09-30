output "ip" {
    value = aws_eip.ip.public_ip    
}

output "instance_ip_addr" {
    value = aws_instance.example.private_ip
}

output "instance_type" {
    value = aws_instance.example.instance_type
    description = "teste"
}

output "zone" {
    value = aws_instance.example.availability_zone
}