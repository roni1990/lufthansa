resource "aws_instance" "vm" {
  ami           = "ami-0989fb15ce71ba39e"
  instance_type = "t3.micro"
  count = 3
  user_data = <<-EOF
              #!/bin/bash
              adduser mastora
              mkdir -p /home/mastora/.ssh
              touch /home/mastora/.ssh/authorized_keys
              echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbXvaCsH2I5o5qAn2TB/rhnEX68oLD3qegA/UNqipAfH8wslIuUFk561BDSRKrrIYCZjJvyafR56TrTc6YBDNy8B2fv5Z0VvwdDDVamC032/Wga4tL4+IN56lOVui4a8AB1jIjGIhxiOYpVQmqjmaCEXXN58yRHOBrxaSJLGGVP2itf9lpyRH85aOo+MuDQGjqOpXPTKnQoAjwOZFXW+aTnpnVDZdQkWwEJ7jLiw8+JvdX76uZxQxoksyFnp3LJL6pupI+vmvYvT67BpIwH+EMY2d0nrtIgvWPayj2IlTgzmFN9sB96A10/cV7D4CnHcTce7/tg8KMJ/jLB6H6Hr0/ Eljano@SKANDERBEG" > /home/mastora/.ssh/authorized_keys
              chmod 700 /home/mastora/.ssh
              chmod 600 /home/mastora/.ssh/authorized_keys
              chown -R mastora:mastora /home/mastora/.ssh
              EOF
}

output "public_ips" {
  value = aws_instance.vm[*].public_ip
}