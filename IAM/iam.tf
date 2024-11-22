data "aws_caller_identity" "current" {}

resource "aws_iam_user" "this" {
  count = terraform.workspace == "stage" || terraform.workspace == "prod" ? 1 : 0

  name          = var.name
  force_destroy = var.force_destroy
}

resource "aws_iam_user_login_profile" "this" {
  count                   = length(aws_iam_user.this) > 0 ? 1 : 0
  user                    = aws_iam_user.this[0].name
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
}

resource "aws_iam_access_key" "this" {
  count =  length(aws_iam_user.this) > 0 && var.create_access_key ? 1 : 0
  user  = aws_iam_user.this[0].name
}

resource "aws_iam_account_password_policy" "this" {
  minimum_password_length      = var.password_length
  max_password_age             = 180
  require_uppercase_characters = true
  require_lowercase_characters = true
  require_numbers              = true
  require_symbols              = true
  allow_users_to_change_password = true
}

resource "aws_iam_user_policy" "change_password_policy" {
  count = length(aws_iam_user.this) > 0 ? 1 : 0

  user = aws_iam_user.this[0].name

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "iam:ChangePassword",
        "Resource": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${aws_iam_user.this[0].name}"
      }
    ]
  })
}
