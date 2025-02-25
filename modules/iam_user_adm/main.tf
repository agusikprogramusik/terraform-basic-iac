resource "aws_iam_user" "user" {
  name = var.user_name
}

resource "aws_iam_user_policy" "administator_access_policy" {
  name   = "administator_access_policy"
  user   = aws_iam_user.user.name
  policy = file(var.administator_access_policy_file)
}