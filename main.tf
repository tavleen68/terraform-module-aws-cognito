resource "aws_cognito_user_pool" "user_pool" {
  name = var.cognito_user_pool_name

  # Policies
  password_policy {
    minimum_length    = var.user_pool_policies.minimum_length
    require_numbers   = var.user_pool_policies.require_numbers
    require_symbols   = var.user_pool_policies.require_symbols
    require_uppercase = var.user_pool_policies.require_uppercase
    require_lowercase = var.user_pool_policies.require_lowercase
  }

  # Email verification
  email_verification_message = var.email_verification_message
  email_verification_subject = var.email_verification_subject

  # Auto-verified attributes
  auto_verified_attributes = var.auto_verified_attributes

  # MFA configuration
  mfa_configuration = var.mfa_enabled ? "ON" : "OFF"

  lambda_config {
    # Define Lambda triggers as needed
    pre_sign_up = var.cognito_user_pool_lambda_trigger
  }

  # Schema
  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = true
    mutable             = false
  }

  schema {
    attribute_data_type = "String"
    name                = "phone_number"
    required            = false
    mutable             = true
  }
}
resource "aws_cognito_user_pool_client" "user_pool_client" {
  name         = var.cognito_user_pool_client_name
  user_pool_id = aws_cognito_user_pool.user_pool.id
}
resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name               = var.cognito_identity_pool_name
  allow_unauthenticated_identities = false
}
