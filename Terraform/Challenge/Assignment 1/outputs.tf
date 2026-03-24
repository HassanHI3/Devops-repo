output "instance_id" {
  value = aws_instance.wordpress.id
}

output "instance_public_ip" {
  value = aws_instance.wordpress.public_ip
}

output "public_dns" {
  value = aws_instance.wordpress.public_dns
}

output "WordPress_url" {
  value = "http://${aws_instance.wordpress.public_ip}"
}
