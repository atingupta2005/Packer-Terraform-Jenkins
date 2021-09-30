resource "aws_key_pair" "mykeypair" {
    key_name   = "atingupta2005-terraform-packer"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

