output "aws_lb" {
  value = aws_lb.main.id
}

output "lb_target" {
  value = aws_lb_target_group.lb_target.id
}

output "lb_target_arn_arn" {
  value = aws_lb_target_group.lb_target.arn
}

output "aws_lb_listener" {
  value = aws_lb_listener.front_end_http.id
}

output "aws_lb_listener_arn" {
  value = aws_lb_listener.front_end_http.arn
}

# output "aws_lb_listener_https" {
#   value = aws_lb_listener.front_end_https.id
# }

# output "aws_lb_listener_https_arn" {
#   value = aws_lb_listener.front_end_https.arn
# }