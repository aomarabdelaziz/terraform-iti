output "CustomEIP" {
  value       = aws_eip.CustomEIP.id
  description = "Custom elastic ip we created."
}


output "instance_private_ips" {
  value = aws_instance.public-private-ec2.*.private_ip
}

output "instance_public_ips" {
  value = aws_instance.public-private-ec2.*.public_ip
}
# output "private-key" {
#   value       = tls_private_key.private-key.private_key_pem
#   description = "Private key for SSH authentication"
# }

# output "PublicKey" {
#   value       = tls_private_key.private-key.public_key_openssh
#   description = "Public key for SSH authentication"
# }