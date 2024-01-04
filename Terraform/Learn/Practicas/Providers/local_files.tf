resource "local_file" "Productos" {
    count = 5
    content = "Lista de productos para el mes"
    filename = "productos-${random_string.sufijo[count.index].id}.txt"
}