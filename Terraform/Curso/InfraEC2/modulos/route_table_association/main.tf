resource "aws_route_table_association" "private_route_table_association"{
    count = length(var.pri_subnet_id)
    route_table_id = var.rtb_id_private
    subnet_id = var.pri_subnet_id[count.index] 
}


resource "aws_route_table_association" "public_route_table_association"{
    count = length(var.pub_subnet_id)
    route_table_id = var.rtb_id_public
    subnet_id = var.pub_subnet_id[count.index] 
}
