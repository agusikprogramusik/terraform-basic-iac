variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "dev_user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "dev_user"
}

variable "adm_user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "adm_user"
}