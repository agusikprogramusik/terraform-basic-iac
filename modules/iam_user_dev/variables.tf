variable "user_name" {
  description = "Name of the IAM user"
  type        = string
}

variable "ec2_policy_file" {
  description = "Path to the EC2 policy file"
  type        = string
}

variable "s3_policy_file" {
  description = "Path to the S3 policy file"
  type        = string
}