output "instance_public_dns" {
    value = aws_instance.my_new_instance_1[*].public_dns
  
}