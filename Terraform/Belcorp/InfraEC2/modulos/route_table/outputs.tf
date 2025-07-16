output "rtb_id_public" {
    description = "value"
    value = aws_route_table.public_route_table.id
}

output "rtb_id_private" {
    description = "value"
    value = aws_route_table.private_route_table.id
}