output "iam_user_name" {
  value = length(aws_iam_user.this) > 0 ? aws_iam_user.this[0].name : null
}

output "password" {
  value     = length(aws_iam_user_login_profile.this) > 0 ? aws_iam_user_login_profile.this[0].password : null
  sensitive = true
}

output "iam_access_key_id" {
  value     = length(aws_iam_access_key.this) > 0 ? aws_iam_access_key.this[0].id : null
  sensitive = true
}

output "iam_access_key_secret" {
  value     = length(aws_iam_access_key.this) > 0 ? aws_iam_access_key.this[0].secret : null
  sensitive = true
}

# output "iam_user_name" {
#   description = "The name of the created IAM user"
#   value       = aws_iam_user.this.name
# }

# output "password" {
#   value = aws_iam_user_login_profile.this.password
#   sensitive = true
# }

# output "iam_access_key_id" {
#   description = "The access key ID for the user (if created)"
#   value       = var.create_access_key ? aws_iam_access_key.this[0].id : null
# }

# output "iam_access_key_secret" {
#   description = "The secret access key for the user (if created)"
#   value       = var.create_access_key ? aws_iam_access_key.this[0].secret : null
#   sensitive = true
# }