variable "mfa_enabled" {
  description = "Enable MFA for the Cognito User Pool"
  type        = bool
  default     = false
}

variable "email_verification_message" {
  description = "The message for email verification"
  type        = string
  default     = "Your verification code is {####}."
}

variable "email_verification_subject" {
  description = "The subject for email verification"
  type        = string
  default     = "Verify your email"
}

variable "user_pool_policies" {
  description = "Password policies for the Cognito User Pool"
  type = object({
    minimum_length    = number
    require_numbers   = bool
    require_symbols   = bool
    require_uppercase = bool
    require_lowercase = bool
  })
  default = {
    minimum_length    = 8
    require_numbers   = true
    require_symbols   = true
    require_uppercase = true
    require_lowercase = true
  }
}

variable "auto_verified_attributes" {
  description = "Attributes automatically verified by Cognito"
  type        = list(string)
  default     = ["email"]
}
variable "cognito_user_pool_name" {
  description = "The name of the Cognito User Pool"
  type        = string
  default     = "default-user-pool"
}
variable "cognito_user_pool_lambda_trigger" {
  description = "The ARN of the Lambda function for the pre-sign-up trigger (optional)"
  type        = string
  default     = null
}
variable "cognito_user_pool_client_name" {
  description = "The name of the Cognito User Pool Client"
  type        = string
  default     = "default-user-pool-client"
}

variable "cognito_identity_pool_name" {
  description = "The name of the Cognito Identity Pool"
  type        = string
  default     = "default-identity-pool"
}
