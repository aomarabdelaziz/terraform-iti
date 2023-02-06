resource "aws_instance" "public-ec2-instances" {
  ami                         = var.ami
  instance_type               = var.instance-type
  count                       = length(var.public-ec2-instances)
  subnet_id                   = var.public-subnets[count.index]
  vpc_security_group_ids      = [var.public-ec2-sg-id]
  associate_public_ip_address = "true"
  key_name                    = var.key_name
  #user_data = file("userdata")

  provisioner "remote-exec" {
    #script = "${path.module}/scripts/public-ec2-script"
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "echo 'server {\nlisten 80 default_server;\nlisten [::]:80 default_server;\nserver_name _;\nlocation / {\nproxy_pass ${var.private-load-balancer-dns};\n}\n}' > default",
      "sudo mv default /etc/nginx/sites-enabled/default",
      "sudo systemctl restart nginx",
    ]



    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.key_name}.pem")
      /* script_path = "/home/ec2-user/public-ec2-script" */
      timeout = "1m"
    }

  }

  provisioner "local-exec" {
    command = "echo public-${count.index}: ${self.public_ip} >> ips.txt"
  }


  tags = {
    Name = var.public-ec2-instances[count.index]
  }

}

resource "aws_lb_target_group_attachment" "public-target-group-attachment-1" {
  count            = length(var.public-ec2-instances)
  target_group_arn = var.public-tg-arn
  target_id        = aws_instance.public-ec2-instances[count.index].id
  port             = 80
}


#####################################################################

resource "aws_instance" "private-ec2-instances" {
  ami                    = var.ami
  instance_type          = var.instance-type
  count                  = length(var.private-ec2-instances)
  subnet_id              = var.private-subnets[count.index]
  vpc_security_group_ids = [var.private-ec2-sg-id]
  key_name               = var.key_name
  user_data              = file("${path.module}/scripts/private-ec2-script")

  provisioner "local-exec" {
    command = "echo private-${count.index}: ${self.private_ip} >> ips.txt"
  }


  tags = {
    Name = var.private-ec2-instances[count.index]
  }

}

resource "aws_lb_target_group_attachment" "private-target-group-attachment-1" {
  count            = length(var.private-ec2-instances)
  target_group_arn = var.private-tg-arn
  target_id        = aws_instance.private-ec2-instances[count.index].id
  port             = 80
}


