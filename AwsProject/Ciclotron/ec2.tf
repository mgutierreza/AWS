
resource "aws_instance" "public_instance" {
    ami           = "ami-0a749d160bf052e89"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.private-2b.id
    key_name      = "test-mga"
    iam_instance_profile = data.aws_iam_instance_profile.existing_role.role_name

    vpc_security_group_ids = [aws_default_security_group.SG-CICLOTRON.id]
    tags = {
        Name = "SERVIDOR CICLOTRON"
    }

}