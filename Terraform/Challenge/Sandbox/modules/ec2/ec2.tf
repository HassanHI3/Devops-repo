resource "aws_instance" "this" {
  ami           = var.instance_ami
  instance_type = var.instance_type
}

resource "aws_instance" "import_instance" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  user_data_replace_on_change = false
}