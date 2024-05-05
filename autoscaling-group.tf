resource "aws_autoscaling_group" "demo" {
  launch_configuration = aws_launch_configuration.launch-config.name
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids
  target_group_arns    = [aws_lb_target_group.asg.arn]
  health_check_type    = "ELB"
  min_size             = 2
  max_size             = 10

  tag {
    key                 = "demo"
    value               = "wedserver-with-asg-lb"
    propagate_at_launch = true
  }

}
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}