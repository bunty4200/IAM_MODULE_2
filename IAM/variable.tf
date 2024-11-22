variable "name" {
  description = "The name of the IAM user"
  type        = string
}

variable "password_length" {
  description = "Length of the IAM user's password"
  type        = number
  default     = 12
}

variable "password_reset_required" {
  description = "Whether the password reset is required on first login"
  type        = bool
  default     = true
}

variable "create_access_key" {
  description = "Whether to create an access key for the IAM user"
  type        = bool
  default     = false
}

variable "force_destroy" {
  description = "Whether to force destroy the IAM user"
  type        = bool
  default     = false
}
