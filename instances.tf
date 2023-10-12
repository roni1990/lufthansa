resource "aws_instance" "vm" {
  ami           = "ami-0989fb15ce71ba39e"
  instance_type = "t3.micro"
  count = 3
  user_data = <<-EOF
              #!/bin/bash
              adduser erjon
              echo "erjon:erjon1" | chpasswd
              usermod -aG sudo erjon
              mkdir -p /home/erjon/.ssh
              touch /home/erjon/.ssh/authorized_keys
              echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxBcckPg1bQxBXiXQes64NP96nH79pA9aqjhm75Ycw8+mZ1vjX8mVmdL0lqqi78xpa+ARDedN5Z3wEf+ynV0rywgKSUu14NV6ptbnd3XrlPQOHEoaWsJywQni+hOAes4Ch4/a7+LGkSlLsFZHcLC27qPzw9OZU9txkJp1X7XjKooEHupX+RL+5TVFx2M0a8GWzeddYQouPjOcOXSYworzdv/extxaLzQx3ioyLfuz4YgUQJoEbAFIzE2lfZH+YwKsohiSvc4x9EN1ls2UEixdu470j1V12v5wTLaWdXudvh684D23/6beKA/xp6sp4GYp5CPdSbg5bl28GL3cr+Eud EL@PC-Limushaj" > /home/erjon/.ssh/authorized_keys
              chmod 700 /home/erjon/.ssh
              chmod 600 /home/erjon/.ssh/authorized_keys
              chown -R erjon:erjon /home/erjon/.ssh
              EOF
}

output "public_ips" {
  value = aws_instance.vm[*].public_ip
}