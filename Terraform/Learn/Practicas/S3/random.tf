resource "random_string" "sufijo" {
    count = 6
    length = 8
    special = false
    upper = false
    numeric = false
}