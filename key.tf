resource "aws_key_pair" "mykeypair" {
    key_name   = var.key_pair
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

