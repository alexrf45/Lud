output "id" {
  description = "The ID of the instance"
  value       = aws_instance.bounty_instance.id
}

output "new_public_ip" {
  description = "public ip from Elastic IP allocation"
  value       = aws_eip.bounty_eip.public_ip
}

