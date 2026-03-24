module "ec2" {
  source        = "/Users/hassanibrahim/devops-learning-repo/Terraform/Challenge/Sandbox/modules/ec2"
  instance_ami  = var.instance_ami
  instance_type = var.instance_type
}