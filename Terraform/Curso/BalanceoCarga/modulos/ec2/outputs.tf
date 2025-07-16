output "instance_id" {
  value = aws_instance.server-test.id
}

output "public_ip" {
  value = aws_instance.server-test.public_ip
}

output "private_ip" {
  value = aws_instance.server-test.private_ip
}

output "ec2_arn" {
  value = aws_instance.server-test.arn
}