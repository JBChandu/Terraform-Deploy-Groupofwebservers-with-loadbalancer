resource "aws_launch_configuration" "launch-config" {
  image_id        = "ami-03b8a287edc0c1253"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web-security.id]

  user_data = <<-EOF
        #!/bin/bash
        echo "You are Learning Terraform, Have a good day" > index.html
        nohup busybox httpd -f -p 8080 &
    EOF
  lifecycle {
    create_before_destroy = true
  }
}