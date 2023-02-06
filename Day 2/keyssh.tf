resource "tls_private_key" "private-key" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "sshKey" {
  key_name   = var.key-name
  public_key = tls_private_key.private-key.public_key_openssh
  provisioner "local-exec" {
    command = <<-EOT
        echo '${tls_private_key.private-key.private_key_pem}' > ${aws_key_pair.sshKey.key_name}.pem
        chmod 400 ${aws_key_pair.sshKey.key_name}.pem
    EOT
  }
}


# resource "local_file" "ssh_key" {
#   filename = "${aws_key_pair.sshKey.key_name}.pem"
#   content = tls_private_key.private-key.private_key_pem
#   file_permission = 400
# }