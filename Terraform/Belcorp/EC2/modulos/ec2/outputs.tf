output "instance_id" {
  value = aws_instance.server-test.id
}

output "public_ip" {
  value = aws_eip.ec2_eip.public_ip
}

output "private_ip" {
  value = aws_instance.server-test.private_ip
}