resource "aws_iam_user" "user" {
  name = var.user_name
}

resource "aws_iam_user_policy" "ec2_policy" {
  name   = "ec2_policy"
  user   = aws_iam_user.user.name
  policy = file(var.ec2_policy_file)
}

resource "aws_iam_user_policy" "s3_policy" {
  name   = "s3_policy"
  user   = aws_iam_user.user.name
  policy = file(var.s3_policy_file)
}