output "user_name" {
  value       = local.username
  description = "Normalized IAM user name"
}

output "user_arn" {
  value       = join("", aws_iam_user.default.*.arn)
  description = "The ARN assigned by AWS for this user"
}

output "user_unique_id" {
  value       = join("", aws_iam_user.default.*.unique_id)
  description = "The unique ID assigned by AWS"
}

output "access_key_id" {
  value       = try(join("", local.access_key.*.id), "")
  description = "The access key ID"
}

output "secret_access_key" {
  sensitive   = true
  value       = try(join("", local.access_key.*.secret), "")
  description = "The secret access key. This will be written to the state file in plain-text"
}

output "ses_smtp_password_v4" {
  sensitive   = true
  value       = try(join("", compact(local.access_key.*.ses_smtp_password_v4)), "")
  description = "The secret access key converted into an SES SMTP password by applying AWS's Sigv4 conversion algorithm"
}

output "pgp_key" {
  description = "PGP key used to encrypt sensitive data for this user"
  value       = var.pgp_key
}

output "keybase_credentials_decrypt_command" {
  # https://stackoverflow.com/questions/36565256/set-the-aws-console-password-for-iam-user-with-terraform
  description = "Command to decrypt the Keybase encrypted password. Returns empty string if pgp_key is not from keybase"
  value       = local.keybase_credentials_decrypt_command
}

output "keybase_credentials_pgp_message" {
  description = "PGP encrypted message (e.g. suitable for email exchanges). Returns empty string if pgp_key is not from keybase"
  value       = local.keybase_credentials_pgp_message
}
