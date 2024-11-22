module "iam_user_jayraj" {
  source                  = "./IAM"
  name                    = "jayraj"
  create_access_key       = true
  password_length         = 12
  password_reset_required = true
  force_destroy           = true
  ## use force destroy ture when the user is not critical.
}

module "iam_user_sachine" {
  source                  = "./IAM"
  name                    = "sachine"
  create_access_key       = true
  password_length         = 12
  password_reset_required = true
  force_destroy           = true
  ## use force destroy ture when the user is not critical.
}

output "sachine_credentials" {
  description = "Credentials for Jayraj's IAM user"
  value = {
    password          = module.iam_user_sachine.password,
    access_key_id     = module.iam_user_sachine.iam_access_key_id,
    access_key_secret = module.iam_user_sachine.iam_access_key_secret
  }
  sensitive = true
}

module "iam_user_jigar" {
  source                  = "./IAM"
  name                    = "Jigar"
  create_access_key       = false
  password_length         = 12
  password_reset_required = true
  force_destroy           = true
  ## use force destroy ture when the user is not critical.
}

output "jigar_credentials" {
  description = "Credentials for Jayraj's IAM user"
  value = {
    password          = module.iam_user_jigar.password,
    access_key_id     = module.iam_user_jigar.iam_access_key_id,
    access_key_secret = module.iam_user_jigar.iam_access_key_secret
  }
  sensitive = true
}


module "iam_user_ragu" {
  source                  = "./IAM"
  name                    = "ragu"
  create_access_key       = false
  password_length         = 12
  password_reset_required = true
  force_destroy           = true
  ## use force destroy ture when the user is not critical.
}

output "ragu_credentials" {
  description = "Credentials for ragu's IAM user"
  value = {
    password          = module.iam_user_ragu.password,
    access_key_id     = module.iam_user_ragu.iam_access_key_id,
    access_key_secret = module.iam_user_ragu.iam_access_key_secret
  }
  sensitive = true
}


module "iam_user_ankit" {
  source                  = "./IAM"
  name                    = "ankit"
  create_access_key       = false
  password_length         = 12
  password_reset_required = true
  force_destroy           = true
  ## use force destroy ture when the user is not critical.
}

output "ankit_credentials" {
  description = "Credentials for ankit's IAM user"
  value = {
    password          = module.iam_user_ankit.password,
    access_key_id     = module.iam_user_ankit.iam_access_key_id,
    access_key_secret = module.iam_user_ankit.iam_access_key_secret
  }
  sensitive = true
}
