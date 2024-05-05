output "load_balancer_dns_name" {
  value       = aws_lb.demo.dns_name
  description = "FQDN of ALB"
}