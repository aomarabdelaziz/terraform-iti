module "ssh-module" {
  source    = "../ssh"
  algorithm = "RSA"
  rsa_bits  = "4096"
  key_name  = "abdelaziz-ssh-ec2-2-pem"
}