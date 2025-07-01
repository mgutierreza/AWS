resource "aws_internet_gateway" "igw_proyecto" {
  vpc_id = var.module.vpc.vpc_id

  tags = merge(
    {
      Name = "${var.tags.Name != "" ? var.tags.Name : "main-igw"}"
    },
  )
}